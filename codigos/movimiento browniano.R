?fastBM
## random coalescence

arbol <- rcoal(30)
x <- fastBM(arbol, a=0, sig2=1.0, internal=T)

## plot three graphs
par(mfrow=c(2,2))

hist(x)
phenogram(arbol, x, spread.labels=T)
plot(arbol)

## valor alpha distinto
par(mfrow=c(2,2))

x1 <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=0.01, theta=4.0)
x2 <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=0.5, theta=4.0)
x3 <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=0.2, theta=4.0)
x4 <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=0.4, theta=4.0)

## 
phenogram(arbol, x1 , spread.labels=T)
phenogram(arbol, x2 , spread.labels=T)
phenogram(arbol, x3 , spread.labels=T)
phenogram(arbol, x4 , spread.labels=T)

## different alpha
xx <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=0.01, theta=4.0)
xy <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=0.01, theta=4.0)
xz <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=0.01, theta=4.0)

yx <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=10, theta=4.0)
yy <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=10, theta=4.0)
yz <- fastBM(arbol, a=0, sig2=1.0, internal=T, alpha=10, theta=4.0)

par(mfrow=c(2,3))
phenogram(arbol, xx , spread.labels=T)
phenogram(arbol, xy , spread.labels=T)
phenogram(arbol, xz , spread.labels=T)

phenogram(arbol, yx , spread.labels=T)
phenogram(arbol, yy , spread.labels=T)
phenogram(arbol, yz , spread.labels=T)


## 
anole_tree<-read.tree("http://www.phytools.org/eqg2015/data/anole.tre")
svl <- read.csv("http://www.phytools.org/eqg2015/data/svl.csv",
                row.names=1)
svl <- as.matrix(svl)[,1]

##
plot(anole_tree)
anole_tree$Nnode      ## 99
anole_tree$tip.label  ## 100

##

class(svl)
plot(svl)
hist(svl)

head(svl)
tail(svl)
str(svl)

##
|
fit <- fastAnc(anole_tree,svl,vars=TRUE,CI=TRUE)
fit$ace ## Ancestral Character Estimation
fit$var

?fastAnc

hist(fit$var)

plot(fit$CI95)

##

fit_obj <- contMap(anole_tree, svl, plot=FALSE)
plot(fit_obj, type="fan", legend=0.7*max(nodeHeights(anole_tree)),
     fsize=c(0.7,0.9))

##

tree <- rcoal(n = 100)
x <- fastBM(tree)
y = fastBM(tree)

plot(x, y)
abline(lm(y ~ x))

##

cor.test(x, y)

x_c <- pic(x, tree)
y_c <- pic(y, tree)

cor.test(x_c, y_c)


class(x_c)
str(x_c)

x <- fastBM(tree)
z <- fastBM(tree, sig2 = 0.2)

y <- 0.4 * x + z
y2<- x + z

plot(x,y)
plot(x,y2)
