##########################################################################
#      MAESTRIA EN GENERACION Y ANALISIS DE INFORMACION ESTADISTICA      #
#               UNIVERSIDAD NACIONAL DE TRES DE FEBRERO                  #
##########################################################################

## Curso: FUNDAMENTOS DE PROGRAMACION ESTADISTICA EN R
## Agosto de 2016
## Docente: German Rosati

########################################
######## EJEMPLO DE OVERFITTING ########
########################################

### GENERA DATOS SIMULADOS  -TrS- ###
set.seed(3)
q<-seq(from=0,to=20,by=0.1)
y<-500+0.4*(q-10)^3 
noise<-rnorm(length(q), mean=10, sd=80)
noisy.y<-y+noise 

### GENERA TEST SET -TeS- ###
qt<-seq(from=0,to=20,by=0.1)
yt<-500+0.4*(qt-10)^3 
noiset<-rnorm(length(qt), mean=10, sd=80)
noisy.yt<-yt+noiset 

### GRAFICA DATOS Y FUNCION REAL ###
par(mfrow=c(1,2))
plot(q,noisy.y,col='deepskyblue4',xlab='x',ylab="y",main='Datos observados')
lines(q,y,col='firebrick1',lwd=3)


### GENERA MATRIZ DONDE GUARDAR LAS PREDICCIONES ###
predict<-matrix(NA,ncol=50,nrow=length(q))

#colnames(predict)<-c(rep("Train",25),rep("Test",25))

### LOOP PARA GENERAR 25 MODELOS POLINOMICOS Y 50 PREDICCIONES SOBRE TrS y TeS ###
for (i in 1:25){
        model<-lm(noisy.y ~poly(q,i,raw=TRUE))
        predict[1:length(q),i]<-predict(model)
        #lines(q,predict_Tr[[i]],col=cm.colors(i, alpha = 1),lwd=3)
        predict[1:length(q),i+25]<-predict(model,as.data.frame(cbind(qt,yt)))
}

### AGREGA LINEAS DE ALGUNOS MODELOS AL GRAFICO ###
lines(q,predict[,1],col="orange",lwd=3)
lines(q,predict[,3],col="blue",lwd=3)
lines(q,predict[,25],col="green",lwd=3)

mse<-matrix()
mse<-cbind(apply(((noisy.y-predict[,1:25])**2),2,mean),
apply(((noisy.yt-predict[,26:50])**2),2,mean))

plot(x=1:25,mse[,1],type="l",col="deepskyblue4",ylim=c(4000,10500),lwd=3,
     xlab="Complejidad",ylab="MSE",main='Errores')
lines(mse[,2],col="grey",lwd=3)

points(x=1,mse[1,1],pch=15,col="orange",cex=1.8)
points(x=1,mse[1,2],pch=15,col="orange",cex=1.8)
points(x=3,mse[3,1],pch=15,col="blue",cex=1.8)
points(x=3,mse[3,2],pch=15,col="blue",cex=1.8)
points(x=25,mse[25,1],pch=15,col="green",cex=1.8)
points(x=25,mse[25,2],pch=15,col="green",cex=1.8)
