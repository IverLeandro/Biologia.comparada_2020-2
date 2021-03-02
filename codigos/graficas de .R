### use of plotting function
#create example trees 
library(ape)
T1 <- read.tree(text = "(uno,dos,(tres,((cuatro,(ocho,(nueve,diez
                ,once))),(((cinco,quince,seis,siete)),((doce,trece),catorce)))));")
T1 <- compute.brlen(T1, 1:10)
T2 <- read.tree(text = "(1,(2,(3,4,(5,6,(7,8,9)))));")
T3 <- read.tree(text = "(1,2,(3,((4,(8,(9,10,11))),(((5,15,6,7)),((12,13),14)))));")
T3 <- compute.brlen(T3, 2)
t5 <- rtree (15)

par(mfrow=c(1,3))

## visualize trees
plot(T1, main= "arbol con longitud de ramas", direction= "l")
plot(T2, main= "arbol sin longitud de ramas", direction= "l")
plot(T3, main= "arbol con ramas iguales", direction= "l")


## justify to the left with adj 0

par(mfrow=c(1,2))
plot(T1, adj = 0, direction="l")
plot(T1)

## plot data(bird.orders) UNROOTED
par(mfrow=c(1,3))
plot(bird.orders, main= "arbol con longitud de ramas", direction= "l", type="u", cex=0.5)
plot(bird.orders, main= "arbol sin longitud de ramas", direction= "l", type="u", cex=0.5, font=1)
plot(bird.orders, main= "arbol con ramas iguales", direction= "l", cex=0.5, type="u")

## same previous example, but "fan" type

par(mfrow=c(1,3))
plot(bird.orders, main= "arbol con longitud de ramas", type="u", cex=0.5, "fan", use.edge.length = T)
plot(bird.orders, main= "arbol sin longitud de ramas", , type="u", cex=0.5, font=1, "fan", use.edge.length = T)
plot(bird.orders, main= "arbol con ramas iguales", , cex=0.5, type="u", "fan", use.edge.length = T)

## use "fan" with first examples

par(mfrow=c(1,2))
plot(T1, main= "arbol con longitud de ramas", direction= "l", type="fan")
plot(T1, main= "arbol sin longitud de ramas", direction= "l", type="fan")
plot(T3, main= "arbol con ramas iguales", direction= "l", type="fan")

## use "radial"

par(mfrow=c(1,2))
plot(T1, main= "arbol con longitud de ramas", direction= "l", type="radial")
plot(T1, main= "arbol sin longitud de ramas", direction= "l", type="radial")
plot(T3, main= "arbol con ramas iguales", direction= "l", type="radial")

## add nodelabels

plot(T3, main= "arbol con con nodos nombrados")
edgelabels(text="node", 6, frame = "none", cex=0.8, adj=0.5)
nodelabels(text="node", 6, frame = "none", cex=0.8, adj=0.5)

## add 3 labels per node (front, under, above)

T4 <- read.tree(text="(1,(2,(3,(4,5))));")
plot(T4, main= "arbol con varios nodos titulados")
nodelabels(text = c(1,6,9), 6:9,  adj = c(-1.5,0.8), cex=0.6, bg="white", col = "blue", frame="n")
nodelabels(text = c(10,5,4), 6:9, adj = c(-1.5,-0.8), cex=0.6, bg="white", col = "red", frame="n")

## plot thermometer (horiz = F to draw vertical)

plot(T4, main= "arbol con termometro")
nodelabels(thermo = 10:20/100, piecol = c("red", "blue"), horiz = T)

## draw labels with different colours

t5$Nnode
plot(t5, main= "arbol con termometro")
v1 <- 16:21
v2 <- 22:26
v3 <- 27:30
nodelabels(pch =2, node=v1, col = "red", Frame="n")
nodelabels(pch =2, node=v2, col = "blue", Frame="n")
nodelabels(pch =2, node=v3, col = "purple" , Frame="n")


## change terminal background

plot(t5, cex=0.8, show.tip.label = F)
t5$tip.label <- bird.orders$tip.label[0:15]
tiplabels(t5$tip.label, tip =1:15 , bg="red1", col="blue4", cex=0.8, adj= c(-0.2,0), frame = "n",)

## add simple bars

plot(t5, cex=0.8, no.margin = F)
segments(4.5, 1, 4.5, 10, lwd = 2)
text(4.6, 3, "ejemplo", srt = 270)

## change tree colours

clade1 <- which.edge(bird.orders, 19:23)
color <- rep("black", 45)
color[clade1] <- "red"
plot(bird.orders, font = 1, edge.color = color,
     edge.width = 3, no.margin = TRUE)

## draw a square on the tree

plot(bird.orders, font = 1, edge.color = "black",
     edge.width = 3, no.margin = TRUE)
  
Orange <- which.edge(bird.orders, 1:5) 
black <- rep("black", Nedge(bird.orders))
black[Orange] <- "green" 

rect(1.2, 0.5, 38, 5.4, lty = 2, col= "orange")
plot(bird.orders, font = 1, edge.color = black,
     edge.width = 3, no.margin = TRUE)

## 
data(rodent_clock.tre)
trk <- read.tree(bird.orders)
