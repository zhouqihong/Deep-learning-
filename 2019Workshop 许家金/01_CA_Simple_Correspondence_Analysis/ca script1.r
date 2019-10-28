install.packages("ca")
library(ca)
data1<-read.table(file.choose(),header= TRUE, sep="\t", row.names= 1)
data1
colnames(data1)<-c("it v link ADJ to", "it v link ADJ that", "it v link ADJ for n to do", "it v link ADJ wh-")
ca.data1<-ca(data1)
plot(ca.data1, xlim= c(-0.4,0.6), ylim= c(-0.4,0.4))