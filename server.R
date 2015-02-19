shinyServer(function(input,output){
	
	#Data
	females<-c(110,	111	,107	,108,	110,105,107,106,111,111)
	males<-c(120,107,110,116,114,111,113,117,114,112)
	
	difference<-mean(males)-mean(females)
	
	
	
	#Randomization function
	DifMeanAlea<-function(x,y){tsamp<-c(x,y);l<-length(x);ransam<-sample(tsamp,replace=F);mean(ransam[1:l])-mean(ransam[{1+l}:{2*l}])} # x and y are data vector
	
	
	ranset<-reactive({#Generating the randomized set of differences of means
	a<-NA;length(a)<-input$n-1;for(i in 1:(input$n-1))a[i]<-DifMeanAlea(males,females)
#Adding the observed difference
a<-c(a,difference);a})

	output$plot<-renderPlot({a<-ranset()
#Ahora visualizamos la distribución generada
hist(a,col="gold",main="Empirical distribution",sub="The red triangle is the observed difference")
#Marking the observed difference
points(c(4.8),c(0),pch=17,cex=3,col="red")})


	
	output$table<-renderTable(data.frame(females=females,males=males))
	
	
	output$results<-renderTable({a<-ranset();
		p1<-length(which(sort(a)>=difference))/input$n
data.frame("Females"=c(mean(females)),"Males"=c(mean(males)),"Difference"=c(difference),"OneTailP"=c(p1))})


	

})