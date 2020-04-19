neo4j and Python

#match (n) optional match (n)-[rel]-() delete rel, n

#drop index on:Product(productID)
#drop index on:
#drop index on:

from neo4jrestclinet.client import GraphDatabase

db = GraphDatabase("http://localhost:7474", username="neo4j", password="P@ssw0rd")

#create some nodes with labels
user = db.labels.create("Usuario")
u1 = db.nodess.create(name="Bob")
u2 = db.nodes.create(name="Alice")
u3 = db.nodes.create(name="Lea")
u4 = db.nodes.create(name="Ana")
u5 = db.nodes.create(name="Joel")

user.add(u1, u2. u3, u4, u5)

u1.relationships.create("follows", u2)
u4.relationships.create("follows", u1)
u2.relationships.create("folloes", u3)
u2.relationships.create("follows", u5)