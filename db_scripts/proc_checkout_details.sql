-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checkout_details`(
IN in_user_id BIGINT(20)
)
BEGIN

select 
    usr.full_name,
    usr.email,
	addr.user_address_id,
    addr.full_name as 'addr_full_name',
    addr.address,
    addr.city,
    addr.state,
	addr.country,
    addr.pin,
    addr.contact_number,
    addr.alternate_number,
    addr.is_primary
from
    tbl_user usr,
    tbl_user_address addr
where
    usr.user_id = addr.user_id
	and usr.user_id = in_user_id;


END
