install.packages("pvclust")
library(pvclust)
data2<-read.table(file=file.choose(), sep = "\t",header = TRUE, row.names= 1)
data2
data2.pvc <- pvclust(data2, method.hclust = "ward.D2", method.dist = "canberra", nboot = 1000)
plot(data2.pvc, hang = -1)
pvrect(data2.pvc, alpha = 0.95)
