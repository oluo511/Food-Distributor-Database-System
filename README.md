# North America Food Distribute (NAFood) Operational Database

This project establishes a relational database for **North America Food Distribute (NA Food)**, an importer and wholesaler in West Sacramento. The primary objective is to refine their existing data structure to streamline daily operations across the warehouse and sales departments.

## 🏗️ Database Architecture & Design
The system is built to transform manual business rules into a structured relational schema consisting of **8 core tables** :

* **Stakeholders**: Dedicated tables for **Manufacturers** , **Suppliers** , **Clients**, and **Sales Persons**. These track contact details, locations, and business types (e.g., International vs. Domestic or Grocery vs. Restaurant).
* **Product Inventory**: A **Products** table categorized into 16 groups including Sake, Seaweed, and Sushi Knives.
* **Unit Management**: A specialized **ProductUnits** table handles the requirement that products have specific units, costs, and list prices.
* **Transactional Tracking**: **Sales Orders** linked to **Order Lines**, which record the specific products, quantities, and discount rates for every transaction.

## 🛠️ Technical Implementation & Business Rules
The database enforces specific constraints and data types as outlined in the project requirements:
* **Relational Logic**: The schema enforces the rule that a supplier can be a manufacturer, but a manufacturer is not necessarily a supplier.
* **Data Integrity**: `CHECK` constraints ensure valid entries for `ManufacturerType`, `ClientType`, and `DeliveryMethod`.
* **Field Precision**: Prices and amounts are stored as `DECIMAL(10, 2)`, while ProductIDs are restricted to 4-digit integers between 1000 and 9999.
* **Operational Rules**: The design supports one-to-many relationships, such as one order containing multiple order lines and a single product being supplied by multiple vendors.

## 📊 Business Intelligence Demos
The project includes SQL scripts to address specific business needs:
* **Supplier Sourcing**: A query to identify alternative suppliers for Smoked Salmon when a primary vendor is out of stock.
* **Performance Tracking**: A "Best Seller" query to determine which products are driving the highest purchase volume.
