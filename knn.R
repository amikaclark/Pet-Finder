getwd()
pet <- read.csv("train.csv")
pet <- pet[-c(2,19,21,22)]
pet$AdoptionSpeed <- factor(pet$AdoptionSpeed)
#normalize data
normalize <- function(x){
  return((x-min(x)) / (max(x) - min(x)))
}
pet_n <- as.data.frame(lapply(pet[1:19], normalize))
names(pet_n)
summary(pet_n)

pet_train <- pet_n[1:12750, ]
pet_test <- pet_n[12751:14993, ]


library(class)
#make label vector
pet_train_labels <- pet[1:12750, 20]
pet_test_labels <- pet[12751:14993, 20]

pet_model <- knn(train = pet_train, test = pet_test, cl= pet_train_labels, k=3)
pet_test_pred <- knn(train = pet_train, test = pet_test, cl = pet_train_labels, k=21)
pet_test_pred <- knn(train = pet_train, test = pet_test, cl = pet_train_labels, k=30)
pet_test_pred <- knn(train = pet_train, test = pet_test, cl = pet_train_labels, k=60)

attributes(pet_model)
summary(pet_model)
class(pet_model)
