install.packages("rJava")
install.packages("xlsxjars")  
install.packages("xlsx")
# 2.1 Plantform management
A<-1:4
B<-5:8
C<-9:12

ls() #查看生成的变量 
rm(A,B) #移除变量A,B
ls()
# rm(list=ls()) # clean all the variables
rm(list=ls())
ls()

#--------加载"survival"软件包------------

library(survival)
search()
detach("package:survival")
search()

library(ISwR)
data("thuesen")
thuesen

#--------(1)查看数据集前6条记录-----------------------------
#--------(2)blood.glucose与short.velocity散点图-------------

head(thuesen)
plot(thuesen$blood.glucose,thuesen$short.velocity)


attach(thuesen)
blood.glucose
short.velocity
plot(blood.glucose, short.velocity) #做散点图
search()
detach(thuesen)
search()

# subset transform within
# subset: Return subsets of vectors, 
# matrices or data frames which meet conditions.
thue2<-subset(thuesen,blood.glucose<7)#满足变量小于7,生成
thue2





thue3<-transform(thuesen,
                 log.gluc=log(blood.glucose))
thue3

#----------exercise1, within实现L52-53-----------------------------------------------------------------------------
#----------exercise2, within实现L52-53，求各个值与 log.gluc平均值的差、去掉log.gluc平均值并保存 ---------------
#答案 exercise1
thue3.1<- within(thuesen,{
                 log.gluc=log(blood.glucose)
                            }
                 )
thue3.1
#exerciese2
thue4<-within(thuesen,{
                       log.gluc<-(blood.glucose)
                       m<-mean(log.gluc)
                       centered.log.gluc<-log.gluc-m
                       rm(m)
                       }
              )
thue4
head(thue4)
tail(thue4)
summary(thuesen)

#-------请用"transform"实现以上功能------------------------
thue3<-transform(thuesen,
                 log.gluc=log(blood.glucose))



# "transform"的Description
## transform is a generic function, which—at least currently—only does anything useful with data frames. 
## transform.default converts its first argument to a data frame if possible and calls transform.data.frame.

###transform(`_data`, ...)
####Arguments data The object to be transformed
#### ... Further arguments of the form tag=value

thue4.1<-transform(thuesen,log.gluc=log(blood.glucose),centered.log.gluc=(log(blood.glucose)-mean(log(blood.glucose)
                                                                                                  )
                                                                          )
                   )
thue4.1


# 2.3 Program 介绍循环三种循环while,repeat,for
# Method I
y<-12345
x<-y/2
# while(condision) expression
while (abs(x*x-y)>1e-10) x<-(x+y/x)/2  #abs取绝对值
x
x^2

# Method II
x<-y/2
repeat{
  x<-(x+y/x)/2
  if (abs(x^2-y)< 1e-10) break
} #用if设置当满足条件就跳出循环
x


x<-seq(0,1,0.05)#生成x的序列值,从0开始，1结束，步长为0.05的等差序列
plot(x,x,ylab = "y",type = "l")
for(j in 2:8)lines(x,x^j) #作图
for(j in seq(2,8,2))lines(x,x^j) #序列形式
for(j in c(2,8,3))lines(x,x^j)#向量形式

#----------------------------------------------------------------------

# 2.3 Read data #读取数据
# Read inside data #读外部数据
data()
data("CO2")
library(MASS)
data(package="MASS")
detach("package:MASS")
data("SP500")
data("SP500",package = "MASS")

getwd()
setwd("C:/Users/Geoffrey/Rcourpus")
getwd()
txt<-read.table("C:/Users/Geoffrey/Rcourpus/thuesen.txt", header=T)
txt
csv<-read.csv("stroke.csv", header=T)
csv
txt1<-scan("thuesen.txt", skip = 1, what = list(blood.glucose=0, short.velocity=0))
txt1
mode(txt1)
names(txt1)
txt1.data<-cbind(txt1$blood.glucose,txt1$short.velocity)
txt1.data<-cbind(blood.glucose=txt1$blood.glucose,short.velocity=txt1$short.velocity)

data.fwf<-read.fwf("C:/Users/Geoffrey/Rcourpus/fwf.txt",
                   widths = c(2,4,4,3),col.names = c("W","X","Y","Z"))
