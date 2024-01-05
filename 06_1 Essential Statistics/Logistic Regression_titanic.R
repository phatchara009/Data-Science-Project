## Logistic Regression
library(dplyr)

data(mtcars)

mtcars %>% head()

str(mtcars)

## convert am to factor
mtcars$am <- factor(mtcars$am, 
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))

class(mtcars$am)
table(mtcars$am)

# Split Data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size = n*0.7)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

## train model
logit_model <- glm(am ~ mpg, data = train_data, family="binomial")
p_train <- predict(logit_model, type="response") ## probability
train_data$pred <- if_else(p_train >= 0.5, "Manual", "Auto")
mean(train_data$am == train_data$pred)

## test model
p_test <- predict(logit_model, newdata = test_data, type="response") ## probability
test_data$pred <- if_else(p_test >= 0.5, "Manual", "Auto")
mean(test_data$am == test_data$pred)


################################################################################

## Logistic Regression Example 2
# Binary Classification

## Create dataset
happiness <- c(10,8,9,7,8,5,9,6,8,7,1,1,3,1,4,5,6,3,2,0)
divorce <-   c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1)
df <- data.frame(happiness, divorce)

## Fit Logistic Regression Full Dataset
model <- glm(divorce ~ happiness, data = df, family="binomial")
summary(model)

## Predict and Evaluate Model
df$prob_divorce <- predict(model, type="response")
df$pred_divorce <- if_else(df$prob_divorce >= 0.5, 1, 0)

## confusion matrix
conM <- table(df$pred_divorce, df$divorce, 
              dnn=c("Predicted", "Actual"))
conM

## Model Evaluation
cat("Accuracy:", (conM[1,1] + conM[2,2]) / sum(conM))
cat("Precision:", conM[2,2] / (conM[2,1] + conM[2,2]))
cat("Recall:", conM[2,2] / (conM[1,2] + conM[2,2]))
cat("F1-score:", 2*0.9*0.9/(0.9+0.9))

################################################################################

## Logistic Regression Example 2

install.packages("titanic")
library(titanic)

data(titanic_train)

# Drop NA (missing values)
titanic_train <- na.omit(titanic_train)
titanic_train

# Split Data
set.seed(42)
n <- nrow(titanic_train)
id <- sample(1:n, size=n*0.7) ## 70% train 30% test
train_data <- titanic_train[id, ]
test_data <- titanic_train[-id, ]

## Fit Model
logit_model <- glm(Survived ~ Pclass, data = train_data, family="binomial")
summary(logit_model)

## Evaluate train data
p_train <- predict(logit_model, type="response") ## probability
train_data$pred <- if_else(p_train >= 0.5, 1, 0)
mean(train_data$Survived == train_data$pred)

## Evaluate test data
p_test <- predict(logit_model, newdata = test_data, type="response") ## probability
test_data$pred <- if_else(p_test >= 0.5, 1, 0)
mean(test_data$Survived == test_data$pred)

################################################################################





































