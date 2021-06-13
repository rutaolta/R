data <- iris
str(iris)

library(tidyr)
library(dplyr)

data_long <- data %>% 
    mutate(id = row.names(.)) %>% 
    gather(key = "Measure", value = "Value", -id, -Species) %>% 
    separate("Measure", into = c("Part", "Measure")) %>% 
    mutate_at(vars(-Value), as.factor)
summary(data_long)

data_wide <- data_long %>% 
    spread(key = Measure, value = Value)

iris_df <- data_wide

# [, ]
setosa <- subset(iris, Species == "setosa", select = -5)

setosa_sepal <- subset(iris, Species == "setosa", select = c(1,2))[-42,]

setosa_out <- rbind(setosa_sepal, c(6.1, 3.3)) # outlier
setosa_lev <- rbind(setosa_sepal, c(5.1, 2.1)) # hight leverage point        

setosa_all <- rbind(setosa_sepal,
                    c(6.1, 3.3),
                    c(5.1, 2.1))


df <- read.csv("advertising.csv")

    