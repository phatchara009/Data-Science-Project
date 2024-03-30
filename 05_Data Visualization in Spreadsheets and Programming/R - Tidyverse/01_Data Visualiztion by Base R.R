## get working directory
getwd()

## library tidyverse
install.packages("tidyverse")
library(tidyverse)

################################################################################

## basic plots (base R)

head(mtcars)
str(mtcars)

################################################################################

## Analyzing horse power
## Histogram - One Quantitative Variable
mean(mtcars$hp)
median(mtcars$hp)
sd(mtcars$hp)
hist(mtcars$hp)

################################################################################

str(mtcars)
mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))
str(mtcars)

## Bar Plot - One Qualitative Variable
barplot(table(mtcars$am))

################################################################################

boxplot(mtcars$hp)

## Whisker Calculation
(Q3_hp <- quantile(mtcars$hp, probs = .75))
(Q1_hp <- quantile(mtcars$hp, probs = .25))
(IQR_hp = Q3_hp - Q1_hp)
Q1_hp - 1.5 * IQR_hp
Q3_hp + 1.5 * IQR_hp

## Numerical form box plot
fivenum(mtcars$hp) # ใช้ทดแทนคำสั่งแบบด้านล่าง

min(mtcars$hp)
quantile(mtcars$hp, probs = c(.25, .5, .75))
max(mtcars$hp)


boxplot.stats(mtcars$hp, coef = 1.5)

mtcars_no_out <- mtcars %>%
  filter(hp < 335)
boxplot(mtcars_no_out$hp)

##################################

mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))
boxplot(mpg ~ am, data = mtcars,
        col = c("gold", "salmon"))

################################################################################
                    
## Scatter Plot — 2 Quantitative Variable
plot(mtcars$hp, mtcars$mpg, pch = 17, col="blue")
cor(mtcars$hp, mtcars$mpg)
lm(mpg ~ hp, data = mtcars)


plot(mtcars$hp, mtcars$mpg, pch = 17, 
     col="blue",
     main = "Relationship between Hp and MPG",
     xlab = "Hourse Power",
     ylab = "Miles Per Gallon")




















