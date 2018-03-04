names(mtcars)
data <- mtcars


plot(cars$speed,cars$dist
     ,main="Velocidad por dist. recorrida"
     ,xlab="Velocidad",ylab="Distancia", type="p")


x<-rnorm(1000,0,1)
par(mfrow=c(1,1))
hist(x[(x>-2 & x<2)])
hist(x,breaks=100)


boxplot(mpg~cyl,data=mtcars, main="Car Milage Data"
        , xlab="No. Cylinders", ylab="Miles Per Gallon"
        , col=c("red","green","yellow")
        , width=prop.table(table(mtcars$cyl)))

counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution",
        xlab="Number of Gears")

data$hp2<-NA
data$hp2[data$hp<95]<-"BAJO"
data$hp2[data$hp>=95 & data$hp<150]<-"MEDIO"
data$hp2[data$hp>=150]<-"ALTO"
data$hp2<-factor(data$hp2, levels=c("BAJO","MEDIO","ALTO"), ordered=TRUE)

table(data$hp2,data$hp)

count <- table(data$hp2)
barplot(count)


counts <- prop.table(table(mtcars$vs, mtcars$gear),margin=2)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        beside=FALSE)


plot(mtcars$wt, mtcars$mpg, main="Scatterplot Example",
     xlab="Car Weight ", ylab="Miles Per Gallon ")
points(mean(mtcars$wt),mean(mtcars$mpg), col="red")
abline(h=mean(mtcars$mpg))
abline(v=mean(mtcars$wt))
abline(a=37.285126, b=-5.344472)
abline(lm(mtcars$mpg~mtcars$wt), col="red")

lm(mtcars$mpg~mtcars$wt)
data$filtro1 <- data$cyl==8
lm(mpg~wt, data=data, subset=data$index)



data[data$cyl=="8",]

#lines(lowess(mtcars$wt,mtcars$mpg), col="blue")



library(MASS)
data(Boston)
plot(Boston$lstat, Boston$medv)
plot(log(Boston$lstat), Boston$medv)
model <- lm(medv ~ log(lstat), data = Boston)
names(model)

Boston$resid<-model$residuals

summary(model)

summary(model$residuals)
confint(model, level = 0.95)

x <-predict(model, data.frame(lstat = c(5, 10, 15), interval = "terms"))

sampleador<-function(p,df){
        index <-sample((1:nrow(df)),round(p*nrow(df),0))
        return(index)
}

ind<-sampleador(0.3, Boston)
train<-Boston[-ind,]
test<-Boston[ind,]

model <- lm(medv ~ log(lstat), data = Boston)

Boston[,-2]

pairs(Boston[,10:14])

model <- lm(medv ~ ., data = train)
model <- lm(medv ~ . - lstat + log(lstat), data = Boston)
summary(model)

model <- lm(medv ~ . - lstat + log(lstat) - tax - rad, data = train)
preds<-predict(model, test[,-14])

mean((preds-test$medv)^2)

preds_train<-predict(model, train[,-14])
mean((preds_train-train$medv)^2)
