--9-1
--select stock, reorder from bb_product where idProduct = 4;
--update bb_product set stock = 25 where idProduct = 4;
--select * from bb_product_request;
--ROLLBACK
--alter trigger bb_reorder_trg disable;

--9-2
--insert into bb_product_request (idRequest, idProduct, dtRequest, qty) values (3, 5, sysdate, 45); COMMIT;
--select stock, reorder from bb_product where idProduct = 5;
--select * from bb_product_request where idProduct = 5;
--update bb_product_request set dtrecd = SYSDATE, cost = 225 where idProduct = 3;
--select * from bb_product_request where idProduct = 5;
--select stock, reorder from bb_product where idProduct = 5;
--ROLLBACK


--9-3
--insert into bb_product_request (idrequest, idproduct, dtrequest, qty, dtrecd, cost) values (4, 5, sysdate, 45, '15-JUN-2012', 225);
--update bb_product set stock = 86 where idproduct = 5;
--commit;
--update bb_product_request set dtrecd = NULL where idrequest = 4;
--alter trigger bb_reqfill_trg disable;