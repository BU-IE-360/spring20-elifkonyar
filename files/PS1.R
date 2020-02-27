#R download link: http://cran.r-project.org/bin/windows/base/
# http://cran.revolutionanalytics.com
#R studio download: http://www.rstudio.com/products/rstudio/download/

##PS1


a
a
a


#basics
2+5

x <- 3
x

x[3] <- 10
x

x <- c(3,1,6,5,8,10,9,12,13,2)
min(x)
max(x)
sum(x)
prod(x)
x+3

x <- c(4,8,15,16,23,42) 
y <- c(501,505,578,586)
z <- c(x,y)
length(z)
rev(z)

x <- rep(5,10)
x

x <- seq(2,3,length.out=21) #will be rounded up if fractional
?seq
x
x <- seq(5,8,by=0.3)
x

y <- x[3:7]
y

x <- c(3,12,5,6,15,4,20,9,6,7,-2)
sort(x)
?sort
sort(x,decreasing=TRUE)

x <- c(1,4,7,6,2,3,12)
diff(x)
?diff
diff(x, lag=2)
cumsum(x)
cumprod(x)

#logical expressions
x <- 10:20
x

(x<=16) & (x>=12)
x[(x<=16) & (x>=12)]

#matrices
vec <- 1:12
x <- matrix(vec,nrow=3,ncol=4)
x
x <- matrix(vec,nrow=3,ncol=4,byrow=TRUE)
x
ncol(x)
nrow(x)
length(x)

t(x)

x <- matrix(c(1,2,-1,1,2,1,2,-2,-1),nrow=3,ncol=3)
x
solve(x)

#probability distributions
#f(X=a)=? density
dnorm(0.5,0,1)
dnorm(0,2,1)

#P(X<=a)=F(a)=?
pnorm(0)
pnorm(2)
pnorm(5,3,1)

#P(X<=a)=0.5, a=? quantile function
qnorm(0.5)   
qnorm(0.9772499,3,1)

rnorm(20,2,1)

rnorm(5)
rnorm(5)

set.seed(2)
rnorm(5)
set.seed(2)
rnorm(5)

dpois(1,4)  
pbinom(4,20,0.5)
qexp(0.9,7)

#statistical functions
x<-rnorm(200,2,1)
mean(x)
sd(x)
var(x)
median(x)
summary(x)
library(psych)
describe(x)

#random number generation
x1 <- runif(20,10,30)
x2 <- runif(20,10,30)

y1 <- 2.5*x1 - 1.0 + rnorm(20,0,10)
y2 <- 2.5*x2 - 1.0 + rnorm(20,0,10)  

#plotting
attach(mtcars)
mtcars
#fuel consumption and 10 aspects of automobile design and performance for 32 automobiles 
plot(wt)
plot(wt, mpg) 
title("MPG vs Weight")
plot(wt, mpg,xlab="Weight",ylab="Miles per gallon",main="MPG vs Weight") 
plot(wt, mpg,xlab="Weight",ylab="Miles per gallon",main="MPG vs Weight",xlim = c(0,6), ylim = c(0,40)) 

cor(wt, mpg) 
abline(37,-5,col="red")

plot(mtcars[c(1,4,6)])
hist(mtcars$mpg)
hist(mtcars$mpg, breaks=12, col="blue")
?hist
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
  	xlab="Number of Cylinders", ylab="Miles Per Gallon")

quartz() #quartz() for macOS / windows() for windows
plot(x1,y1,col=1,pch=1)
points(x2,y2,col=2,pch=2)
legend(17,73,c("one","two"),col=c(1,2),pch=c(1,2))
?legend

x <- seq(-4,4,length.out=10001)
y <- dnorm(x)
quartz()
plot(x,y,type="l")

#hypothesis testing
#t-testing
x<-c(4.333268,4.596025,2.511564,4.800065,4.396696,
     3.660150,5.062939,6.615946,5.014637,4.534128)
summary(x)
t.test(x,mu=5)

mean(x)+qt(0.025,df=9)*sd(x)/sqrt(10)
mean(x)+qt(0.975,df=9)*sd(x)/sqrt(10)
t.test(x,mu=5,conf.level=0.70)

