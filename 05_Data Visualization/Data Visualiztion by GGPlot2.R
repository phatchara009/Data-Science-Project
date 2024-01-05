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

# Plot แบบใส่แค่ data และ axis
ggplot(data = mtcars, 
       mapping = aes(x = hp, y = mpg))

################################################################################

# Scatter plot
ggplot(data = mtcars, 
       mapping = aes(x = hp, y = mpg)) + 
  geom_point() +
  geom_smooth()


ggplot(data = mtcars, 
       mapping = aes(x = hp, y = mpg)) + 
  geom_point() +
  geom_smooth() + 
  geom_rug()


# ไม่ต้องพิมพ์ชือ่ argument
ggplot(mtcars, aes(hp, mpg)) + 
  geom_point() +
  geom_smooth() + 
  geom_rug()

# ไม่ต้องพิมพ์ชือ่ argument
ggplot(mtcars, aes(hp, mpg)) + 
  geom_point(size = 3, col = "blue", alpha = 0.2)

################################################################################

## Histogram

ggplot(mtcars, aes(hp)) + 
  geom_histogram()

ggplot(mtcars, aes(hp)) + 
  geom_histogram(bins = 10, fill = "red", alpha = 0.5)

p <- ggplot(mtcars, aes(hp))

p + geom_histogram(bins=10)
p + geom_density()


################################################################################

## Box plot

p <- ggplot(mtcars, aes(hp))
p + geom_boxplot()


################################################################################

## Box plot by groups with diamond
table(diamonds$cut)
diamonds %>% 
  count(cut)

ggplot(diamonds, aes(cut)) +
  geom_bar(fill = "lightblue")


diamonds %>% 
  count(color)
ggplot(diamonds, aes(cut, fill=color)) +
  geom_bar()

ggplot(diamonds, aes(cut, fill=color)) +
  geom_bar(position = "stack") # default

ggplot(diamonds, aes(cut, fill=color)) +
  geom_bar(position = "dodge")

ggplot(diamonds, aes(cut, fill=color)) +
  geom_bar(position = "fill")

################################################################################

## Scatter plot by groups with diamond

# ใช้เวลานานในการ run
ggplot(diamonds, aes(carat, price)) +
  geom_point() 

# ลดเวลาด้วยการสุ่มตัวอย่าง
set.seed(42)
small_diamonds <- sample_n(diamonds, 5000)

ggplot(small_diamonds, aes(carat, price)) +
  geom_point() 

################################################################################

### Facet : small multiples

ggplot(small_diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~color)

ggplot(small_diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~color, ncol=4)

ggplot(small_diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~color, nrow=4)

ggplot(small_diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth(method = "lm", col="red") +
  facet_wrap(~color, nrow=4)

################################################################################

# Setting theme and label

ggplot(small_diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth(method = "lm", col="red") +
  facet_wrap(~color, nrow=4) +
  theme_minimal() +
  labs(title = "Relationship between caret and price by color",
       x = "Carat",
       y = "Price USD",
       caption = "Source: Diamonds from ggplot 2 package")

ggplot(small_diamonds, aes(carat, price, col=cut)) +
  geom_point(size = 3, alpha = 0.2) +
  facet_wrap(~color, ncol=2) +
  theme_minimal()

################################################################################




