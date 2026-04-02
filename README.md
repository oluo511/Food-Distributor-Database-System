# North America Food Distribute (NAFood) Operational Database

This project establishes a relational database for **North America Food Distribute (NA Food)**, an importer and wholesaler in West Sacramento[cite: 1]. [cite_start]The primary objective is to refine their existing data structure to streamline daily operations across the warehouse and sales departments[cite: 2, 3].

## 🏗️ Database Architecture & Design
The system is built to transform manual business rules into a structured relational schema consisting of **8 core tables** [cite: 118-207]:

* **Stakeholders**: Dedicated tables for **Manufacturers** [cite: 118][cite_start], **Suppliers** [cite: 130][cite_start], **Clients** [cite: 164][cite_start], and **Sales Persons**[cite: 177]. [cite_start]These track contact details, locations, and business types (e.g., International vs. Domestic or Grocery vs. Restaurant)[cite: 11, 13, 25].
* **Product Inventory**: A **Products** table [cite: 147] [cite_start]categorized into 16 groups including Sake, Seaweed, and Sushi Knives[cite: 8].
* **Unit Management**: A specialized **ProductUnits** table handles the requirement that products have specific units, costs, and list prices[cite: 5, 155].
* **Transactional Tracking**: **Sales Orders** [cite: 181] [cite_start]linked to **Order Lines** [cite: 192][cite_start], which record the specific products, quantities, and discount rates for every transaction[cite: 22].

## 🛠️ Technical Implementation & Business Rules
The database enforces specific constraints and data types as outlined in the project requirements:
* **Relational Logic**: The schema enforces the rule that a supplier can be a manufacturer, but a manufacturer is not necessarily a supplier[cite: 32].
* **Data Integrity**: `CHECK` constraints ensure valid entries for `ManufacturerType`, `ClientType`, and `DeliveryMethod`[cite: 129, 176, 188].
* **Field Precision**: Prices and amounts are stored as `DECIMAL(10, 2)`, while ProductIDs are restricted to 4-digit integers between 1000 and 9999[cite: 148, 159, 160].
* **Operational Rules**: The design supports one-to-many relationships, such as one order containing multiple order lines [cite: 27] [cite_start]and a single product being supplied by multiple vendors[cite: 30].

## 📊 Business Intelligence Demos
The project includes SQL scripts to address specific business needs:
* **Supplier Sourcing**: A query to identify alternative suppliers for Smoked Salmon when a primary vendor is out of stock [cite: 412-422].
* **Performance Tracking**: A "Best Seller" query to determine which products are driving the highest purchase volume [cite: 423-435].
