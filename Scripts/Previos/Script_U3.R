##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA Y DATA MINING EN R. 
##        ESTADISTICA DESCRIPTIVA, MODELOS DE REGRESION Y ARBOLES DE DECISION
##       
## Julio 2017
## Docente: German Rosati
##############################################################################

############################
## ACTIVIDADES UNIDAD 2. ##
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
