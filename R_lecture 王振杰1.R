install.packages("ISwR")
library(ISwR) #3.6.1版本才可以
plot(rnorm(1000)) #作图的函数，rnorm是正态分布的函数，随机产生1000个数据，符合正态分布


install.packages("installr")更新新版本 要回到R
library(ISwR)
library(arules)
install.packages("arules")
library(arules)

#计算
2+2
exp(-2) 
rnorm(16)#散点图
rnorm(n=16,mean = 3, sd=1) #随机产生数量n，平均数mean，标准差sd,这种方法可以自己造数据
rnorm(16,2,1)

#R赋值与运算

x <-2 #alt+-: <-
y=2 #同样实现复杂
x
y
x*2+y
z <- x*2+y
z.1<- x^2 #^表示平方

# 向量，常用
# "C" （concatenate）,比如对身高体重赋值，用英文的“,”分隔数据。
weight <- c(60,72,57,90,72)
weight
height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
height

#练习，生成变量名未“test"的符合正态分布
#（mean=2,sd=0.5）16个随机数据
test <-c (rnorm(n=16,mean=2,sd=0.5))
test
test.1 <-c (rnorm(n=16,mean=2,sd=0.5))
test.1

#练习，计算BMI值
weight
height

bmi <- weight / height ^ 2 #?????
bmi
Bmi

bmi.1<-round(bmi,dights = 2) # 2表示保留2位小数
bmi.1

#练习不保留小数位
bmi.2<-round(bmi,digits=0);bmi.2

# 平均值计算
sum(weight)
sum(weight)/length(weight)

#SD
xbar <- sum(weight)/length(weight)
xbar
weight-xbar
(weight - xbar)^2

mean(weight)
sd(weight)
round(mean(weight))

#画图
plot(weight)
plot(height)
plot(weight,height)

plot(x=height,y=weight)
plot(y=height,x=weight) #对身高和体重作散点图

args(plot.default)
plot(height,weight,pch = 2) #pch=2表示三角形
plot(height,weight,pch = 22)#pch = 22 表示正方形

hh<-c(1.65,1.70,1.75,1.80,1.90)
hh

lines(hh,22.5*hh^2) #在图上加入随机直线
lines #？？？

weight <- c(60,72,57,90,95,72)
height <- c(1.75,1.80,1.65,1.90,1.74,1.91)
bmi<-weight/height^2
bmi
#保留2位小数
#将“Huey","Dewey","Louie"赋值为变量x

bmi<-round(weight/height^2,digits = 2)
bmi
#数据类型

c("Huey","Dewey","Louie")
x<-c("Huey","Dewey","Louie")
y<- c('A','B','C')
z<- c(T,T,F,T,F)

#输入bmi<25或bmi<-24.9又会发现什么？
bmi<25
bmi<24.9
bmi.logi.1<-bmi<25
bmi.logi.2<-c(bmi<25)

cat(c("Huey","Dewey","Louie"))

#向量方程
c(42,34,54,33,67,1,3,4,5)
x<-c(1,2,3)
y<-c(10,20)
z<-c(y,x,5)
z

x<-c(red="Huey",blue="Dewey",green="Louie")
x
names(x)

#既然向量X类型为"Named chr"
#会不会有“named num”/"Named logi"?

z<-c(red=T,blue=F,green=T)
z

#向量类型优先级
c(F,3)
c(pi,"abc")
cat(c(pi,"abc"))
c(pi,"a")

#逻辑型+数字
c(FALSE,"a")
c(1,"a")

#逻辑型<数值型<字符型

#seq(sequence)序列
seq(4,9)
seq(4,10,3) #3表示间隔为3生成的序列

x<-seq(4,9)
x

#请使用最规范的写法讲上面的序列语句实现
seq(from=4,to=9)
seq(from=4,to=10,by=3)

seq_len(length.out=5)

#rep(replicate)
oops<-c(7,9,13)
oops
rep(oops,4)
rep(oops,1:3)
rep(oops,c(1,1,2))
rep(1:2,c(10,15)) #1-Male;2-Female
rep(1:2,each=5)
rep(1:4,each=2,len=4)# first 4 only
rep(1:4,each = 2, len=6)
rep(1:4,each = 2, times = 3)


