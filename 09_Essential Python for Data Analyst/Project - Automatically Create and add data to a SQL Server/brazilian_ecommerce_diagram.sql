CREATE TABLE [customers] (
  [customer_id] varchar(50) PRIMARY KEY,
  [customer_unique_id] varchar(50) NOT NULL,
  [customer_zip_code_prefix] varchar(50),
  [customer_city] varchar(50),
  [customer_state] varchar(50)
)
GO

CREATE TABLE [geolocation] (
  [geolocation_zip_code_prefix] varchar(50) NOT NULL,
  [geolocation_lat] float,
  [geolocation_lng] float,
  [geolocation_city] varchar(50),
  [geolocation_state] varchar(50)
)
GO

CREATE TABLE [order_items] (
  [order_id] varchar(50) NOT NULL,
  [order_item_id] int NOT NULL,
  [product_id] varchar(50) NOT NULL,
  [seller_id] varchar(50) NOT NULL,
  [shipping_limit_date] datetime,
  [price] float,
  [freight_value] float
)
GO

CREATE TABLE [order_payments] (
  [order_id] varchar(50) NOT NULL,
  [payment_sequential] int,
  [payment_type] varchar(50),
  [payment_installments] int,
  [payment_value] float
)
GO

CREATE TABLE [order_reviews] (
  [review_id] varchar(50) NOT NULL,
  [order_id] varchar(50) NOT NULL,
  [review_score] int,
  [review_comment_title] nvarchar(255),
  [review_comment_message] nvarchar(255),
  [review_creation_date] datetime,
  [review_answer_timestamp] datetime
)
GO

CREATE TABLE [orders] (
  [order_id] varchar(50) PRIMARY KEY,
  [customer_id] varchar(50) NOT NULL,
  [order_status] varchar(50),
  [order_purchase_timestamp] datetime,
  [order_approved_at] datetime,
  [order_delivered_carrier_date] datetime,
  [order_delivered_customer_date] datetime,
  [order_estimated_delivery_date] datetime
)
GO

CREATE TABLE [products] (
  [product_id] varchar(50) PRIMARY KEY,
  [product_category_name] varchar(50),
  [product_name_lenght] float,
  [product_description_lenght] float,
  [product_photos_qty] float,
  [product_weight_g] float,
  [product_length_cm] float,
  [prouct_height_cm] float,
  [product_width_cm] float
)
GO

CREATE TABLE [sellers] (
  [seller_id] varchar(50) PRIMARY KEY,
  [seller_zip_code_prefix] varchar(50),
  [seller_city] varchar(50),
  [seller_state] varchar(50)
)
GO

ALTER TABLE [order_payments] ADD FOREIGN KEY ([order_id]) REFERENCES [orders] ([order_id])
GO

ALTER TABLE [order_items] ADD FOREIGN KEY ([order_id]) REFERENCES [orders] ([order_id])
GO

ALTER TABLE [customers] ADD FOREIGN KEY ([customer_zip_code_prefix]) REFERENCES [geolocation] ([geolocation_zip_code_prefix])
GO

ALTER TABLE [sellers] ADD FOREIGN KEY ([seller_zip_code_prefix]) REFERENCES [geolocation] ([geolocation_zip_code_prefix])
GO

ALTER TABLE [customers] ADD FOREIGN KEY ([customer_id]) REFERENCES [orders] ([order_id])
GO

ALTER TABLE [order_items] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([product_id])
GO

ALTER TABLE [order_items] ADD FOREIGN KEY ([seller_id]) REFERENCES [sellers] ([seller_id])
GO

CREATE TABLE [orders_order_reviews] (
  [orders_order_id] varchar(50),
  [order_reviews_order_id] varchar(50),
  PRIMARY KEY ([orders_order_id], [order_reviews_order_id])
);
GO

ALTER TABLE [orders_order_reviews] ADD FOREIGN KEY ([orders_order_id]) REFERENCES [orders] ([order_id]);
GO

ALTER TABLE [orders_order_reviews] ADD FOREIGN KEY ([order_reviews_order_id]) REFERENCES [order_reviews] ([order_id]);
GO

