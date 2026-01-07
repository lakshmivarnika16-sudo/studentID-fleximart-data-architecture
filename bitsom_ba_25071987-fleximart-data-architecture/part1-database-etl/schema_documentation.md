# Database Schema Documentation – FlexiMart

## 1. Entity–Relationship Description

### ENTITY: customers
**Purpose:** Stores customer information for the FlexiMart system.

**Attributes:**
- customer_id: Unique identifier for each customer (Primary Key)
- first_name: Customer's first name
- last_name: Customer's last name
- email: Customer email address (unique)
- phone: Customer contact number
- city: City where the customer resides
- registration_date: Date when the customer registered

**Relationships:**
- One customer can place MANY orders  
  (1 : M relationship with orders table)

---

### ENTITY: products
**Purpose:** Stores product details available for sale.

**Attributes:**
- product_id: Unique identifier for each product (Primary Key)
- product_name: Name of the product
- category: Product category (standardized)
- price: Price of the product
- stock_quantity: Available stock quantity

**Relationships:**
- One product can appear in MANY order_items  
  (1 : M relationship with order_items table)

---

### ENTITY: orders
**Purpose:** Stores order-level information.

**Attributes:**
- order_id: Unique identifier for each order (Primary Key)
- customer_id: Customer who placed the order (Foreign Key)
- order_date: Date of the order
- total_amount: Total order value
- status: Order status (Pending, Completed, etc.)

**Relationships:**
- Each order belongs to ONE customer  
- One order can have MANY order_items

---

### ENTITY: order_items
**Purpose:** Stores item-level details for each order.

**Attributes:**
- order_item_id: Unique identifier (Primary Key)
- order_id: Associated order (Foreign Key)
- product_id: Associated product (Foreign Key)
- quantity: Quantity ordered
- unit_price: Price per unit
- subtotal: quantity × unit_price

**Relationships:**
- Many order_items belong to ONE order
- Many order_items reference ONE product

---

## 2. Normalization Explanation (3NF)

The FlexiMart database design follows Third Normal Form (3NF) to ensure data integrity and reduce redundancy.  
In this schema, each table stores data related to a single entity, and all non-key attributes are fully dependent on the primary key.

**Functional Dependencies:**
- customer_id → first_name, last_name, email, phone, city, registration_date
- product_id → product_name, category, price, stock_quantity
- order_id → customer_id, order_date, total_amount, status
- order_item_id → order_id, product_id, quantity, unit_price, subtotal

There are no partial dependencies because each table uses a single-column primary key.  
There are no transitive dependencies because non-key attributes do not depend on other non-key attributes.

**Anomaly Prevention:**
- Update anomaly is avoided because customer and product details are stored only once.
- Insert anomaly is avoided because new customers or products can be added independently.
- Delete anomaly is avoided because deleting an order does not remove customer or product data.

Thus, the schema satisfies Third Normal Form and supports efficient, reliable database operations.

---

## 3. Sample Data Representation

### customers
| customer_id | first_name | last_name | email              | phone           | city     | registration_date |
|------------|------------|-----------|--------------------|-----------------|----------|-------------------|
| 1          | Riya       | Sharma    | riya@gmail.com     | +91-9876543210  | Chennai  | 2023-01-10        |
| 2          | Arjun      | Kumar     | arjun@gmail.com    | +91-9876543221  | Mumbai   | 2023-02-15        |

### products
| product_id | product_name | category     | price | stock_quantity |
|-----------|--------------|--------------|-------|----------------|
| 1         | Laptop       | Electronics  | 55000 | 10             |
| 2         | Headphones   | Electronics  | 2500  | 25             |

### orders
| order_id | customer_id | order_date | total_amount | status     |
|---------|-------------|------------|--------------|------------|
| 1       | 1           | 2023-05-20 | 57500        | Completed  |
| 2       | 2           | 2023-05-22 | 2500         | Pending    |

### order_items
| order_item_id | order_id | product_id | quantity | unit_price | subtotal |
|--------------|----------|------------|----------|------------|----------|
| 1            | 1        | 1          | 1        | 55000      | 55000    |
| 2            | 1        | 2          | 1        | 2500       | 2500     |
