getwd()
setwd("D:/IVER/Comparada/Lab")

## required packages
library(ips)
library(ape)
library(ade4)
library(phangorn)

##Read sequences
x <- paste("AJ5345", 26:49, sep = "")
x <- c("Z73494", x)

sylvia.seq <- read.GenBank(x)
sylvia.seq

## align
sylvia.clu <- clustal(sylvia.seq)
sylvia.maff <- mafft(sylvia.seq)
taxa.sylvia <- attr(sylvia.seq, "species")
taxa.sylvia

## change names
names(taxa.sylvia) <- names(sylvia.seq)
rm(sylvia.seq)

taxa.sylvia[1] <- "Sylvia_atricapilla"
taxa.sylvia[24] <- "Sylvia_abyssinica"
taxa.sylvia

setwd("C:/Users/UIS/Downloads/ApeR/Data")
sylvia.eco <- read.table("data/sylvia_data.txt")
str(sylvia.eco)
save(sylvia.clu, taxa.sylvia, sylvia.eco, file = "sylvia.RData")


#####EJERCICIO 1######

###1. Arbol al azar de 10 terminales

t1 <- rtree(n=10)
plot(t1)

##a) extraer long de ramas y guardarla en un vector
t1.long <- t1$edge.length
t1.long
##b) eliminar la long de ramas y graficar el arbol
t1$edge.length <- NULL
plot(t1)
##c) Dar nueva long de ramas a partir de una distribucion uniforme.
t2 <- compute.brlen(t1, runif)
plot(t2)
##d) restaurar la long original del arbol
t2$edge.length <- t1.long
t2$edge.length



###2. Crear arbol al azar de 5 terminnales, imprimirlo, graficcarlo.
###   Encontrar una manera de borrar la clase del objeto, e imprimirlo de nuevo.
###   Intente graficarlo de nuevo. Comente que pasa. Encuentre una manera de forzar el graficado como antes.

t3 <- rtree(n=5)
print(t3)
plot(t3)

class(t3)
class(t3) <- NULL
print(t3) 
plot(t3) #ERROR: objeto sin coordenadas

class(t3) <- "phylo"
class(t3)
plot(t3)

##3. Genere 3 arboles al azar de 10 terminales. Escribirlo en un archivo.
##   Leer el archivo en R. Mostrar un summary de cada arbol.
##   Escribir un programa que haga estas operaciones para cualquier número de arboles y terminales

rmtree
T4 <- rmtree(N=3, n=10)
write.tree(phy = T4, file = "Data/Exercise3.tre")

T5 <- read.tree(file = "resultados/Exercise3.tre")
plot(T5)

summary(T5)

RandomTrees <- function(N, n){
  TreeT <- rmtree(N, n) 
  write.tree(phy = TreeT, file = "resultados/Exercise3.tree")
  resumen <- summary(TreeT)
  }

RandomTrees(10, 9)


