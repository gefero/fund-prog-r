
##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA EN R. 
##       
## 2018
## Docente: German Rosati
##############################################################################

####################################
## CONSIGNAS PRACTICA DESCRIPTIVA ##
####################################


## Utilizando el dataset estud.csv (que contiene información sobre una encuesta a estudiantes de la escuela
# secundaria) resuelva las siguientes preguntas:

## Ejercicio 1. Existen varias variables en el dataset que están codificadas. Transfórmelas en factores con las etiquetas
# correspondientes.

## Ejercicio 2. ¿Cómo interpretaría la tendencia central, la dispersión y el sesgo de las siguientes variables del dataset?
# Calcule las medidas que considere más adecuadas e interprételas.
### age
### absences
### height
### G3 (notas finales)

## Ejercicio 3. Escribir una pequeña función que realice la estandarización (centrado en la media, escalado por el
# desvío estándar) de una variable cuantitativa. Aplicar la función a la variable height y comparar con
# los resultados de la función scale() de R.

## Ejercicio 4. ¿Cómo describiría la disponibilidad de tiempo libre fuera de las clases de los estudiantes que participaron
# del relevamiento? ¿Y las salidas con amigos?

## Ejercicio 5. ¿Cómo caracterizaría el consumo diario de alcohol de los estudiantes que participaron de la encuesta?

## Ejercicio 6. ¿Existe alguna diferencia en el promedio de notas finales (G3) entre los estudiantes que salen y los que
# no salen? ¿Y entre los que tienen actividades extracurriculares y los que no? ¿Y entre los que tienen
# apoyo extraescolar y los que no? (Pista: explorar el uso de la función by(); también puede realizarlo
# usando una de las funciones de la familia apply: tapply()).