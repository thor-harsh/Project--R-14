install.packages('e1071')
library(e1071)
model<-svm(Species ~ ., data=iris)
summary(model)
predict.values<-predict(model,iris[1:4])
table(predict.values,iris[,5])
tune.results<-tune(svm,train.x=iris[1:4],train.y = iris[,5],kernel='radial',
                   ranges=list(cost=c(0.1,1,10),gamma=c(0.5,1,2)))
summary(tune.results)

#So we want the best cost and gamma by tuning gridsearch as :
#Cost: 1
#Gamma: 0.5

tune.svm<-svm(Species ~ .,data=iris,kernel='radial',cost=1,gamma=0.5)