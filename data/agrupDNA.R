library(ape)
?ape
x <- paste("AJ5345", 26:49, sep = "")
x

x <- c("Z73494", x)
x
sylvia.seq <- read.GenBank(x)
head(sylvia.seq)
write.dna(sylvia.seq, "sylviaseq.fas", format = "fasta")
sylvia.seq.ali <- read.dna("sylviaseq.phy")
head(sylvia.seq.ali)
library(vegan)
library(cluster)
sylvia.dist1 = dist(sylvia.seq.ali)
head(sylvia.dist1)
t3<-(hclust(sylvia.dist1, method = "average", members=NULL))
plot(t3)
c3<-cophenetic(t3)
cor(sylvia.dist1,c3)
q()


#### ejercicico distancia
# sylvia.dist1 = dist(sylvia.seq.ali, method = "manhattan")
# sylvia.dist1 = dist(sylvia.seq.ali, method = "minkowsky")

### ejercicio agrupamiento
# t3<-(hclust(sylvia.dist1, method = "median", members=NULL))
# t3<-(hclust(sylvia.dist1, method = "ward,D", members=NULL))


