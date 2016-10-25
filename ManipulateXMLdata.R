# Manipulate XML data
# To extract the XML-values from the document, use xpathSApply:

xmlpis <- xmlParse(res$serializedxml[1], asText=TRUE)

class(xmlpis)

xpathSApply(xmlpis,'//pi/pa',xmlValue)   # Data centric value

paids <- xpathSApply(xmlpis,'//pi/pa', xmlGetAttr, 'id') # Attribute centric values
pavalues <- xpathSApply(xmlpis,'//pi/pa', xmlGetAttr, 'v') # Attribute centric values
paoldvalues <- xpathSApply(xmlpis,'//pi/pa', xmlGetAttr, 'ov') # Attribute centric values

coveragestype <- xpathSApply(xmlpis,'//pi/c/l', xmlGetAttr, 'typeId') # Attribute centric values
coveragesval <- xpathSApply(xmlpis,'//pi/c/l', xmlGetAttr, 'amount') # Attribute centric values
coveragesttype <- xpathSApply(xmlpis,'//pi/c/t', xmlGetAttr, 'typeId') # Attribute centric values
coveragestamount <- xpathSApply(xmlpis,'//pi/c/t', xmlGetAttr, 'amount') # Attribute centric values
coveragesdtype <- xpathSApply(xmlpis,'//pi/c/d', xmlGetAttr, 'typeId') # Attribute centric values
coveragesdamount <- xpathSApply(xmlpis,'//pi/c/d', xmlGetAttr, 'amount') # Attribute centric values
coveragestPartnerAmount <- xpathSApply(xmlpis,'//pi/c/t', xmlGetAttr, 'partnerAmount') # Attribute centric values
coveragestrate <- xpathSApply(xmlpis,'//pi/c/t', xmlGetAttr, 'rate') # Attribute centric values
coveragestoldRate <- xpathSApply(xmlpis,'//pi/c/t', xmlGetAttr, 'oldRate') # Attribute centric values

ioids <- xpathSApply(xmlpis,'//pi/io', xmlGetAttr, 'id') # Attribute centric values
ioselected <- xpathSApply(xmlpis,'//pi/io', xmlGetAttr, 'IsSelected') # Attribute centric values
iovalid <- xpathSApply(xmlpis,'//pi/io', xmlGetAttr, 'IsValid') # Attribute centric values

busrulesid <- xpathSApply(xmlpis,'//pi/r', xmlGetAttr, 'id') # Attribute centric values
busrulesdesc <- xpathSApply(xmlpis,'//pi/r', xmlGetAttr, 'desc') # Attribute centric values
busrulesruleid <- xpathSApply(xmlpis,'//pi/r', xmlGetAttr, 'ruleId') # Attribute centric values
busrulevalue <- xpathSApply(xmlpis,'//pi/r', xmlValue) # Data centric values


xmltop = xmlRoot(xmlpis) #gives content of root
class(xmltop)#"XMLInternalElementNode" "XMLInternalNode" "XMLAbstractNode"
xmlName(xmltop) #give name of node, PubmedArticleSet
xmlSize(xmltop) #how many children in node, 19
xmlName(xmltop[[1]]) #name of root's children

# Fit the attributes on one screen
piAttributes1 <- c('PolicyVersionId', 'productmodelVersion', 'LoopId', 'ProcessId', 'ProductInterfaceName')
piAttributes2 <- c('PremiumMarketGrossTotal', 'PremiumMarketNetTotal1', 'TaxAmountTotal', 'CommissionAmountTotal', 'ProRataFactor')
piAttributes <- c(piAttributes1, piAttributes2)

for (n in piAttributes){
        print(n)
        #xpathSApply(xmlpis,'//pi', xmlGetAttr, piAttributes[n]) #This doesn't work, needs a single value not a vector
        }

# Extract the multiple attribute centric values from the <PI> root node
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'PolicyVersionId') # Attribute entric values
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'productmodelVersion') # Attribute entric values
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'LoopId')
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'ProcessId')
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'ProductInterfaceName')
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'PremiumMarketGrossTotal')
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'PremiumMarketNetTotal')
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'TaxAmountTotal')
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'CommissionAmountTotal')
xpathSApply(xmlpis,'//pi', xmlGetAttr, 'ProRataFactor')

# View the XML data
ids
unique(ids)

head(datavalues[datavalues != ""], 334) # the XML in the PA @334 causes data to be returned as a list

op <- matrix(datavalues, nrow = 1, ncol = length(ids))
colnames(op) <- ids
head(op, 5)
