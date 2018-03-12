##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA EN R. 
##       
## 2018
## Docente: German Rosati
##############################################################################

########################################
####### GENERACION DE DATOS EN R #######
########################################

### 1. CREACION DE UN VECTOR ###
x<-c("Sun","Hot","High","Low","No") #  STRINGS

x<-c(1,2,7,3,88) #INTEGERS
x<-seq(from=0,to=10,by=1) # CREACION DE SECUENCIAS DE INTEGERS
x<-1:10 

x<-c(0.1,47.2,7.2) #NUMERICS
x<-seq(from=0,to=10,by=0.01) # CREACION DE SECUENCIAS DE NUMERICS

x<-c(TRUE, FALSE) #LOGICALS
x<-c(T, F) #LOGICALS-> EN GENERAL MEJOR NO USAR ESTA FORMA ABREVIADA

### CREACION DE UNA MATRIX ###
data<-matrix(data=c("Sun","Hot","High","Low","No",
"Sun","Hot","High","High","No",
"Overcast","Hot","High","Low","Yes",
"Rain","Sweet","High","Low","Yes",
"Rain","Cold","Normal","Low","Yes",
"Rain","Cold","Normal","High","No",
"Overcast","Cold","Normal","High","Yes",
"Sun","Sweet","High","Low","No",
"Sun","Cold","Normal","Low","Yes",
"Rain","Sweet","Normal","Low","Yes",
"Sun","Sweet","Normal","High","Yes",
"Overcast","Sweet","High","High","Yes",
"Overcast","Hot","Normal","Low","Yes",
"Rain","Sweet","High","High","No"), 
        nrow=14,ncol=5,byrow=TRUE,
        dimnames=list(c("D1","D2","D3","D4","D5","D6","D7","D8",
                        "D9","D10","D11","D12","D13","D14"),
                      c("Outlook","Temperature","Humidity",
                        "Wind","Play")))


### TRANSFORMACION EN DATAFRAME ###
data<-as.data.frame(data)

### SUBSETTING (SUBSETEANDO)
##DATAFRAMES == MATRIX

#POR INDICE
data[,1] #SELECCIONA LA COLUMNA 1 y TODAS LAS FILAS
data[,1:5] #SELECCIONA LA COLUMNA 1:5 y TODAS LAS FILAS
data[1,] #SELECCIONA LA FILA 1 y TODAS LAS COLUMNAS
data[1,1] # ??

#POR NOMBRE
names(data)
data$Outlook==data[,1]
		
########################################
########## ACTIVIDADES SEMANA 1. ###### 
########################################

# Una herramienta muy interesante es Swirl. 
# Es una plataforma que corre en R y sirve para programar y resolver ejercicios 
# con una guía interactiva en la misma línea de comando de R. 
# Para este curso les recomiendo el módulo que programó para su curso 
# Ismael Fernández (casualmente con un nombre muy parecido a este). 
# Para trabajar solamente tienen que instalar el paquete "swirl", cargar 
# la librería y correr este comando: 

install.packages("swirl")
library(swirl)
install_course_github("ifunam", "programacion-estadistica-r")

#Para esta unidad, les recomiendo trabajar con las unidades 1 a 4.

## 1. IMPORTAR EL DATASET "estuds.csv" 
# (se asume que el archivo está en el working directory)

setwd("/media/grosati/Elements/PEN/KINGSTON/PEN2/Cursos/REPO_Curso_Fund_Prog_R/Data/")
df <- read.csv("estud.csv", sep=";")
#write.table(df, "estud2.csv", sep=";",row.names = FALSE)


head(df)

## 2. GENERAR UNA FUNCION QUE DETERMINE SI UN NUMERO ES IMPAR

## 3. GENERAR UNA FUNCION QUE DETERMINE SI UN NUMERO ES PRIMO

## 4. GENERAR UNA FUNCION QUE CALCULE LA MEDIA DE UNA 
# COLUMNA CUANTITATIVA DEL DATASET. COMPARAR EL RESULTADO 
# CON LA FUNCION mean() 


x<-c(1,6,8,9,0,4,23,13)

sum(is.na(df$G3))

media <- function(x){
  sum <- 0
  for (c in 1:length(x)){
    sum <- sum + x[c]
  }
  m <- sum/length(x)
  return(m)
}


media2 <- function(x){
  sum <- 0
  n <- 0
  for (c in x){
    sum <- sum + c
    n <- n + 1
  }
  m <- sum / n
  return(m)
}

mean(df$age) == media2(df$age)
media(df$age) == mean(df$age)

## 5. GENERAR UNA FUNCION QUE CALCULE EL RANGO DE UNA 
# COLUMNA CUANTITATIVA DEL DATASET. COMPARAR EL RESULTADO 
# CON LA FUNCION range()

## 6. ESCRIBIR UNA FUNCION QUE CALCULE EL DESVIO ESTANDAR DE UNA 
# COLUMNA CUANTITATIVA DEL DATASET. COMPARAR EL RESULTADO CON LA
# FUNCION sd()

## 7. ESCRIBIR UNA FUNCION QUE CALCULE EL COEFICIENTE DE VARIACION 
# DE UNA COLUMNA CUANTITATIVA DEL DATASET. PISTA: SE PUEDE USAR ALGUNA
# DE LAS FUNCIONES GENERADAS MAS ARRIBA





## 8. LOS EXAMENES DE UNA MATERIA SE DISTRIBUYEN DE FORMA
# NORMAL CON UNA MEDIA DE 65 Y UN DESVIO DE 13.1.
# ¿QUÉ PROBABILIDAD HAY DE ENCONTRAR UN ESTUDIANTE
# QUE HAYA OBTENIDO 84 O MAS EN EL EXAMEN?

## 9. SUPONGA QUE HAY UN EXMAEN EN EL QUE HAY 20 PREGUNTAS DE 
# MULTIPLE CHOICE. CADA PREGUNTA TIENE CINCO RESPUESTAS
# CORRECTAS POSIBLE Y SOLAMENTE UNA ES CORRECTA.
# ENCONTRAR LA PROBABILIDAD DE QUE UN ESTUDIANTE 
# TENGA 4 O MENOS RESPUESTAS CORRECTAS SI INTENTA CONTESTAR
# CADA PREGUNTA ALEATORIAMENTE.


## 10. COMPRUEBE LA LEY DE LOS GRANDES NUMEROS
# PARA LA ESTIMACION DE UNA PROPORCION POBLACIONAL A PARTIR
# DE UNA MUESTRA


