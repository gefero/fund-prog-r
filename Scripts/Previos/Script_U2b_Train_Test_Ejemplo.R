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


df<-read.csv("/media/grosati/Elements/PEN/KINGSTON/PEN2/Cursos/REPO_Curso_Fund_Prog_R/Data/default.csv", sep=",")
df<-df[sample(nrow(df)),]
shuffle<-sample(1,nrow(df),nrow(df))

df$default<-as.character(df$default)
df$default[df$default=='No']<-0
df$default[df$default=='Yes']<-1
df$default<-as.numeric(df$default)



### Implementación simple de Boostrap ###
df_boot<-list()
means<-vector(length = 500)
rep<-500
for (i in seq(1,rep)){
        index<-sample(1:nrow(df), nrow(df), replace=TRUE)
        df_boot[[i]]<-df[index,]
        #means[i]<-mean(df_boot[[i]])
}

df_boot

### Implementación simple de train_test split
test_size<-0.3
test_index<-sample(1,nrow(df), round(test_size*nrow(df),0))
test<-df[test_index,]
train<-df[-test_index,]


### Implementación simple de cross-validation
# Shuffle de casos
shuff<-sample(x=1:nrow(data), size=nrow(data), replace=FALSE)
data<-data[shuff,]
rm(shuff)

k<-5
index<-rep(1:k,length.out=nrow(data))

#train<-data[!(index %in% 4),]

model<-list()
probs<-list()
for (i in 1:k){
        train<-data[!(index %in% i),]
        test<-data[index %in% i,]
        model[[i]]<-glm(default ~. , data = train, family = "quasibinomial")
        probs[[i]]<-predict(model[[i]], test, type = "response")
}


