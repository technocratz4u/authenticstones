-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checkout_add_address`(
	IN in_user_id BIGINT(20),
	IN in_name VARCHAR(100),
	IN in_address VARCHAR(300),
	IN in_city VARCHAR(45),
	IN in_state VARCHAR(45),
	IN in_pin VARCHAR(45),
	IN in_country VARCHAR(45),
	IN in_contact_number VARCHAR(20)

)
BEGIN
	
	DECLARE proc_status varchar(10);
	DECLARE _user_address_id_ BIGINT(20);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;

        INSERT INTO 
			tbl_err_log(proc_name, params, creation_time)
		VALUES
			('proc_checkout_add_address',
			concat('in_user_id : ', ifnull(in_user_id,'NULL'), ', in_name : ', ifnull(in_name,'NULL'), 
			', in_address : ', ifnull(in_address,'NULL'), ', in_country : ', ifnull(in_country,'NULL'),
			', in_state : ', ifnull(in_state,'NULL'), ', in_city : ', ifnull(in_city,'NULL'),
			', in_pin : ', ifnull(in_pin,'NULL'), ', in_contact_number : ', ifnull(in_contact_number,'NULL')),
			now());

        SET proc_status = 'ERROR';
        select proc_status;
        -- select err_debug_str;
    END;

	START TRANSACTION;

		INSERT INTO tbl_user_address
				(user_id, full_name,contact_number,address,city,state,pin,country)
		VALUES
			(in_user_id,in_name,in_contact_number,in_address,in_city,in_state,in_pin, in_country);

	COMMIT;

	SET proc_status = 'SUCCESS';
	select proc_status;

	SELECT user_address_id, user_id, full_name, contact_number, 
	address, city, state, pin, country
	FROM tbl_user_address 
	WHERE user_id = in_user_id
	AND full_name = in_name
	AND contact_number = in_contact_number
	AND address = in_address
	AND city = in_city
	AND state = in_state
	AND pin = in_pin
	AND country = in_country;


END
