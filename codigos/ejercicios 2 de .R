##load library ape, ade4, phangorn, adephylo

T1 <- rcoal(20)
class(T1)

## build randonm tree

X1 <-phylo4d(T1, matrix(rnorm(100), 20))

## call bird.orders data
data(bird.orders)
bird.orders.dat         ## view data in console

## graph table

plot(bird.orders, x.lim = 40, font = 2, cex = 0.75)
segments(rep(40, 23), 1:23, rep(40, 23)+
           log(Orders.dat), 1:23, lwd = 3)
axis(1, at = c(40, 45, 50), labels = c(0, 5, 10))
mtext("ln(species richness)", at = 45, side = 1, line = 2)
axisPhylo()

## parameters matrix (important for the next set of codes)

matrix(c(2, 1, 1, 1), 2, 2)
layout(matrix(c(2, rep(1, 8)), 3, 3))
?layout

## plot 2 graphs with a normal distribution

plot(bird.orders, "p", FALSE, font = 1, no.margin = TRUE)
arrows(4.3, 15.5, 6.9, 12, length = 0.1)   ## draw an arrow
par(mar = c(2, 2, 0, 0))       ## specify plot's parameters
hist(rnorm(1000), main = "", col=)   ##new graph, over the previous

##

T3 <- read.tree(text = "(1,2,(3,((4,(8,(9,(10,11))),
                ((((5,15),(6,7)),((12,13),14)))))));")
T3$tip.label<- bird.orders$tip.label[1:15]

layout(matrix(1:2, 1, 2))


## draw both graph, opposite directions

layout(matrix(1:4, 1, 2), width = c(1.4, 1))
par(mar = c(4, 0, 0, 0))
plot.phylo(T3, adj=0.5 )
plot(T3, show.tip.label = FALSE, direction = "l")

rect(-5, 0.5, 38, 5.4, lty = 2, col= "orange")

## graph doted tree

random1 <- read.tree(text= "(C. baileyi,(C.californicus,(C.intermedius,C.eremicus),(C.formicus,C.hispidus)));")
random2 <- read.tree(text= "((F.reducta-C.b,(F.tribulosa-C.c,F.reducta-C.f)),(F.zacatecae-C.i..,(F.zacatecae-C.e.,F.zacatecae-C.h.)));")

A <- matrix (c("C.hispidus", "F.zacatecae-C.h.", 
"C.formosus", "F.reducta-C.f.", "C.eremicus" ,
"F.zacatecae-C.e." , "C.intermedius","F.zacatecae-C.i.", "C.californicus"
,"F.tribulosa-C.c." ,"C.baileyi", "F.reducta-C.b.", nrow=2, ncol=6))

cophyloplot(random1, random2, A, space = 5,
            length.line = 2, lty = 1)
?cophyloplot
dev.off()

## use of kronovitz

TR <- replicate(6, rcoal(10), simplify = FALSE)
kronoviz(TR, horiz = FALSE, type = "c", show.tip.label=FALSE)

## draw a subtree
dev.off()
data(chiroptera)
tr <- drop.tip(chiroptera, 16:916, subtree = TRUE)
plot(tr, font = c(rep(3, 15), rep(2, 3)), cex = 0.8,
     no.margin = TRUE)

## zoom on a tree
par(mfrow=c(1,1))
data(bird.families)
zoom(bird.families, 1:15, col = "grey", no.margin = TRUE,
     font =1, subtree=TRUE)

zoom(bird.families, list(1:15, 38:48),
     col = c("lightgrey", "slategrey"),
     no.margin = TRUE, font = 1, subtree = TRUE)

##install package rgl

open3d()
net <- evonet(stree(4, "balanced"), 6, 7)
ntx <- as.networx(compute.brlen(net, 1))
plot(ntx, edge.width = 1, tip.color = "black")

## plot multiple trees (install animation package)

TR <- rmtree(10, 10)
library(animation)
saveHTML(lapply(TR, plot))

## exercises 1,2,3 chapter 4
#Draw Fig. 4.11 using a color scale in place of the grey one
|
bs.ml <- scan()   ## ## execute twice in console
NA 88 76 73 71 100 45 81 72 67 63 100 100 

p <- character(length(bs.ml))
p[bs.ml >= 90] <- "black"
p[bs.ml < 90 & bs.ml >= 70] <- "grey"
p[bs.ml < 70] <- "white"

co <- c("red", "orange","yellow")

plot(tr, no.margin = TRUE, cex=0.8)
nodelabels(node = 16:27, pch = 20, bg = p[-1], cex = 1.5, col=heat.colors(15))

legend("bottomleft",
    legend = expression(90 <= BP,70 <= BP * " < 90", BP < 70)
     ,pch = 21, pt.bg = co, pt.cex = 1.5, bty = "n")


## Plot the phylogeny of avian orders, and color the Proaves in blue.
## Repeat this but only for the terminal branches of this clade.

plot(bird.orders)

Q <- which.edge(bird.orders, 1:5)

##add edges color
Color <- rep("red1", Nedge(bird.orders))
Color[Q] <- "blue"     

## add tips color
Color_tips <- rep("red1", Nedge(bird.orders))
Color_tips[1:5] <- "blue"

## color tips
plot(bird.orders, "c", FALSE, font = 1, edge.color = ,
     edge.width = 3, no.margin = TRUE, tip.color=Color_tips)

## color edges
plot(bird.orders, "c", FALSE, font = 1, edge.color = Color,
     edge.width = 3, no.margin = TRUE)

## color tips and edges
plot(bird.orders, "c", FALSE, font = 1, edge.color = Color,
     edge.width = 3, no.margin = TRUE, tip.color=Color_tips)


## Suppose you have a factor representing a character state node
## for each and each tip of a tree. Find a way to associate a 
## color with each branch depending on the state at both ends 
## of the branch.

ex1 <- rtree(7)
plot(ex1)
nodelabels(" ", 8:13)

ex1$edge
ex1$edge[2,]  ##for rows
ex1$edge[,2]  ##for columns
ex1$edge[,2] == 1 ## to verify
