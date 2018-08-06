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

### IMPLEMENTANDO ARBOLES DE DECISION ###

library(tree)
library(ISLR)

data<-Carseats

data$High<-ifelse(data$Sales <=8,"No","Yes ")
data$High<-as.factor(data$High)
#tree.carseats <- tree(Sales~.,data=Carseats)
#summary(tree.carseats)

# Split Train Test
set.seed(2)
train<-sample(1:nrow(data), 200)
test.carseats<-data[-train,]
train.carseats<-data[train,]

# Entrenamos un primer árbol "crudo"
tree.carseats <- tree(High~.-Sales
                      , data=train.carseats)


summary(tree.carseats)

plot(tree.carseats)
text(tree.carseats ,pretty =0)

# Podríamos setear parámetros diferentes
# Este árbol overfitea mucho los datos.

tree<-tree(Income~.
           , data=data
           , control = tree.control(nobs=400, minsize=1, mincut=0.1)
           , x=TRUE)


# Realizamos la predicción con el árbol "crudo"
tree.pred.test<-predict(tree.carseats, test.carseats, type="class")

# Vamos a hacer "Cost-Complexity Prunning
# Estimamos vía validación cruzada la complejidad óptima del árbol
set.seed(3)
cv.tree.carseats<-cv.tree(tree.carseats
                          , FUN=prune.misclass)

cv.tree.carseats
# Visualizamos los datos para elegir el mejor valor
par(mfrow=c(1,2))
plot(cv.tree.carseats$size,cv.tree.carseats$dev, type="b")
plot(cv.tree.carseats$k ,cv.tree.carseats$dev ,type="b")

#s Realizamos el prunning
prune.carseats<-prune.misclass(tree.carseats,best=9)
par(mfrow=c(1,2))
plot(prune.carseats)
text(prune.carseats ,pretty =0)
plot(tree.carseats)
text(tree.carseats ,pretty =0)

# Realizamos la predicción con el árbol pruneado
tree.pred.test2<-predict(prune.carseats, test.carseats, type="class")

# Comparamos el missclass rate entre el árbol sin prunear y pruneado

table(tree.pred.test, test.carseats$High)
mean(tree.pred.test==test.carseats$High)

table(tree.pred.test2, test.carseats$High)
mean(tree.pred.test2==test.carseats$High)


### CONSIGNAS ### 

## 1. REPLICAR EL EJERCICIO DE ÁRBOLES VISTO EN LA PARTE TEÓRICA PERO
#     PERO USANDO LA VARIABLE SALES -CUANTITATIVA- COMO VARIABLE DEPENDIENTE.


## 2. ¿QUÉ OBSERVA EN EL COMPORTAMIENTO DEL TEST ERROR ENTRE EL ARBOL "MÁXIMO"
#     Y EL ÁRBOL PODADO?

