-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `proc_basket`(
	IN in_user_id VARCHAR(20),
	IN in_item_id VARCHAR(20),
	IN in_item_array VARCHAR(600),
	IN in_item_array_count INT(5),
	IN in_action_code VARCHAR(20)
)
BEGIN
	DECLARE proc_status varchar(10);
	DECLARE _item_details_ VARCHAR(100);
	DECLARE array_delim VARCHAR(2) DEFAULT ',';
	DECLARE item_delim VARCHAR(2) DEFAULT '=';
	DECLARE counter INT DEFAULT 0;
	DECLARE _item_id_ VARCHAR(100);
	DECLARE _item_quantity_ VARCHAR(100);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_basket',
			concat(',in_user_id : ', ifnull(in_user_id,'NULL'),
					',in_item_id : ', ifnull(in_item_id,'NULL'),
					',in_action_code : ', ifnull(in_action_code,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
    END;

	START TRANSACTION;
	
	IF in_action_code = 'saveorupdate' THEN
		
		IF in_item_array_count > 0 THEN
			forEachItem: LOOP
				SET counter = counter + 1;

				SELECT split_string(in_item_array, array_delim, counter) 
					INTO _item_details_;

				SET _item_id_ = substring_index(_item_details_, item_delim, 1);
				SET _item_quantity_ = substring_index(_item_details_, item_delim, -1);

				INSERT INTO tbl_user_cart (user_id, item_id, quantity, item_addition_time)
						(SELECT in_user_id,_item_id_,_item_quantity_, now()
							FROM dual
								WHERE (_item_quantity_ <> (SELECT quantity FROM tbl_user_cart
															WHERE user_id = in_user_id 
																AND item_id = _item_id_)
										or (SELECT EXISTS( SELECT 1 FROM tbl_user_cart 
													WHERE user_id = in_user_id
														AND item_id = _item_id_)) = 0))
						ON DUPLICATE KEY UPDATE quantity = quantity + _item_quantity_;
				
				IF counter = in_item_array_count THEN
					LEAVE forEachItem;
				END IF;

			END LOOP forEachItem;
		END IF;
	
		SET proc_status = 'SUCCESS';
		SELECT proc_status;

	ELSEIF in_action_code = 'save' THEN

		delete from tbl_user_cart where
					user_id = in_user_id;

		IF in_item_array_count > 0 THEN

			forEachItem: LOOP
				SET counter = counter + 1;

				SELECT split_string(in_item_array, array_delim, counter) 
					INTO _item_details_;

				SET _item_id_ = substring_index(_item_details_, item_delim, 1);
				SET _item_quantity_ = substring_index(_item_details_, item_delim, -1);

				INSERT INTO tbl_user_cart (user_id, item_id, quantity, item_addition_time)
						VALUES (in_user_id,_item_id_,_item_quantity_, now())
						ON DUPLICATE KEY UPDATE quantity = quantity + _item_quantity_;

				IF counter = in_item_array_count THEN
					LEAVE forEachItem;
				END IF;

			END LOOP forEachItem;
		END IF;
		
		SET proc_status = 'SUCCESS';
		SELECT proc_status;

	ELSEIF in_action_code = 'delete' THEN

		delete from tbl_user_cart where
					user_id = in_user_id and item_id = in_item_id;

		SET proc_status = 'SUCCESS';
		SELECT proc_status;

	END IF;

	COMMIT;
	
	select 
		ti.item_id,
		ct.category_name,
		ti.item_code,
		ti.item_name,
		ti.shape,
		cr.quantity,
		ti.dimensions,
		ti.color,
		ti.mean_rating,
		ti.price_carat,
		ti.carat_weight,
		ti.price_carat * ti.carat_weight item_price,
		ti.currency,
		ti.description,
		og.origin_name,
		tr.treatment_name
	from
		tbl_item ti,
		tbl_category ct,
		tbl_origin og,
		tbl_treatment tr,
		tbl_user_cart cr
	WHERE ti.category_id = ct.category_id
			and og.origin_id = ti.origin_id
			and tr.treatment_id = ti.treatment_id
			and cr.user_id = in_user_id
			and cr.item_id = ti.item_id;

END
