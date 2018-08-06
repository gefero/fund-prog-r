##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA Y DATA MINING EN R. 
##        ESTADISTICA DESCRIPTIVA, MODELOS DE REGRESION Y ARBOLES DE DECISION
##       
## Marzo 2018
## Docente: German Rosati
##############################################################################

############################
## ACTIVIDADES UNIDAD 4. ##
############################

########################
####### Bagging ########
########################

library(MASS)
data(Boston)
Boston<-Boston
set.seed(1)
train <- sample (1:nrow(Boston), nrow(Boston)/2)

boston.test<-Boston[-train ,"medv"]

# Estimamos un modelo de Bagging: podemos hacerlo usando la cantidad de 
# variables a samplear igual a la cantidad total del dataset. 
# Lo hacemos con el argumento mtry.
bag.boston<-randomForest(medv ~ .,data=Boston , subset=train ,
                         mtry=13,importance =TRUE)
bag.boston

# Hacemos un predict y evaluamos los resultados
yhat.bag <- predict (bag.boston , newdata=Boston[-train ,])
plot(yhat.bag , boston.test)
abline (0,1)

mean((yhat.bag - boston.test)^2)

########################
#### Random Forest #####
########################

# Estimamos un modelo de Bagging: podemos hacerlo usando la cantidad de 
# variables a samplear igual a la cantidad total del dataset. 
# Lo hacemos con el argumento mtry.

set.seed(1)
rf.boston<-randomForest(medv~., data=Boston, subset=train,
                        mtry=6, importance=TRUE)

# Hacemos un predict y evaluamos los resultados
yhat.rf <- predict(rf.boston, newdata=Boston[-train ,])
plot(yhat.rf , boston.test)
abline (0,1)

mean((yhat.rf-boston.test)^2) 


importance(rf.boston)
varImpPlot (rf.boston)
