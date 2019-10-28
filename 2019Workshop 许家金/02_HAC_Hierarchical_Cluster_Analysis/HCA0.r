install.packages("pvclust")
library(pvclust)
data2<-read.table(file=file.choose(),sep = "\t",header = TRUE, row.names= 1)
data2
data2.pvc <- pvclust(data2, method.hclust = "ward.D2", method.dist = "canberra")
plot(data2.pvc)
