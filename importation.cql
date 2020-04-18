load csv with Headers
from "file:///composicoes.csv"
as linha
merge (compositor:Musico{none:linha.compositor})
merge (musica:Musica{nome: linha.musica})
merge (compositor)-[:COMPOS]->(musica)
    //merge is used to avoid to create the same node over and over

load csv with headers
from "file:///gravacoes.csv"
as linha
merge(interprete:Musico{nome:linha.interprete})
merge(musica:Musica{nome:linha.musica})
merge(interprete)-[:GRAVOU]->(musica)
    //merge and load again