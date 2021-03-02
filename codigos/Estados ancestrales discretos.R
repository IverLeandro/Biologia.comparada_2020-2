library(phytools)
tree<-read.tree("Anolis.tre") 
par(mfrow=c(1,1))

plotTree(tree,type="fan",ftype="i",lwd=1)

## read data

svl<-read.csv("svl.csv",row.names=1) 
head(svl)
## change into a vector
svl<-setNames(svl$svl,rownames(svl))

## projection of the reconstruction onto the edges of the tree
obj<-contMap(tree,svl,plot=FALSE)

head(obj)
class(obj)
str(obj)

plot(obj,type="fan",legend=0.7*max(nodeHeights(tree)),
     sig=2,fsize=c(0.7,0.9))

## simulate a tree & some data
tree<-pbtree(n=26,scale=1,tip.label=LETTERS[26:1])
class(tree)
## simulate with ancestral states
x<-fastBM(tree,internal=TRUE)

class(x)
head(x)
tail(x)

## ancestral states
a<-x[as.character(1:tree$Nnode+Ntip(tree))]

class(a)
head(a)
tail(a)
str(a)

## tip data
y<-x[tree$tip.label]
head(y)
tail(y)
all.equal(x,y)

## incorporate prior knowledge
?setNames
pm<-setNames(c(1000,rep(0,tree$Nnode)),
             c("sig2",1:tree$Nnode+length(tree$tip.label)))
head(pm)
tail(pm)
str(pm)
class(pm)

## the root & two randomly chosen nodes
nn<-as.character(c(length(tree$tip.label)+1,
                   sample(2:tree$Nnode+length(tree$tip.label),2)))
head(nn)
tail(nn)
str(nn)
class(nn)
am <-pm
pm[nn]<-a[as.character(nn)]

all.equal(pm, am)

head(pm)
tail(pm)
str(pm)
class(pm)

head(am)
tail(am)
str(am)
class(am)

## prior variance
pv<-setNames(c(1000^2,rep(1000,length(pm)-1)),names(pm))

head(pv)
tail(pv)
str(pv)
class(pv)
length(pv)

pa <- pv

head(pa)
tail(pa)
str(pa)
class(pa)
length(pa)

pv[as.character(nn)]<-1e-1000
all.equal(pa, pv)

## run MCMC
mcmc<-anc.Bayes(tree,x,ngen=1000,
          control=list(pr.mean=pm, pr.var=pv,
           a=pm[as.character(length(tree$tip.label)+1)],
             y=pm[as.character(2:tree$Nnode+length(tree$tip.label))]))


?to.matrix
?add.simmap.legend
