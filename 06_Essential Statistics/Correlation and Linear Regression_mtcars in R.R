library(dplyr)

## Correlation
cor(mtcars$mpg, mtcars$hp)
cor(mtcars$hp, mtcars$mpg)

cor(mtcars$mpg, mtcars$wt)
cor(mtcars$wt, mtcars$mpg)

plot(mtcars$hp, mtcars$mpg, pch=16)
plot(mtcars$wt, mtcars$mpg, pch=16)
plot(mtcars$wt, mtcars$hp, pch=16)

cor(mtcars[, c("mpg", "wt", "hp")])

mtcars %>%
  select(mpg, wt, hp) %>%
  cor()

## compute correlation (r) and significance test
cor.test(mtcars$hp, mtcars$mpg)

################################################################################

## Linear Regression

# simple linear regression

# y = f(x)
# mpg = f(hp)
# lm(y ~ x, data = data)
lmFit <- lm(mpg ~ hp, data = mtcars)
lmFit

summary(lmFit)

lmFit$coefficients[[1]] + lmFit$coefficients[[2]] * 200

new_cars <- data.frame(
  hp = c(250, 320, 400, 410, 450)
)

## predict()
predict(lmFit, newdata = new_cars)
new_cars$mpg_pred <- predict(lmFit, newdata = new_cars)
new_cars

summary(mtcars$hp)

## Multiple Linear Regression
# mpg = f(hp, wt, am)
# mpg = intercept + b0*hp + b1*wt + b2*am

lmFit_v2 <- lm(mpg ~ hp + wt + am, data = mtcars)
lmFit_v2
summary(lmFit_v2)

coefs <- coef(lmFit_v2)
coefs[[1]] + coefs[[2]]*200 + coefs[[3]]*3.5 + coefs[[4]]*1

## Build Full Model
lmFit_Full <- lm(mpg ~ ., data = mtcars)
lmFit_Full
mtcars$predicted <- predict(lmFit_Full)

## Build Full Model out of gear
lm(mpg ~ . - gear, data = mtcars)


## Root Mean Square Error (RMSE)
squared_error <- (mtcars$mpg - mtcars$predicted)**2
squared_error

rmse <- sqrt(mean(squared_error))
rmse

################################################################################

# Split Data
set.seed(42) # เพื่อล็อกผลการสุ่มข้อมูล
n <- nrow(mtcars) # นับจำนวนแถว
id <- sample(1:n, size = n*0.8) # สุ่มเลขแถวจำนวน 80% ของข้อมูลทั้งหมด
id

train_data <- mtcars[id, ] # ดึงข้อมูลตามเลขแถวที่ถูกสุ่มมา
test_data <- mtcars[-id, ] # ดึงข้อมูลอื่นนอกจาก เลขแถวที่ถูกสุ่มมา

## Train Model
model1 <- lm(mpg ~ hp + wt, data = train_data)
p_train <- predict(model1)
rmse_train <- sqrt(mean(( train_data$mpg - p_train) **2 ))

## Test Model
p_test <- predict(model1, newdata = test_data)
rmse_test <- sqrt(mean(( test_data$mpg - p_test) **2 ))

## Print Result
cat("RMSE Train:", rmse_train,
    "\nRMSE Test:", rmse_test)

################################################################################

# Split Data
set.seed(42) # เพื่อล็อกผลการสุ่มข้อมูล
n <- nrow(mtcars) # นับจำนวนแถว
id <- sample(1:n, size = n*0.7) # สุ่มเลขแถวจำนวน 80% ของข้อมูลทั้งหมด
id

train_data <- mtcars[id, ] # ดึงข้อมูลตามเลขแถวที่ถูกสุ่มมา
test_data <- mtcars[-id, ] # ดึงข้อมูลอื่นนอกจาก เลขแถวที่ถูกสุ่มมา

## Train Model
model1 <- lm(mpg ~ hp + wt + am + disp, data = train_data)
p_train <- predict(model1)
rmse_train <- sqrt(mean(( train_data$mpg - p_train) **2 ))

## Test Model
p_test <- predict(model1, newdata = test_data)
rmse_test <- sqrt(mean(( test_data$mpg - p_test) **2 ))

## Print Result
cat("RMSE Train:", rmse_train,
    "\nRMSE Test:", rmse_test)

################################################################################













