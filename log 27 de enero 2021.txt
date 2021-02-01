##multi2di build tree
Tree1 <- read.tree(text = "(1,2,(3,((4,(8,(9,10,11))),(((5,15,6,7)),((12,13),14)))));")
#add branching times
Tree1 <- compute.brlen(Tree1, 1)
##asign value 2 to every branch of lenght 0 only
Tree1$edge.length[Tree1$edge.length==0] <- 2 
plot(Tree1)

##create multi2di tree

ex1 <- multi2di(phy = Tree1)
plot(ex1)

##create di2multi tree

Tree3 <- read.tree(text = "(1,(2,(3,((4,(8,(9,(10,11)))),(((5,15),
                          (6,7)),((12,13),14))))));")
ex2 <- di2multi (phy = Tree3, tol = )
plot(ex2)
layout(1,2)

## compare trees
par(mfrow=c(1,2))
#comparison 1 multi2di vs original

plot(Tree1)
plot(ex1)

#comparison 2 di2multi vs original

plot(Tree1)
plot(ex2)


## random tree
Arbol <- rtree (15, br=rnorm)
##turn negative values to positive
Arbol$edge.length
Arbol$edge.length <- abs(Arbol$edge.length)

## take lowest value
V <- sort(Arbol$edge.length, decreasing = F)
V [1]
# Or could be this way
min(arbol$edge.length)

## change minimal lenght branch to 0
NewArbol <- Arbol
min(NewArbol$edge.length) <- 0
plot(NewArbol)
plot(Arbol)
edgelabels(Arbol$edge.length, font =0.01)

## compare trees

XY <- read.tree(text = "(1,(2,(3,((4,(8,(9,(10,11)))),(((5,15),
                          (6,7)),((12,13),14))))));")
XX <- read.tree(text = "(1,(2,(3,((4,(8,(9,(10,11)))),(((5,15),
                          (6,7)),((12,13),14))))));")
XX <- compute.brlen(XX, 1)

all.equal(XX,XY)

## phylo to X - commands (pag 61, paradis 2011, 
## analisis of phylogenetic evolution)

?as.character
?as.alignment
?as.phyDat
