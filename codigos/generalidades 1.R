getwd()
setwd("D:/IVER/Comparada/Lab")

library(ade4);library(ape)
tree.primates <-read.tree(text="((((Homo:0.21,Pongo:0.21):0.28,Macaca:0.49):0.13,Ateles:0.62):0.38,Galago:1.00);")

## 2 vectores

body<- c(4.09434, 3.6102, 2.37024, 2.02815, -1.46968)
longevity<-c (4.74493,3.3322,3.3683,2.89037,2.30259)

## que tipo de vector es?

class (longevity)
plot(body,longevity)

## nombrar vectores

names(body) <- names (longevity) <- c("homo", "pongo","macaca","ateles","Galago")

## llame a los elementos de la matriz
# tree.primates$ + tab = llama los elementos

class(tree.primates$edge)
  plot(tree.primates)

  tree.primates$tip.label
  
mean(tree.primates)

##vaciar el elemento tipo de clase

class(tree.primates) <- NULL

##creacion de topologia

tips.label <- c("a", "b","c","d")
edge.lenght <- c(0.6,0.7,0.55,0.4,0.4,0.43,0.9)
vector <- c(5,1,5,2,6,3,6,4,5,7,6,7)
edge <- matrix(vector, nrow = 6, ncol = 2)
tree.example <- 

##leergenbank
  read.GenBank("AF310048")

a <- "http://www.esapubs.org/archive/ecol/E084/093/"
b <- "Mammal_lifehistories_v2.txt"

ref <- paste(a,b, sep="")

historiaVida <- read.delim(ref)

class(historiaVida)

## enraizar arbol

ta <- read.tree(text ="(a,b,c);")
tb <- read.tree(text = "(a,b,c):1;")
tc <- read.tree(text = "((a,b),c);")

plot(tc)
is.rooted(tree.primates)
U <- unroot(tree.primates)
write.tree(U)
plot(U)

plot(ta)
plot(tree.primates)
plot(ta <- root(tree.primates, interactive = TRUE))

## arbol al azar

tr <-  rtree(n = 5)
plot(tr)

ta <- read.tree(text = "(((a:1,b:1):1,c:2):1,d:3);")
tb <- read.tree(text = "(((a:0.5,b:0.5):1.5,d:2):1,c:3);")
plot(ta)
plot(tb)
Objeto <- comparePhylo(ta, tb)
class(Objeto)
names(Objeto)
length(Objeto$messages)
Objeto$BT

##funcion isTRUE, verificar que la comparacion sea correcta

t1 <- read.tree(text = "((a:1,b:1):1,c:2);")
t2 <- read.tree(text = "(c:2,(a:1,b:1):1);")
plot(t1)
plot(t2)
isTRUE(all.equal(t1,t2))
all.equal(t2,t1)



