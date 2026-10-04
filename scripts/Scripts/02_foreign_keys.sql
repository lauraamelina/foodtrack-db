USE foodtrack;
GO

ALTER TABLE products
	ADD CONSTRAINT FK_products_foodtrucks
	FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks (foodtruck_id)
	
ALTER TABLE orders
    ADD CONSTRAINT FK_orders_foodtrucks
    FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks (foodtruck_id);
 
ALTER TABLE order_items
    ADD CONSTRAINT FK_order_items_orders
    FOREIGN KEY (order_id) REFERENCES orders (order_id);
 
ALTER TABLE order_items
    ADD CONSTRAINT FK_order_items_products
    FOREIGN KEY (product_id) REFERENCES products (product_id);

ALTER TABLE locations
    ADD CONSTRAINT FK_locations_foodtrucks
    FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks (foodtruck_id);
GO 