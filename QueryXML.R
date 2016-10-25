# have a look at the content of the first child entry
xmltop[[1]]
# have a look at the content of the 2nd child entry
xmltop[[2]]

#Root Node's children
# Note: for our PAs there are no child nodes
xmlSize(xmltop[[1]]) #number of nodes in each child
xmlSApply(xmltop[[1]], xmlName) #name(s)
xmlSApply(xmltop[[1]], xmlAttrs) #attribute(s)
xmlSApply(xmltop[[1]], xmlSize) #size
#take a look at the MedlineCitation subnode of 1st child
xmltop[[1]][[1]]
#take a look at the PubmedData subnode of 1st child
xmltop[[1]][[2]]
#subnodes of 2nd child
xmltop[[2]][[1]]
xmltop[[2]][[2]]

