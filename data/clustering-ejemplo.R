## bibliotecas
library(ape)
library(vegan)
library(cluster)

## ejercicio siempre de
## distnacia mas clustering

## set de datos

## leido desde disco
cars = read.delim('data/cars.tab',stringsAsFactors=FALSE)

## mirada al archivo
## 
head(cars)

## manipulacion de los datos

cars.use = cars[,-c(1,2)]

head(cars.use)

## medias
medians = apply(cars.use,2,median)

## standarizacion
##
mads = apply(cars.use,2,mad)

## carros en uso
cars.use = scale(cars.use,center=medians,scale=mads)

## distancia por defecto ? cual
cars.dist1 = dist(cars.use)
cars.use[c(36,38),6]
view(cars.dist1)
## distnacia euclidiana
cars.dist2 = dist(cars.use, method="euc")

head(cars.dist1)

## los grupos
t2<-(hclust(cars.dist2, method = "average", members=NULL))
t1<-(hclust(cars.dist1, method = "average", members=NULL))

## sus graficas
plot(hclust(cars.dist1, method = "average", members=NULL))

plot(hclust(cars.dist2, method = "average", members=NULL))

#matrices cofeneticas

c1<-cophenetic(t1)

c2<-cophenetic(t2)

## correlaciones
cor(cars.dist1,c1)

cor(cars.dist2,c2)

