install.packages("MASS")
library(MASS)
data3<-read.table(file.choose(),sep="\t", header= TRUE)
head(data3) #查看数据
str(data3) #告诉数据的结构
summary(data3)#描述统计
m1<-glm(Aux~Causation + EPTrans + Country, data = data3, family = binomial)
summary(m1) #描述逻辑斯蒂回归的总结
levels(data3$Aux) #因变量的水平，laten相对于doen的概率
