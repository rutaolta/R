#install.packages('tidyverse')
install.packages("ggplot2")
library("tidyr")
library("dplyr")
library("ggplot2")

iris_long <- iris %>%
  pivot_longer(cols = -Species, names_sep = "\\.", names_to = c("Part", ".value"))

iris_long <- data.frame(iris_long)
str(iris_long)
head(iris_long)
ggplot(iris_long, aes(x = Length,
                      y = Width,
                      color = Part)) +
  geom_point()

#install.packages("gapminder")
library("gapminder")
str(gapminder)



gapminder %>%
  #filter(year == 2007) %>%
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             color = continent,
             size = pop)) +
  geom_point() + 
  xlim(0, 20000) +
  facet_wrap(~ year, ncol = 4, nrow = 3)


str(airquality)
airquality %>%
ggplot(aes(x = Day,
           y = Value))


airquality %>% 
  gather(Measure, Value, Ozone:Temp) %>%
  ggplot(aes(x = Day,
             y = Value,
             color = Measure)) +
  geom_point() + 
  geom_line(size = .5) +
  facet_grid(Measure ~ Month, scales="free")


airquality %>% 
  mutate(MonthStr = as.character(Month)) %>%
  ggplot(aes(x = Month,
             y = Temp,
             group = Month)) +
  geom_violin() +
  geom_jitter(aes(color = MonthStr), width = .2, alpha = .5)


quakes
require(graphics)
pairs(quakes, main = "Fiji Earthquakes, N = 1000", cex.main = 1.2, pch = ".")

quakes
quakes_long <- 
  quakes %>% 
  gather(key = day, value = val, X1:X31, na.rm = TRUE)


read.csv('/home/aliya/Downloads/frogs.csv')

library(tidyr)
quakes %>%
  gather(key = measure, value = val, "lat":"stations")

quakes_long <-
  quakes %>%
  gather(key = measure, value = val, "depth":"mag")