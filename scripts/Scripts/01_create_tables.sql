USE foodtrack;
GO

CREATE TABLE foodtrucks (
	foodtruck_id INT NOT NULL,
	name NVARCHAR(100) NOT NULL,
	cuisine_type NVARCHAR(50) NOT NULL,
	city NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_foodtrucks PRIMARY KEY (foodtruck_id),
	CONSTRAINT UQ_foodtrucks_name UNIQUE (name) 
)

CREATE TABLE products (
    product_id    INT            NOT NULL,
    foodtruck_id  INT            NOT NULL,
    name          NVARCHAR(100)  NOT NULL,
    price         DECIMAL(10,2)  NOT NULL,
    stock         INT            NOT NULL CONSTRAINT DF_products_stock DEFAULT 0,
    CONSTRAINT PK_products PRIMARY KEY (product_id),
    CONSTRAINT UQ_products_foodtruck_name UNIQUE (foodtruck_id, name),
    CONSTRAINT CK_products_price CHECK (price > 0),
    CONSTRAINT CK_products_stock CHECK (stock >= 0)
);

CREATE TABLE orders (
    order_id      INT            NOT NULL,
    foodtruck_id  INT            NOT NULL,
    order_date    DATE           NOT NULL,
    status        NVARCHAR(20)   NOT NULL,
    total         DECIMAL(10,2)  NOT NULL,
    CONSTRAINT PK_orders PRIMARY KEY (order_id),
    CONSTRAINT CK_orders_status CHECK (status IN ('pendiente', 'entregado', 'cancelado')),
    CONSTRAINT CK_orders_total CHECK (total >= 0)
);

CREATE TABLE order_items (
    order_item_id INT            NOT NULL,
    order_id      INT            NOT NULL,
    product_id    INT            NOT NULL,
    quantity      INT            NOT NULL,
    CONSTRAINT PK_order_items PRIMARY KEY (order_item_id),
    CONSTRAINT UQ_order_items_order_product UNIQUE (order_id, product_id),
	CONSTRAINT CK_order_items_quantity CHECK (quantity > 0)
);


CREATE TABLE locations (
    location_id   INT            NOT NULL,
    foodtruck_id  INT            NOT NULL,
    location_date DATE           NOT NULL,
    zone          NVARCHAR(50)   NOT NULL,
    CONSTRAINT PK_locations PRIMARY KEY (location_id),
    CONSTRAINT UQ_locations_foodtruck_date UNIQUE (foodtruck_id, location_date)
);









