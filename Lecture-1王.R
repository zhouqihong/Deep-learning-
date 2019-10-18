# Basic knowlege
# Update R platform
install.packages("installr")
require(installr)
updateR()

# R preview 
install.packages("ISwR") 
# Introductory Statistics with R
library(ISwR)
plot(rnorm(1000)) 
# rnorm=random normal

# Calculator
2+2 
exp(-2) 
rnorm(16) # 散点图

rnorm(n=16, mean = 3, sd=1)
rnorm(16,3,1)

# Evaluation
x<-2  # alt+-: <-
y=2
x
y
x*2+y
z<-x*2+y

# Vector
# "c" (concatenate) 
weight<-c(60,72,57,90,95,72)
weight
height<-c(1.75,1.80,1.65,1.90,1.74,1.91)

# 生成变量名为"test"的符合正态分布
# (mean=2,sd=0.5)16个随机数据

# test<-c(rnorm(n=16, mean = 2, sd=0.5))

# 练习计算BMI值

bmi<-weight/height^2
bmi
Bmi

bmi.1<-round(bmi,digits = 2)
bmi.1

# 练习不保留小数位

bmi.2<-round(bmi,digits = 0);bmi.2


# mean calculation
sum(weight)
sum(weight)/length(weight)

# SD
xbar<-sum(weight)/length(weight)
xbar
weight-xbar
(weight-xbar)^2
sum((weight-xbar)^2)
sqrt(sum((weight-xbar)^2)/(length(weight)-1))
mean(weight)
sd(weight)

# Graph

plot(weight)
plot(height)
plot(height,weight)

plot(x=height,y=weight)
plot(y=weight,x=height)

args(plot.default) #args-Argument List of a Function

plot(height,weight,pch=2)
plot(height,weight,pch=22)

hh<-c(1.65,1.70,1.75,1.80,1.90)

y<-22.5*hh^2

plot(y)

lines(hh,22.5*hh^2)

# R Basic foundation

# weight<-c(60,72,57,90,95,72)
# height<-c(1.75,1.80,1.65,1.90,1.74,1.91)
# 并计算 BMI；bmi<-weight/height^2
# 保留2位小数
# 将"Huey","Dewey","Louie"赋值给变量x
# 将'A','B','C'赋值给变量y
# 将T,T,F,T,F赋值给变量z
# 注意Values中变量类型

# 输入bmi<25 或 bmi<=24.9又会发现什么？

# citation and tansferred meaning
c("Huey","Dewey","Louie")
cat(c("Huey","Dewey","Louie"))
cat("Huey","Dewey","Louie","\n")
cat("what is R?")
cat("what is \"R\"?")
cat("what is \"R\"? \n")

# Vector functions II
c(42,34,54,33,67,1,3,4,5)
x<-c(1,2,3)
y<-c(10,20)
z<-c(y,x,5)
z
c(y,5,x)

x<-c(red="Huey",blue="Dewey",green="Louie")
x
names(x)

# 既然向量x类型为"Named chr",
# 会不会有"Named num"/" Named Logi"?

#--------------------------------------------------------------;
# 向量类型优先级

c(F,3)
c(pi,"abc")
cat(c(pi,"abc"))
c(FALSE,"abc")

# 逻辑型<数值型<字符型

# seq (sequence)
seq(4,9)
seq(4,10,3)
4:9

# 请使用最规范的写法将上面的序列语句实现
seq(from=4, to=9)
seq(from=4, to=10, by=3)

seq_len(length.out =5)
seq.int(4,9,length.out =5) 
# length.out: desired length of the sequence.

# rep (replicate)
oops<-c(7,9,13)
rep(oops,4)
rep(oops,1:3)
rep(oops,c(1,1,2))
rep(1:2,c(10,15)) # 1-Male;2-Female
rep(1:2,each=5)

rep(1:4, each = 2, len = 4) # first 4 only.
rep(1:4, each = 2, len = 6) 
rep(1:4, each = 2, times = 3)    

# Matrices and arrays
x<-1:12 #生成了-1到12的等差数列
dim(x)<-c(4,3)
x
y<-seq(1:12)
dim(y)<-c(3,4)
y

matrix(1:12, nrow=3,byrow = T)
matrix(1:12, nrow=3)
x<-matrix(1:12, nrow=3,byrow = T)

rownames(x)<-LETTERS[4:6] #赋值列的函数
x
colnames(x)<-letters[1:4]  #赋值行的函数
x
cbind(A=1:4,B=5:8,C=9:12) #以列的形式赋值
rbind(A=1:4,B=5:8,C=9:12)#以行的形式赋值
A<-1:4 #
B<-5:8
C<-9:12
cbind(A,B,C)
rbind(C,B,A)
#------------Method II--------------------
x.1<-matrix(1:12, nrow=3,byrow = T, 
            dimnames = list(c("D","E","F"),
                            c("a","b","c","d")
            )
)
x.1

