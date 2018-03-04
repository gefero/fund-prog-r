
##############################################################################
## Curso: FUNDAMENTOS DE LA PROGRAMACION ESTADISTICA EN R. 
##       
## 2018
## Docente: German Rosati
##############################################################################

#########################################
## SOLUCIONES PRACTICA EXTRA FUNCIONES ##
#########################################

## Ejercicio 1
# Crear una función que devuelva la suma de 2 enteros.

f.sum <- function (x, y) {
        r <- x + y
        r
}
f.sum(5, 10)
## [1] 15


# Ejercicio 2 
# Crear una función que devuelva TRUE si un entero dado está dentro de un vector

f.exists <- function (v, x) {
        exist <- FALSE
        i <- 1
        
        while (i <= length (v) & !exist) {
                
                if (v[i] == x) {
                        exist <- TRUE
                }
                i <- 1 + i
        }
        exist
}
f.exists(c(1:10), 10)
## [1] TRUE
f.exists(c(9, 3, 1), 10)
## [1] FALSE


# Ejercicio 3
# Crear una función que, dado un dataframe, imprima por pantalla el nombre de la columna y la clase de datos que contiene (por ejemplo, Variable1 es Numérico).

f.class <- function (df) {
        for (i in 1:ncol(df)) {
                cat(names(df)[i], "is", class(df[, i]), "\n")
        }
}
f.class(cars)
## speed is numeric 
## dist is numeric


# Ejercicio 4 
# Crear una función "unique", que dado un vector devuelva un nuevo vector con los elementos del primer vector con los elementos duplicados eliminados.

f.uniq <- function (v) {
        s <- c()
        
        for(i in 1:length(v)) {
                if(sum(v[i] == s) == 0) {
                        s <- c(s, v[i])
                }
        }
        s
}
f.uniq(c(9, 9, 1, 1, 1, 0))
## [1] 9 1 0


# Ejercicio 5 
# Crear una función que, dado un vector y un entero, retorne cuántas veces aparece el número entero dentro del vector.

f.count <- function (v, x) {
        count <- 0
        
        for (i in 1:length(v)) {
                if (v[i] == x) {
                        count <- count + 1
                }
        }
        count
}
f.count(c(1:9, rep(10, 100)), 10)
## [1] 100


# Ejercicio 6
# Crear una función que, dado un vector, imprimirá por pantalla la media y la desviación estándar, también imprimirá opcionalmente la mediana.

desi <- function(x, med=FALSE) {
        
        mean <- round(mean(x), 1)
        stdv <- round(sd(x), 1)
        cat("Mean is:", mean, ", SD is:", stdv, "\n")
        
        if(med) {
                median <- median(x)
                cat("Median is:", median , "\n")
        }
}
desi(1:10, med=TRUE)
## Mean is: 5.5 , SD is: 3 
## Median is: 5.5


# Ejercicio 7 
# Cree una función que, dado un número entero, calculará cuántos divisores tiene (distintos de 1 y de sí mismo). Haga que los divisores aparezcan por pantalla.

f.div <- function(n) {
        i <- 2
        counter <- 0
        
        while(i <= n/2) {
                if(n%%i==0) {
                        counter <- counter + 1
                        cat (i ,"\n")
                }
                i <- i + 1
        }
        counter
}
f.div(13)
## [1] 0
f.div(16)
## 2 
## 4 
## 8
## [1] 3


# Ejercicio 8 
# Cree una función que tenga un dataframe, y un número o personaje devuelva el dataframe con el carácter o número cambiado a NA.
f.na <- function (df, otherna) {
        for(i in 1:ncol (df)) {
                for(j in 1:nrow (df)) {
                        if(df[j,i] == otherna) {
                                df[j,i] <- NA
                        }
                }
        }
        df
}
carsnew <- f.na(cars, 10)
