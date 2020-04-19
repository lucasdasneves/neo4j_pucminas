match (n) 
optional match (n)-[rel]-() 
delete rel, n
    //this code is used to delete all the database

load csv with headers from "file:///products.csv" as row
return row
    //this code is used to consult what is in the bank


load csv with headers from "file:///products.csv" as row
create (n:Product)
set n = row,
n.unitPrice = toFloat(row.unitPrice),
n.unitsInStock = toInteger(row.unitsInStock),
n.unitsOnOrder = toInteger(row.unitsOnOrder),
n.reorderLevel = toInteger(row.reorderLevel),
n.discontinued = (row.discontinued <> "0")
    //this code is used to import files (I didn't understand some codes)

load csv with headers from "file:///categories.csv" as row
create (n:Category)
set n = row

load csv with headers from "file:///suppliers.csv" as row
create (n:Supplier)
set n = row

CREATE INDEX ON :Product(productID)
CREATE INDEX ON :Category(categoryID)
CREATE INDEX ON :Supplier(supplierID)

match (p:Product),(c:Category)
where p.categoryID = c.categoryID
create (p)-[:PART_OF]->(c)

match (p:Product),(s:Supplier)
where p.supplierID = s.supplierID
create (s)-[:SUPPLIES]->(p)

MATCH (s:Supplier)-->(:Product)-->(c:Category)
RETURN s.companyName AS Company, collect(DISTINCT c.categoryName) AS Categories