data.fwf

# EXCEL
data.excel.2<-read.delim("clipboard")
mode(data.excel.2);dim(data.excel.2)

# SPSS
library(foreign)
data.spss=read.spss("C:/Users/Geoffrey/Rcourpus/salary.sav",to.data.frame=T)
dim(data.spss)

install.packages("Hmisc")
library(Hmisc)
data.spss2= spss.get("C:/Users/Geoffrey/Rcourpus/salary.sav")

# 2.2 Graphy作图
x<-runif(50,0,2) # rnorm(50) U(0,1)
# functions provide information about 
# the uniform distribution on the interval from min to max
# runif generates random deviates
y<-runif(50,0,2) 
plot(x,y)
plot(x,y, main = "Main title", sub = "subtitle",
     xlab = "x-label", ylab = "ylabel") #设定标题，副标题，x,y的标签
text(0.6,0.6,"text at (0.6,0.6)")
# text:text draws the strings given in the vector labels at the coordinates given by x and y
abline(h=.6,v=.6) #加直线在图上
abline(a=0,b=1)

# This function adds one or more straight lines through the current plot

for(side in 1:4) mtext(-1:4,side=side,at=.7,line=-1:4) #for函数
mtext(paste("side",1:4),side=1:4,line = -1,font=2)
# side on which side of the plot (1=bottom, 2=left, 3=top, 4=right)

plot(x,y, type = "n", xlab = "",ylab = "",axes = F)
points(x,y)
axis(1) #1代表横坐标
axis(2,at=seq(0.2,1.8,0.2)) #2代表纵坐标
box()
title(main = "Main title", sub = "subtitle",
      xlab = "x-label", ylab = "ylabel") #生成标题

# Composite graphics 直方图
x<-rnorm(100)
hist(x,freq = F)
hist(x)
#curve(dnorm(x),add=T)

h<-hist(x,plot=F)
ylim<-range(0,h$density,dnorm(0))
hist(x,freq = F, ylim=ylim)
curve(dnorm(x),add = T) #在直方图上加曲线

h$density
ylim<-range(1,h$density,dnorm(0))
hist(x,freq = F, ylim=ylim)
ylim

#3.1
# Load and read "salary.txt" as a data frame;
# attach this data;
# present average, number of subjects, 
# accumulated value of salary;
# max and min value of salary;
# detach this data;
#sink("E:/北大/课程课件/R语言统计分析应用/代码/a.txt")

# cut(x, breaks, labels = NULL,
# include.lowest = FALSE, ...)

attach(data)
salary1<-cut(Salary,3)
# salary1.N<-data.frame(cut(Salary,3))
table(salary1)
levels(salary1)

salary2=cut(Salary,3,labels=c("low","medium","high")) 
table(salary2)

breakpoints=c(0,30,40,50,60,70)
salary3=cut(Salary,breaks=breakpoints)
table(salary3)

salary4=cut(Salary,breaks=c(0,20,40,60,80),
            labels=c("0-20","21-40","41-60","61-80"))
table(salary4)

pic=function(x){
  par(mfrow=c(2,2))  #2*2
  hist(x)            #histogram
  dotchart(x)        #dotchart
  boxplot(x)         #box chart
  qqnorm(x);qqline(x)#Q-Q plot
  par(mfrow=c(1,1))  
}
pic(Salary)  
detach(data)

#3.2.1 revise lables
##读取salary.txt,并设置stringsAsFactors=F，观察数据集中的不同
##查看前6条数据，查看变量名称
##使用2种不同的命令将变量命名对应地更改为“CITY,WORK,PRICE,SALARY”


#3.2.2 delete row or column
# delete the 1st subjects and 3rd variable, creat a new data frame
# delete the 1st~5th subjects and 3rd variable, creat a new data frame
# delete the 1st,3rd,5th,7th subjects and 2nd, 4th variables, creat a new data frame

