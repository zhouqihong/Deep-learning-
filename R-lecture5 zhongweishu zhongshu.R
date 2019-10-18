#1
data <- read.csv("D:/2019 博士课程 第三学期/R语言统计及应用 王振杰/1571035760456/统计描述数据/中国人寿股价.csv")#读取中国人寿股价数据，命名为 data

#2
data$date<-data$Trddt #生成新的变量“date”(Trddt 赋值给新变量)
data$price<-data$Clsprc #生成新的变量“price” (Clsprc 赋值给新变量)

date<-data$Trddt  #?为什么还有这一步
price<-data$Clsprc

data.1<-data
data.2<-data
data.3<-data

#删除数据中的变量price和date
data<-data[,-3:-4]

#4
data.1<-data.1[,-1:-2]


#install.packages("mice")
library(mice)
md.pattern(data.1) #对缺失值的处理吗？

#5 
data.1$date<-replace(data.1$date,data.1$date=="",NA)
md.pattern(data.1) #将变量 data.1 数据集中“date”空白值替换为缺失值。再进行缺失值模
式判断

#6数值型变量如果有缺失值，则用均数进行缺失值填补（使用两种方法进行
#填补，使用data.2 数据集）
data.2$price<-data.2$Clsprc
mean(data.2$price[!is.na(data.2$price)])

data.2$price[is.na(data.2$price)]<-mean(data.2$price[!is.na(data.2$price)])#mean
data.2$price<-data.2$Clsprc

data.2$price[is.na(data.2$price)]<-mean(data.2$price[complete.cases(data.2$price)])#mean  

data.2$price<-data.2$Clsprc
data.2$price[!complete.cases(data.2$price)]<-mean(data.2$price[complete.cases(data.2$price)])

#7数值型变量如果有缺失值，用中位数进行缺失值填补（使用两种方法进行
#填补，使用data.3 数据集）
data.3$price[is.na(data.3$price)]=median(data.3$price[!is.na(data.3$price)]) #??
#median
data.3$price<-data.3$Clsprc
data.3$price[is.na(data.3$price)]=median(data.3$price[complete.cases(data.3$price)])
#median
data.3$price<-data.3$Clsprc
data.3$price[!complete.cases(data.3$price)]=median(data.3$price[complete.cases(data.3$price)])

#8
#剔除 data.1 数据集中的缺失值，并生成数据集data.4，对数值型变量进
#行集中趋势（均数、中位数）描述

data.4<-na.omit(data.1)
mean(data.4$price) #均值
median(data.4$price)#中位数
which.max(table(data.4$price)) #表示众数的值及出现的次数

#9数据集 data.4 中数值型变量进行离散趋势（全距、四分位间距、方差、标准差、变异系数）描述
m<-range(data.4$price);m  #？？
m[2]-m[1] #？？
max(data.4$price)-min(data.4$price)#全距

quantile(data.4$price)
q3<-quantile(data.4$price,probs = 0.75,names=FALSE)
q1<-quantile(data.4$price,probs = 0.25,names=FALSE)
q.1<-q3-q1;q.1

var(data.4$price) #方差
sd(data.4$price)#标准差
cv<-sd(data.4$price)/mean(data.4$price);cv #变异系数
summary(data.4$price) #描述

scan(file=file.choose(), what=character(), sep="\n", fileEncoding = "UTF-8")

install.packages("readxl")
library(readxl)
data5 = read_excel("D:\2019 博士课程  第二学期\统计作业 第二语言习得作业 鹿老师 20190331\作业5.xlsx",fileEncoding = "UTF-8",sheet=1)
data5
