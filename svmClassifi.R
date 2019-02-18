df <- read.csv("Social_Network_Ads.csv")
str(df)
df <- df[,3:5]

# converting the "purchased" column into factor

df$Purchased <- factor(df$Purchased, levels = c(0,1))
head(df)

#splitting the data
install.packages("caTools")
library(caTools)

split <- sample.split(df$Purchased, SplitRatio = 0.75)
training_set <- subset(df,split == TRUE)
test_set <- subset(df,split == FALSE)
#classifier
install.packages("e1071")
library(e1071)

classifier <- svm(formula = Purchased ~ .,
                  data = training_set,
                  type = "C-classification",
                  kernel = "linear")

y_pred <- predict(classifier,newdata = test_set[-3])

# confucion matrix
cm <- table(test_set[,3], y_pred)
#

