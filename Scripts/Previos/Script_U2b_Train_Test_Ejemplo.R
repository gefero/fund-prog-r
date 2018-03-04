##########################################################################
#      MAESTRIA EN GENERACION Y ANALISIS DE INFORMACION ESTADISTICA      #
#               UNIVERSIDAD NACIONAL DE TRES DE FEBRERO                  #
##########################################################################

## Curso: FUNDAMENTOS DE PROGRAMACION ESTADISTICA EN R
## Agosto de 2017
## Docente: German Rosati

#########################################################
######## IMPLEMENTACIONES DE BOOTRAP, CV Y SPLIT ########
#########################################################
### Implementación simple de Boostrap ###
df_boot<-list()
rep<-500
for (i in seq(1,rep)){
        index<-sample(1,nrow(df), nrow(df),replace=TRUE)
        df_boot[[i]]<-df[index,]
}


### Implementación simple de train_test split
test_size<-0.3
test_index<-sample(1,nrow(df), round(test_size*nrow(df),0))
test<-df[test_index,]
train<-df[-test_index,]


### Implementación simple de cross-validation

n_boot <- 5
idex <- rep(seq(n_boot),length.out=nrow(data1))
