# Query SQL Server to get Transaction XML data
library(RODBC);
dbhandle <- odbcDriverConnect('driver={SQL Server};server=office-db-01;database=GBI_Transaction;trusted_connection=true')
res <- sqlQuery(dbhandle, 'SELECT top 2 ProductInterfaceStorageId, StorageDate, ModificationDate, RelationId, 
                PolicyGeneralId, serializedxml, ProductVersionId, TaxonomyId FROM vProductInterfaceStorage
                where PolicyGeneralId > 0
                order by 1 desc')
close(dbhandle);

# Query the captured data
res$ProductInterfaceStorageId[1]
class(res$ProductInterfaceStorageId)
res$serializedxml[1]

dim(res)
colnames(res)
rownames(res)

res[, 1:5]
res[2:1, c(1,2,3,4,5,7,8)]
