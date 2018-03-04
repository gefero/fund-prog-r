##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA Y DATA MINING EN R. 
##        ESTADISTICA DESCRIPTIVA, MODELOS DE REGRESION Y ARBOLES DE DECISION
##       
## Julio 2017
## Docente: German Rosati
##############################################################################

data<-read.csv("/home/digitalhouse/Descargas/default.csv", sep=",")
data<-data[sample(nrow(data)),]
shuffle<-sample(1,nrow(data),nrow(data))

data$default<-as.character(data$default)
data$default[data$default=='No']<-0
data$default[data$default=='Yes']<-1
data$default<-as.numeric(data$default)


k<-5
set.seed(1)
index<-rep(seq(1,k),length.out=nrow(data))
model<-vector("list", k)
probs<-vector("list", k)
preds<-vector("list", k)
errors<-vector(length = k)


for (i in seq(k)){
        test <- data[index %in% i, ]
        train <- data[!(index %in% i),]
        model[[i]] <- glm(default~. , data = train, family=binomial(link = "logit"))
        probs[[i]] <- predict(model[[i]], newdata = test[,-1], type="response")
        #preds[[i]]<-0
        preds[[i]][probs[[i]] >= 0.5] <- 1
        preds[[i]][probs[[i]] < 0.5] <- 0
        errors[[i]] <- mean(preds[[i]]!=test$default)
}
mean(errors)


library(boot)

model<-glm(default~. , data = data, family=binomial(link = "logit"))

set.seed(1)
cv.fit<-cv.glm(data = data, glmfit = model, K=1033)
cv.fit$delta




#Randomly shuffle the data
data<-data[sample(nrow(data)),]

#Create 10 equally size folds
folds <- cut(seq(1,nrow(data)),breaks=5,labels=FALSE)

#Perform 10 fold cross validation
library(ISLR)

data(Default)
data<-Default
rm(Default)

#data$Species<-as.numeric(data$Species)
#data$Species[data$Species==1]<-1
#data$Species[data$Species!=1]<-0
#data$Species<-as.factor(data$Species)

# Shuffle de casos
shuff<-sample(x=1:nrow(data), size=nrow(data), replace=FALSE)
data<-data[shuff,]
rm(shuff)

k<-5
index<-rep(1:k,length.out=nrow(data))

#train<-data[!(index %in% 4),]

model<-list()
probs<-list()
preds<-list()
for (i in 1:k){
        train<-data[!(index %in% i),]
        test<-data[index %in% i,]
        model[[i]]<-glm(default ~. , data = train, family = "quasibinomial")
        probs[[i]]<-predict(model[[i]], test, type = "response")
        #preds[[i]][probs[[i]] > 0.5]<-1
        #preds[[i]][probs[[i]] < 0.5]<-0
}
