-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checkout_item_details`(
IN in_user_id BIGINT(20)
)
BEGIN

select t_i.item_id, t_i.item_code, t_i.item_name, t_i.price_carat, t_i.carat_weight,
t_i.price_carat * t_i.carat_weight item_price,
t_c.user_cart_id, t_c.quantity
from tbl_user_cart t_c, tbl_item t_i
where t_c.item_id = t_i.item_id
and t_c.user_id = in_user_id;

END
