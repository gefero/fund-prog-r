##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA EN R. 
##       
## 2018
## Docente: German Rosati
##############################################################################

#################################
## CONSIGNAS PRACTICA PLOTTING ##
#################################

# Utilizando el dataset estud.csv (que contiene información sobre una encuesta
# a estudiantes de la escuela secundaria) resuelva las siguientes consignas:

## Ejercicio 1. Generar un histograma y un boxplot de la variable G3. Realizarlo tanto con 
# la sintaxis base de gràficos de R como con ggplot2. Analizar sus resultados.
# ¿Qué puede decir de la distribuciòn respecto a la tendencia central, simetría
# y dispersión?

## Ejercicio 2. Generar un boxplot de la varialbe G3 para cada uno de los diferentes
# grupos de la variable goout. ¿Puede observar alguna diferencia entre los
# diferentes grupos?

# Hay que transformar goout a factor para poder plotearla

## Ejercicio 3. Hacer un scatterplot de la variable ausencias (en el eje X) y G3 (en el eje
# Y). Confeccionarlo tanto en la sintaxis base de R como usando el paquete
# ggplot2.

## Ejercicio 4. Usando ggplot2 generar un scatter igual al del punto 3 para cada valor de
# la variable sexo y otro para el status de los padres. ¿Puede encontrar alguna relación diferente entre ambas
#variables en los diferentes grupos?

