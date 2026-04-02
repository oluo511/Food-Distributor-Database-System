-- ==========================================================
-- 3. OPERATIONAL ANALYTICS (Query Demo)
-- ==========================================================
USE NAFood;

-- PROBLEM: Sourcing Alternative Suppliers [cite: 412]
-- Finding alternative suppliers for 'Smoked Salmon' when the primary vendor is out of stock[cite: 412, 413, 420].
SELECT ProductName, Unit, Cost, ListPrice, AvailableQuantity, SupplierName
FROM Products p
JOIN ProductUnits pu ON p.ProductID = pu.ProductID
JOIN Suppliers su ON p.SupplierID = su.SupplierID
WHERE SupplierName != 'MingHong'
  AND ProductName = 'Smoked Salmon'
  AND (Unit = '1kg Pack' OR Unit = '1lb Pack');

-- PROBLEM: Identifying Top-Performing Products [cite: 423, 424]
-- Analyzing which products have the highest sales volume to optimize inventory[cite: 433].
SELECT s.supplierid, s.suppliername, p.productid, p.productname, SUM(ol.purchasequantity) AS TotalQuantity
FROM suppliers s 
JOIN products p ON s.supplierid = p.supplierid
JOIN orderlines ol ON p.productid = ol.productid
WHERE p.productid = (
    SELECT p.productid
    FROM products p 
    JOIN orderlines ol ON p.productid = ol.productid
    GROUP BY p.productid
    ORDER BY SUM(ol.purchasequantity) DESC
    LIMIT 1
)
GROUP BY s.supplierid, s.suppliername, p.productid, p.productname;
