##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA Y DATA MINING EN R. 
##        ESTADISTICA DESCRIPTIVA, MODELOS DE REGRESION Y ARBOLES DE DECISION
##       
## Junio-Julio 2017
## Docente: German Rosati
##############################################################################

############################
## ACTIVIDADES UNIDAD 5. ##
############################

## 1. REPLICAR EL EJERCICIO DE ÁRBOLES VISTO EN LA PARTE TEÓRICA PERO
#     PERO USANDO LA VARIABLE SALES -CUANTITATIVA- COMO VARIABLE DEPENDIENTE.


## 2. ¿QUÉ OBSERVA EN EL COMPORTAMIENTO DEL TEST ERROR ENTRE EL ARBOL "MÁXIMO"
#     Y EL ÁRBOL PODADO?


library(tree)
library(ISLR)

data<-Carseats

#tree.carseats <- tree(Sales~.,data=Carseats)
#summary(tree.carseats)

# Split Train Test
set.seed(10)
train<-sample(1:nrow(Carseats), 200)
test.carseats<-Carseats[-train,]
train.carseats<-Carseats[train,]

# Entrenamos un primer árbol "crudo"
tree.carseats <- tree(Sales~.,data=Carseats, subset = train)
#tree.carseats <- tree(Sales~.,data=train.carseats)

# Podríamos setear parámetros diferentes
# Este árbol overfitea mucho los datos.

tree<-tree(Income~.
           , data=data
           , control = tree.control(nobs=400, minsize=2, dev=0)
           , x=TRUE)


# Realizamos la predicción con el árbol "crudo"
tree.pred.test<-predict(tree.carseats, test.carseats)

# Vamos a hacer "Cost-Complexity Prunning
# Estimamos vía validación cruzada la complejidad óptima del árbol
set.seed(3)
cv.tree.carseats<-cv.tree(tree.carseats
                          , FUN=prune.tree
                          , K=5)

# Visualizamos los datos para elegir el mejor valor
plot(cv.tree.carseats$size,cv.tree.carseats$dev, type="b")

# Realizamos el prunning
prune.carseats<-prune.tree(tree.carseats,best=5)

# Realizamos la predicción con el árbol pruneado
tree.pred.test2<-predict(prune.carseats, test.carseats)

# Comparamos el MSE entre el árbol sin prunear y pruneado
mean((tree.pred.test-test.carseats$Sales)**2)
mean((tree.pred.test2-test.carseats$Sales)**2)