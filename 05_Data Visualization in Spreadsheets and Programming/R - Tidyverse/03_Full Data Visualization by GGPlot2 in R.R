temp <- c("high", "medium", "low", "low", "high")
class(temp)

## create ordinal factor
## factor: nominal vs. ordinal
temp2 <- factor(temp, 
                levels = c("low", "medium", "high"),
                ordered = TRUE)
class(temp2)

################################################################################

## ggplot2 - grammar of graphics plot 2D

# install.packages("ggthemes")
library(tidyverse)
library(ggthemes)

data(diamonds)

## how to choose visualization
## 1. number of variable
## 2. data type

## basic syntax

ggplot(data = mtcars, 
       mapping = aes(x = mpg)) +
  geom_histogram(bins=8)

ggplot(data = mtcars, 
       mapping = aes(y = mpg)) +
  geom_histogram(bins=8)

################################################################################

## one variable + continuous (number)

ggplot(diamonds,
       aes(x=price)) +
  geom_histogram()

ggplot(diamonds,
       aes(x=price)) +
  geom_density()

## DRY: Do not Repeat Yourself
base <- ggplot(diamonds, aes(x=price))
(p1 <- base + geom_histogram())
(p2 <- base + geom_density())

## Boxplot
ggplot(diamonds, aes(x=price)) +
  geom_boxplot()

## violin Plot 
ggplot(diamonds, aes(x=price, y=cut)) +
  geom_violin()

################################################################################

## one variable + discrete (factor)
ggplot(diamonds, aes(cut)) + 
  geom_bar()

diamonds %>%
  count(cut) %>%
  ggplot(data = ., mapping=aes(x=cut, y=n)) +
  geom_col()

################################################################################

## two variables: number x number

## scatter plot
## setting vs. mapping

ggplot(diamonds,
       mapping = aes(x=carat, y=price)) +
  geom_point()

set.seed(99)
ggplot(diamonds %>% sample_n(500), 
       mapping = aes(x=carat, y=price)) +
    geom_point()

set.seed(99)
ggplot(diamonds %>% sample_n(500), 
       # mapping
       mapping = aes(x=carat, y=price, 
                     color=cut, shape=cut)) +
  # setting
  geom_point(alpha=0.4, size=2) +
  labs(
    title="My first scatter plot",
    subtitle="Cool ggplot2",
    caption="Data: diamonds in Africa",
    y = "Price in USD",
    x = "Carat Diamonds"
  ) +
  theme_minimal()

################################################################################

## bin2D
ggplot(diamonds, aes(carat, price)) +
  geom_bin2d(bins=10)

ggplot(diamonds, aes(carat, price)) +
  geom_bin2d(bins=50)

ggplot(diamonds, aes(carat, price)) +
  geom_bin2d(bins=100)

################################################################################

## shortcut qplot()
## quick plot

qplot(x = carat, data = diamonds, geom="density")
qplot(x = carat, data = diamonds, geom="histogram")
qplot(cut, data = diamonds, geom="bar")

################################################################################

## layers in ggplot2
base <- ggplot(diamonds %>% 
                 sample_n(1000) %>%
                 filter(carat <= 2.8),
               aes(x=carat, y=price))
base

p3 <- base + 
  theme_minimal() +
  geom_point(alpha=0.7, color="#d2e80e") +
  geom_smooth(method="loess", se=TRUE)
p3

base + 
  theme_minimal() +
  geom_point(alpha=0.7, color="#d2e80e") +
  geom_smooth(method="lm", se=TRUE, fill="gold", color="red")

base + 
  theme_minimal() +
  geom_point(alpha=0.7, color="#d2e80e") +
  geom_smooth(method="loess", se=FALSE)

base + 
  theme_minimal() +
  geom_point(alpha=0.7, color="#d2e80e") +
  geom_smooth(method="loess", se=FALSE) +
  geom_rug()

################################################################################

## bar plot
ggplot(diamonds, aes(cut)) +
  geom_bar(color = "red") + 
  theme_minimal()

ggplot(diamonds, aes(cut, fill=clarity)) +
  geom_bar() + 
  theme_minimal()

ggplot(diamonds, aes(cut, fill=clarity)) +
  geom_bar(position="dodge") + 
  theme_minimal()

ggplot(diamonds, aes(cut, fill=clarity)) +
  geom_bar(position="fill") + 
  theme_minimal()

################################################################################

## How to change color?
ggplot(diamonds, aes(cut, fill=cut)) +
  geom_bar() +
  theme_minimal() +
  scale_fill_manual(values = c("red", "green", "blue", "gold", "black"))

ggplot(diamonds, aes(cut, fill=cut)) +
  geom_bar() +
  theme_minimal() +
  scale_fill_brewer(palette = "Accent")

################################################################################

## heat map color scale
ggplot(diamonds %>%
         sample_frac(0.1), aes(carat, price, color=price)) +
  geom_point(alpha=0.3) +
  theme_minimal() +
  scale_color_gradient(low = "gold", high = "purple")

################################################################################

## multiple sub-plots (facet)
ggplot(diamonds %>%
       sample_frac(0.2), aes(carat,price)) +
  geom_point(alpha=0.2, size=2, color="red") +
  geom_smooth(method="lm", color="black") +
  theme_minimal() +
  facet_wrap(~ cut, ncol=3)

ggplot(diamonds %>%
       sample_frac(0.2), aes(carat,price)) +
  geom_point(alpha=0.2, size=2, color="red") +
  geom_smooth(method="lm", color="black") +
  theme_minimal() +
  facet_grid(clarity ~ cut)

ggplot(diamonds %>%
         sample_frac(0.2), aes(carat,price)) +
  geom_point(alpha=0.2, size=2, color="red") +
  geom_smooth(method="lm", color="black") +
  theme_minimal() +
  facet_grid(rows = vars(clarity), cols = vars(cut))

################################################################################

## multiple dataframes
m1 <- mtcars %>% filter(mpg > 30)
m2 <- mtcars %>% filter(mpg <= 20)

ggplot() +
  theme_minimal() +
  geom_point(data=m1, aes(wt, mpg), color="blue") +
  geom_point(data=m2, aes(wt, mpg), color="red", size=3)

################################################################################

# install.packages("patchwork")
library(patchwork)
p1 <- qplot(hwy, data=mpg, geom="density")
p2 <- qplot(cty, data=mpg, geom="histogram")
p3 <- qplot(cty, hwy, data=mpg, geom="point")
p4 <- qplot(cty, hwy, data=mpg, geom="smooth")

(p1 + p2 + p3) / p4

p1 / (p2 + p3 + p4)

################################################################################








