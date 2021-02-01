tr <- read.tree(text = "(1,2,(3,((4,(8,(9,(10,11)))),(((5,15),
                          (6,7)),((12,13),14)))));")
tr2 <- drop.tip(phy = tr, tip = c(10,11))
tr3 <- drop.tip(phy = tr, tip = c("10","11"))

## graficar arboles
plot(tr)
plot(tr2)
plot(tr3)

## arboles en la consola
write.tree(drop.tip(phy = tr, tip = c("10","11")))
write.tree(drop.tip(phy = tr, tip = c(10,11)))

write.tree(drop.tip(phy = tr, tip = c("10","11"), trim.internal = F))
write.tree(drop.tip(phy = tr, tip = c(10,11), trim.internal = F))

plot(tr2)
par(mfrow=c(1,2))
dev.off()  ### eliminar elementos graficados

## arboles trim.internal

Plot(drop.tip(phy = tr, tip = c("10","11"), trim.internal = F))
#error: funcion escrita con mayuscula inicial
plot(drop.tip(phy = tr, tip = c("10","11"), trim.internal = F))

##rotular nodos/mostrarlos

plot(tr, show.node.label = T)
nodelabels("A", node= c(17), frame = "r", bg = NULL  , adj = -1, cex=0.5)

## modificar longitud de ramas

?compute.brlen
tr4 <- compute.brlen(tr, 1)
plot(tr4)
?rnorm

## calcular longitud ramas con tiempo

tr4 <- compute.brtime(tr, "coalescent")
plot(tr4)

##verificar si esta enraizado

is.rooted(tr)
?root
rTr <- root(tr, 14, resolve.root = T)
plot(tr)
plot(rTr)
is.rooted(rTr)
