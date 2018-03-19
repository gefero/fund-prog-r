##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA Y DATA MINING EN R. 
##        ESTADISTICA DESCRIPTIVA, MODELOS DE REGRESION Y ARBOLES DE DECISION
##       
## Marzo 2018
## Docente: German Rosati
##############################################################################

############################
## ACTIVIDADES UNIDAD 3. ##
############################

## 1. IMPORTAR EL DATASET "ED_deptos_venta_2014" 
# (se asume que el archivo está en el working directory)
setwd("F:/PEN/KINGSTON/PEN2/Cursos/2017_R_Arboles_UNTREF/PPT/Clase 3")
data<-read.csv("ED_deptos_venta_2014.csv", sep=";")

## 2. REALICE UN ANÁLISIS EXPLORATORIO DE LOS DATOS: 
        # ¿QUÉ VARIABLES SE ENCUENTRAN ASOCIADAS?
        # ¿QUÉ FORMA TIENE LA ASOCIACION?

## 3. GENERE ALGUNAS VISUALIZACIONES (Boxplots, Histogramas, Scatterplots) 
##    DE AQUELLAS VARIABLES QUE CONSIDERE RELEVANTES

## 4. GENERE UN MODELO DE REGRESION SIMPLE ENTRE LA ANTIGUEDAD DEL DEPARTAMENTO Y EL PRECIO

## 5. SELECCIONE AQUELLAS VARIABLES QUE CONSIDERE RELEVANTES PARA LA DETERMINACION 
##    DEL PRECIO DEL DEPARTAMENTO Y GENERE UN MODELO DE REGRESION MULTIPLE. 
##    REALICE UNA EVALUACION DEL MISMO.



## 6. IMPORTAR EL DATASET "data_filt.csv". 
# Es una versión resumida de la EPH 2do. semestre de 2015. 
# Contiene las siguientes variables de los asalariados ocupados:
        # Edad -ch06-
        # Nivel educativo -nivel_ed-
        # Horas de trabajo totales -htot-
        # Calificación de la ocupación -calif-
        # Ingreso laboral total -p47t-
# (se asume que el archivo está en el working directory)

setwd("/media/grosati/Elements/PEN/KINGSTON/PEN2/Cursos/REPO_Curso_Fund_Prog_R/Data")
df <- read.csv("data_filt.csv")

## 7. REALICE UN ANÁLISIS EXPLORATORIO DE LOS DATOS: 
# ¿QUÉ VARIABLES SE ENCUENTRAN ASOCIADAS?

## 8. RECODIFICAR LA VARIABLE p47t en dos grupos (altos y bajos ingresos) A PARTIR DE LA MEDIANA

## 9. ENTRENAR UN MODELO DE REGRESIÓN LOGISTICA PARA PREDECIR LA PROBABILIDAD DE QUE UNA PERSONA
# OCUPADA Y ASALARIADA TENGA INGRESOS MAYORES A LA MEDIANA. 
## Asegurarse de estimar de forma correcta el error.




summary(df$p47t)