t.test(x,mu=5.5,conf.level=0.95,alternative="less")

#two sample testing
x<-c( 8.905868, 9.489432, 9.303279,13.245269,11.414613,
      9.570199,11.831411,10.746530, 7.046652,10.282480)
y<-c(10.115035, 9.897616, 9.797401,10.150356,11.579968,
     8.243007,10.402966, 9.556082,11.334573, 8.133988,
     9.038178,10.801978,11.800323,10.308633,11.003656,
     10.069685, 8.779280, 9.105075,10.143423,10.983465)

boxplot(x,y)
t.test(x,y,var.equal=FALSE)  

x<-c( 9.138448, 8.806406, 9.409357, 9.433236,11.484715,
      9.386678,12.037349, 9.857211, 9.738312, 9.930578,
      10.009126,10.656013,10.041543, 8.903196, 9.870441,
      9.360597,11.237767, 9.622229, 9.231713,10.700292)
y<-c(10.397936, 7.628093,10.990348,10.378885, 9.685354,
     10.138059,11.233461,10.068503,11.162762,13.344762,
     11.097071,10.055161,11.642695, 9.595802, 9.411301,
     9.140353, 10.368321,11.343275,11.078996,10.203303)
boxplot(x,y) 
quartz() #windows()
plot(x,y)  #not correlated: independent sample
cor(x,y)
t.test(x,y,var.equal=TRUE)

x<-c( 9.256734, 9.314833, 9.654017, 9.704902, 9.626617, 9.532946,
      9.573609, 9.966781, 7.752760, 9.213267, 9.570130,11.653387,
      8.596938, 9.234176,10.223848, 8.574897, 9.249560, 8.479184,
      10.483415, 9.876535)
y<-c( 9.763588, 9.790802,10.326041, 9.999166,10.094298,10.140820,
      10.178082,10.358493, 8.015434, 9.724979,10.108325,12.363211,
      9.163253, 9.481367,10.751252, 9.086966, 9.821628, 8.722136,
      11.019155,10.454573)
boxplot(x,y)
quartz() #windows()
plot(x,y)   #highly correlated, paired t-test
cor(x,y)
t.test(x,y,paired=TRUE,var.equal=TRUE,alternative="less",conf.level=0.99)
t.test(x-y,alternative="less",conf.level=0.99)
t.test(x,y,paired=FALSE,var.equal=TRUE,alternative="less",conf.level=0.99)

#reading data into R from a file
getwd()
#you should change the workspace accordingly
setwd("/Users/elifkonyar/Desktop/IE 360/PS1")

x <- read.table(file="data file.txt",header=TRUE)
x
str(x)

x$length
x$weight
x$age

x <- read.csv(file="data file.csv",header=TRUE,sep = ";")
x

#save entire workspace
save.image("PS1.RData")
#load entire saved workspace 
load("PS1.RData")

#save an object
save(x,file="table.RData")
#load an object
load("table.RData")

#Useful package: DataTable
install.packages("data.table")
library(data.table)

#the source of the data set used below:
# https://archive.ics.uci.edu/ml/datasets/online+news+popularity
data<-fread("OnlineNewsPopularity.csv")
class(data)
a<-data[,.(shares,is_weekend)]
data[ , mean(shares),]
data[,.(avg=mean(shares))]
data[ ,avg:=mean(shares)]

data[,mean(shares),by=.(is_weekend)]
data[,mean(shares),by=.(is_weekend,n_tokens_title)][order(is_weekend,n_tokens_title)]
data[,mean(shares),keyby=.(is_weekend,n_tokens_title)]

data[n_tokens_title > 11,.(avg=mean(shares)),by=.(is_weekend)]

data[, .N]
data[, .N, by=.(n_tokens_title)]
data[, .N, keyby=.(n_tokens_title)]
data[n_tokens_content > 500, .(count=.N), by=.(is_weekend)] 

data[,.(avg_shares=mean(shares),avg_subjectivity=mean(global_subjectivity))]
avg_summary <- data[,.(avg_shares=mean(shares),avg_subjectivity=mean(global_subjectivity)),keyby=.(is_weekend)]
avg_summary