# Factor 因子型数据类型
pain<-c(0,3,2,1,3,2)p
fpain<-factor(pain,levels = 0:3)
levels(fpain)<-c("none","mild","medium","severe")#对等级进行命名
fpain

fpain.1<-factor(pain,levels = 0:3,
                labels = c("none","mild","medium","severe")
) #
fpain.1

as.numeric(fpain)
levels(fpain)
y<-as.numeric(fpain)
is.numeric(y)
y

# List # #列表
# Altman(1991,p.183) energy intake
intake.pre<-c(5260,5470,5640,6180,6390,
              6515,6805,7515,7515,
              8230,8770)
intake.post<-c(3910,4220,3885,5160,5645,
               4680,5265,5975,6790,
               6900,7335)
mylist<-list(before=intake.pre,
             after=intake.post)
mylist
mylist$before
mylist$after

# Data frame
intake.pre<-c(5260,5470,5640,6180,6390,
              6515,6805,7515,7515,8230,8770)
intake.post<-c(3910,4220,3885,5160,5645,
               4680,5265,5975,6790,6900,7335)
d<-data.frame(intake.pre,intake.post)
d[1]
e<-data.frame(mylist)
e
d$intake.post
e$before

# Index
intake.pre
intake.pre[5]
intake.pre[c(1,3,5)]
intake.pre[seq(1,11,3)]
intake.pre[c(seq(1,11,3))]

# 索引"d"data frame中的intake.pre重现上述索引

d$intake.pre
d$intake.pre[5]
d$intake.pre[c(1,3,5)]
d$intake.pre[seq(1,11,3)]
d$intake.pre[c(seq(1,11,3))]

v<-c(3,5,7)
intake.post[v]
v1<-seq(1,11,3)
intake.pre[v1]

intake.pre[1:4]
intake.pre[-c(1,3,5)] #减去数据1,3,5
intake.pre[-seq(1,11,3)]

# Condition selected
# ==, !=,<=, >=
# & 与, | 或, ! 非



# Data frame index
d
d<-data.frame(intake.pre,intake.post)
d[5,1]
d[5,2]
d[5,]
d[d$intake.pre>7000,]

# intake.pre>7000 & intake.pre<=8000
sel<-intake.pre>7000 & intake.pre<=8000
sel.1<-d$intake.pre>7000
d[sel,]
d[sel.1,]
d[intake.pre>7000 & intake.pre<=8000,]

d[1:2,]
head(d)  #看头6行
tail(d)#看尾6行

#-------------exercise-----------------------------------------
# 输入以下数值：9.21,7.53,7.48,8.08,8.09,
# 10.15,8.40,10.88,6.12,7.90,
# 11.51,12.79,7.05,11.85,9.97,7.48,8.79,9.69,9.68,
# 7.58,9.19,8.11，赋值给expend

# 输入以下数值：1,0,0,0,0,0,0,0,0,0,1,1,0,
# 1,1,0,1,1,1,0,1,0
# 赋值给stature,将该变量转化为因子型
# 

# 将以上两个变量合并，转化为Data frame格式

# 将"fstature"值为"lean"的值输出并命名为"exp.lean"
# "obese"的值输出并命名为"exp.obese"

#答案
expend<-c(9.21,7.53,7.48,8.08,8.09,
           10.15,8.40,10.88,6.12,7.90,
          11.51,12.79,7.05,11.85,9.97,7.48,8.79,9.69,9.68,
          7.58,9.19,8.11)
stature<-c(1,0,0,0,0,0,0,0,0,0,1,1,0,
            1,1,0,1,1,1,0,1,0)
fstature<-factor(stature,levels = 0:1)
levels(fstature)<-c("lean","obese")

fstature

energy<-data.frame(expend,fstature)
View(energy)

exp.lean<-energy$expend[energy$fstature=="lean"]
exp.obese<-energy$expend[energy$fstature=="obese"]
exp.lean
exp.obese
exp.lean<- data.frame(energy.split$lean)

# Sort #排序
intake<-data.frame(intake.pre,intake.post)
colnames(intake)<-c("pre","post")

intake$post
sort(intake$post) #排序
order(intake$post) #查看原来的位置
sort(intake$post,decreasing = TRUE) #按降序排列
o<-order(intake$post)
o
intake
intake$pre
intake$pre[o]
intake.sorted<-intake[o,]
intake.sorted


