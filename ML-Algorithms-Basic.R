# LINEAR REGRESSION
  # Using "women" dataset

# Building model to predict weight with respect to height of women
LR_relation = lm(women$weight~women$height)
# Summary -> gives basic details about the model built
summary(LR_relation)

# abline -> plots line based on data
# cex - scale of plot
# pch - type of points
plot(women$height, women$weight, col = "blue", abline(LR_relation, col = "red"), 
     ylab = "Height in cms", xlab = "Weight in kgs", main = "Height vs Weight",
     cex = 1.3, pch = 16)

##############################################################################################

# MULTIPLE LINEAR REGRESION
  # Using subset of "mtcars" dataset

# Building model to predict "mpg" given "disp", "hp", "wt"
features = mtcars[, c("mpg", "disp", "hp", "wt")]
head(features)
mpg_relation = lm(mpg~disp+hp+wt, data = features)
mpg_relation

#Getting Intercept and coeffcients of each independent feature from the model
Intercept = coef(mpg_relation)[1]
Intercept
dispcoeff = coef(mpg_relation)[2]
dispcoeff
hpcoeff   = coef(mpg_relation)[3]
hpcoeff
wtcoeff   = coef(mpg_relation)[4]
wtcoeff

# Predicting "mpg" for given sample values
  # FORMULA -> mpg = Intercept + dispcoeff*x1 + hpcoeff*x2 + wtcoeff*x3
mpgoutput = Intercept + dispcoeff*221 + hpcoeff*102 + wtcoeff*2.91 
mpgoutput

##############################################################################################

#Logistic Regression
  # Using subset of "mtcars" dataset

# Building model to predict "am -> 0/1" given "cyl", "hp", "wt"
features = mtcars[, c("am", "cyl", "hp", "wt")]
head(features)

# glm -> Genralized lilnear models
Logistic_relation = glm(formula = am~cyl+hp+wt, data = features, family = binomial)
summary(Logistic_relation)

##############################################################################################

# DECISION TREES

# "party" package
# If using for first time, uncomment this line to install "party" package
# install.packages("party")
library(party)

#ctree - To plot decision tree that classifies records based on threshold values for each feature

#Decision tree for "readingSkills" dataset to classify native speakers
ctree_sample_data = readingSkills[c(1:105), ]
print(ctree_sample_data)

ctree_sample_output = ctree(formula = nativeSpeaker~age+shoeSize+score, data = ctree_sample_data)
plot(ctree_sample_output)

# Decision tree for "IRIS" dataset to classify species
ctree_iris = ctree(formula = Species ~ Petal.Length + Petal.Width + Sepal.Width + Sepal.Length,
                   data = iris)
plot(ctree_iris)

##############################################################################################

# RANDOM FOREST
  # Uses combination of decision trees and gives out confusion matrix of predictions with error rate

# "randomForest" package
# If using for first time, uncomment this line to install "randomForest" package
# install.packages("randomForest")
library(randomForest)

RF_sample_data = readingSkills[c(1:105), ]
print(RF_sample_data)

RF_sample_output = randomForest(formula = nativeSpeaker~age+shoeSize+score, data = RF_sample_data)
print(RF_sample_output)

##############################################################################################

# SURVIVAL ANALYSIS

# "survival" package
# If using for first time, uncomment this line to install "survival" package
# install.packages("survival")
library(survival)

# using "pbc" dataset to detect survival rate of patient based on treatment
pbc_survival_fit = survfit(formula = Surv(pbc$time, pbc$status)~pbc$trt)
plot(pbc_survival_fit, xlab="Time",ylab="Survival Probability", col=unique(pbc$trt))

##############################################################################################

# HIERARCHIAL CLUSTERING
  # Taking 50 sample indices from indices 1 to 150(number of records in iris)
indices = sample(1:dim(iris)[1], 30)
print(indices)
  # Creating subset of iris dataset
iris_sample = iris[indices, ]
print(iris_sample)

# Creating Hierarchial clustering(AVERAGE method) of iris_sample
hc_sample = hclust(dis(iris_sample), method = "ave")
plot(hc_sample, hang = -2, labels = iris_sample$Species)

##############################################################################################

# K-MEANS CLUSTERING

# Removing Species label from the iris dataset
unlabelled_iris = iris
unlabelled_iris$Species = NULL 
print(unlabelled_iris)

# Performing kmeans clustering with 3 centers (as we have 3 classes)
iris_kc = kmeans(unlabelled_iris, centers = 3)
print(iris_kc)

# Distribution of items across clusters
print(table(iris$Species, iris_kc$cluster))

# Visualize the cluster points and centers of each cluster/class
plot(x = iris$Sepal.Length, y = iris$Sepal.Width, col = iris_kc$cluster, cex = 0.7,
     xlab = "Sepal Length", ylab = "Sepal Width")
points(iris_kc$centers[, c("Sepal.Length", "Sepal.Width")], col = 1:3, pch = 8, cex = 2)

##############################################################################################
