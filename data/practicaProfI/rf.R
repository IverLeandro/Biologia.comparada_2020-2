##
## RF ejemplo anotado
##
##
## DRME dmiranda@uis.edu.co
##
##  2014 - 03 -23
##

## bibliotecas

library(phangorn)

library(ape)


##
##  leer arboles
##


## referencia

setwd("../trees")


#######
arbol0 <- read.tree("arbol0")
arbol1 <- read.tree("arbol3")



## grafica por control
## vs kaos

plot(arbol0)


plot(arbol1)


## creacion de las particiones
## via prop.part



particiones <- function(arbol0){

## arbol 0
particiones0 <-  prop.part(arbol0)

##
## convertir las particiones de números a rótulos
##

 numParticiones0 <- length(particiones0)

##str(particiones0)

listadoParticiones0 <- list()

##
labels0 <- attributes(particiones0)$labels

##c(particiones0[[1]])

##labels0[1]

for(tmp in 1: numParticiones0){

  listadoParticiones0[[tmp]]   <-   labels0[c(particiones0[[tmp]])]

}


return(listadoParticiones0)

}



particion0 <-  particiones(arbol0)


particion0

particion1 <-  particiones(arbol1)


particion1

all(particion0[[1]] %in% particion0[[1]])


## convertir lo anteior en una funcion que tome el arbol y report la lista



###################################
labels0[c(particiones0[[2]])]

labels0[c(particiones0[[3]])]



plot(arbol1)

particiones1 <- prop.part(arbol1)

attributes(particiones1)$labels


##
## metricas entre arboles
##

treedist(arbol0,arbol1)