#3.3.1
data.r=read.table("D:/daily work/课程-I/R语言统计分析/代码/salary.txt",header=T)
attach(data.r)
data.r$SALARY=replace(Salary,Salary>65,NA)
is.na(data.r$SALARY)
sum(is.na(data.r$SALARY))
sum(!is.na(data.r$SALARY))
complete.cases(data.r$SALARY)
sum(complete.cases(data.r$SALARY))
sum(!complete.cases(data.r$SALARY))

#3.3.2
data.r$PRICE=replace(Price,Price>80,NA)
is.na(data.r$PRICE)
!is.na(data.r$PRICE)

install.packages("mice")
library(mice)
md.pattern(data.r)

install.packages("VIM")
library(VIM)
aggr(data.r)
summary(aggr(data.r))

#3.3.3
#(1) Delete missing value
data1.r=data.r[complete.cases(data.r$SALARY),]
dim(data1.r)
data2.r=data.r[!is.na(data.r$SALARY),]
dim(data2.r)
data3.r=na.omit(data.r)
dim(data3.r)

#(2) Replace missing value

data.r[is.na(data.r)]=mean(data.r$SALARY[!is.na(data.r$SALARY)])   #mean
data.r$SALARY=replace(Salary,Salary>65,NA)

#第二种表达方式

# Multiple Imputation
data=read.table("D:/daily work/课程-I/R语言统计分析/代码/salary.txt",header=T)
names(data)=c("CITY","WORK","PRICE","SALARY")
detach(data.r)

attach(data)
data$SALARY=replace(SALARY,SALARY>65,NA)
imp=mice(data,seed=1)  # random simulation , multiple imputation on a numeric matrix
# Multivariate Imputation by Chained Equations (MICE)
# data:A data frame or a matrix containing the incomplete data. 
# Missing values are coded as NA.
# seed: An integer that is used as argument by the set.seed() for offsetting the random number generator. 
# Default is to leave the random number generator alone.

# Evaluate an R expression in an environment constructed from data,
# possibly modifying (a copy of) the original data.

fit<-with(imp,lm(SALARY~WORK+PRICE))  #Line regression
fit
# pool-Multiple imputation pooling
pooled<-pool(fit) # Pools the results of m repeated complete data analysis
options(digits=3)
summary(pooled)

data.pre<-data[is.na(data$SALARY),][,2:3]  # select missing value ֵ
data.pre1<-data[is.na(data$SALARY),2:3] # select missing value ֵ
data.pre<-as.matrix(cbind(rep(1,4),data.pre)) # Combine R Objects by Columns
q<-pooled$qbar  # Predict SALARY  
# qbar-Salary=-0.0512*work+0.6189*price+92.1868
pre=data.pre%*%q
pre #Predict result

index<-is.na(data$SALARY)
data$SALARY[index]<-pre   #Replace the missing value
data[index,]

#3.4 data management
#3.4.1 merge
#(1) cbind rbind

# add a subject ("Hongkong",1910,75.0,41.8) into data


#(2)data frame
# creat weight (150,135,210,140),height(65,61,70,65),gender c("F","F","M","F")
# creat a data frame based on weight, height, gender
# rename row names to "Alice","Bob","Cal","David"

#select sub-dataset
data=read.table("D:/daily work/课程-I/R语言统计分析/代码/salary.txt",header=T,stringsAsFactors=F)
# present salary>65 subjects
# present the 2nd and 4th subjects

# sort salary by ascending (use two methods) and present

#3.5.1 Transpose
dataN<-t(data)

# stack() unstack()
x=data.frame(A=1:4,B=seq(1.2,1.5,0.1),C=rep(1,4))
x
x1=stack(x)
x1
x2=unstack(x1,form=values~ind)
x2

#3.5.2
install.packages("reshape2")
library("reshape2")
melt(x)

# 演示
data(airquality)
str(airquality)  #summary()
longdata=melt(airquality,id.vars=c("Ozone","Month","Day"),
              measure.vars=2:4)
str(longdata)

library(ggplot2)
p=ggplot(data=longdata,aes(x=Ozone,y=value,color=factor(Month)))
p+geom_point(shape=20,size=4)+
  facet_wrap(~variable,scales="free_y")+ geom_smooth(aes(group=1), fill="gray80")
shortdata=dcast(longdata,formula=Ozone+Month+Day~variable)
head(shortdata,5)
