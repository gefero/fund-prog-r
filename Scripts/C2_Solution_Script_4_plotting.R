##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA EN R. 
##       
## 2018
## Docente: German Rosati
##############################################################################

#################################
## CONSIGNAS PRACTICA PLOTTING ##
#################################

# Utilizando el dataset U2_data.csv (que contiene información sobre una encuesta
# a estudiantes de la escuela secundaria) resuelva las siguientes consignas:

setwd('/media/grosati/Elements/PEN/KINGSTON/PEN2/Cursos/REPO_Curso_Fund_Prog_R/Data/')
df <- read.csv("./estud.csv", sep=";")

library(ggplot2)

## Ejercicio 1. Generar un histograma y un boxplot de la variable G3. Realizarlo tanto con 
# la sintaxis base de gràficos de R como con ggplot2. Analizar sus resultados.
# ¿Qué puede decir de la distribuciòn respecto a la tendencia central, simetría
# y dispersión?

par(mfrow=c(1,2))
hist(df$G3, main="Histograma G3- RBase")
boxplot(df$G3, main="Boxplot G3- RBase")

library(ggplot2)

par(mfrow=c(1,1))
ggplot(df) + 
     geom_histogram(aes(x=G3), binwidth=1) + 
     ggtitle("Histograma G3 - ggplot2")

ggplot(df) + 
  geom_boxplot(aes(x='', y=G3)) +
  coord_cartesian(ylim = c(0, 20)) + 
  ggtitle("Boxplot G3 - ggplot2")


## Ejercicio 2. Generar un boxplot de la varialbe G3 para cada uno de los diferentes
# grupos de la variable goout. ¿Puede observar alguna diferencia entre los
# diferentes grupos?

# Hay que transformar goout a factor para poder plotearla

ggplot(df) + 
  geom_boxplot(aes(x=as.factor(goout), y=G3)) + 
  scale_x_discrete(name='Cantidad de veces que sale en al semana')

## Ejercicio 3. Hacer un scatterplot de la variable ausencias (en el eje X) y G3 (en el eje
# Y). Confeccionarlo tanto en la sintaxis base de R como usando el paquete
# ggplot2.

plot(df$goout, df$G3)

ggplot(df) + 
  geom_point(aes(x=goout, y=G3)) + 
  scale_x_discrete(name='Cantidad de veces que sale en al semana')

## Ejercicio 4. Usando ggplot2 generar un scatter igual al del punto 3 para cada valor de
# la variable sexo y otro para el status de los padres. ¿Puede encontrar alguna relación diferente entre ambas
#variables en los diferentes grupos?

ggplot(df) + 
  geom_point(aes(x=goout, y=G3, colour=sex)) + 
  facet_grid(~sex) +
  scale_x_discrete(name='Cantidad de veces que sale en al semana')

ggplot(df) + 
  geom_point(aes(x=goout, y=G3, colour=Pstatus)) + 
  facet_grid(~Pstatus) +
  scale_x_discrete(name='Cantidad de veces que sale en al semana')

