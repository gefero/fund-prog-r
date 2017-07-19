##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA Y DATA MINING EN R. 
##        ESTADISTICA DESCRIPTIVA, MODELOS DE REGRESION Y ARBOLES DE DECISION
##       
## Junio-Julio 2017
## Docente: German Rosati
##############################################################################

#########################
## STEPWISE REGRESSION ##
#########################

library(MASS)
data(Boston)

# Para regresión logística usamos glm(y~., data=, family="binomial")
names(Boston)

null<-lm(medv~1, data=Boston)
full<-lm(medv~., data=Boston)

step_forw<-stepAIC(null
                   , scope=list(lower=null, upper=full)
                   , direction="forward")

step_back<-stepAIC(full
                   , data=Boston
                   , direction="backward")

stepwise<-stepAIC(null
                  , scope = list(upper=full)
                  , data=Boston
                  , direction="both")

step_back$anova
step_forw$anova
stepwise$anova

# Elegimos el modelo final de stepwise
final<-lm(medv ~ lstat + rm + ptratio + dis + nox + chas + black + zn + 
                    crim + rad + tax, data=Boston)

############################
## MARKET BASKET ANALYSIS ##
############################

library(arules)
library(arulesViz)
library(DBI)
library(RSQLite)

# Ejemplo de consulta en SQLite desde R
setwd("/home/digitalhouse/Documentos/Kaggle - Instacart")
con <- dbConnect(RSQLite::SQLite(), dbname="instacart_kaggle.db")
dbListTables(con)
dbGetQuery(con,'SELECT * FROM orders LIMIT 10')

orders<-dbGetQuery(con,'SELECT *
                        FROM order_products__train 
                        LEFT JOIN orders ON order_products__train.order_id=orders.order_id                       
                        LEFT JOIN products ON order_products__train.product_id=products.product_id
                        LEFT JOIN departments ON products.department_id=departments.department_id
                        LEFT JOIN aisles ON aisles.aisle_id=products.aisle_id')
names(orders)
orders<-orders[,-c(5,12,14,15,17)]

data_trans<-orders[,c(1,11)]
head(data_trans)

### Usando sintaxis SQL en DataFrames
library(sqldf)
data(titanic3, package="PASWR")
sqldf('select age, count(*) from titanic3 where age is not null group by age')

#http://www.r-chart.com/2010/07/make-r-speak-sql-with-sqldf.html
#https://www.r-bloggers.com/running-sql-queries-in-r-with-the-sqldf-package/


# Creamos una lista donde cada elemento es una orden y dentro tiene los productos ordenados
i<-split(data_trans$product_name, data_trans$order_id)

# Creamos el objeto transacción
txn<-as(i, "transactions")

# Creamos las reglas
basket_rules<-apriori(txn, 
                      parameter = list(sup = 0.005, conf = 0.001, target="rules"))

# Visualizamos algunas reglas
options(digits=2)
inspect(basket_rules[1:5])
summary(basket_rules)

# Ordeamos las reglas por confidence
basket_rules<-sort(basket_rules, by="confidence", decreasing=TRUE)
inspect(basket_rules[1:10])

# Hacemos una visualización
itemFrequencyPlot(txn, topN = 20)

# Otra forma de plotear (más sucia)
x<-sort(prop.table(table(data_trans$product_name)), decreasing = TRUE)
barplot(x[1:10])

# Eliminamos potenciales reglas redundantes

subset.matrix<-is.subset(basket_rules, basket_rules)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA

redundant<-colSums(subset.matrix, na.rm=TRUE) >= 1
basket_rules_pruned <- basket_rules[!redundant]
basket_rules<-basket_rules_pruned

summary(basket_rules)
inspect(basket_rules)

# Supongamos que queremos "targetear" algún item. 
# 1- ¿Qué es probable que compren los clientes
# antes que bananas?

basket_rules<-apriori(data=txn, 
                      parameter=list(supp=0.001, conf = 0.08), 
                      appearance = list(default="lhs",rhs="Banana")
                      )
basket_rules<-sort(basket_rules, decreasing=TRUE,by="confidence")
inspect(basket_rules[1:20])
plot(basket_rules)

# 2- ¿Qué es probable que compren "luego" de que han comprado
# bananas?
basket_rules<-apriori(data=txn, 
               parameter=list(supp=0.001,conf = 0.08, minlen=2), 
               appearance = list(default="rhs",lhs="Banana"),
               control = list(verbose=F))
basket_rules<-sort(basket_rules, decreasing=TRUE,by="confidence")
inspect(basket_rules)

library(arulesViz)
plot(basket_rules[1:20],method="graph",interactive=FALSE,shading=NA)

inspect(basket_rules[1:20])
