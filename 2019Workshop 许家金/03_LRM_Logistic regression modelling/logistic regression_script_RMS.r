install.packages("rms")
library(rms)
data3<-read.table(file.choose(),sep="\t", header= TRUE)
head(data3)
str(data3)
summary(data3)

m2<-lrm(Aux~Causation + EPTrans + Country, data = data3)
m2
rms::vif(m2)

m3<-lrm(Aux~Causation + EPTrans + Country + EPTrans1, data = data3)
m3
rms::vif(m3)
