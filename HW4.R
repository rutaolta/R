###############################################HW4

# to implement only index selection for rows
# the output is still the list of 2 parts: subset and summary. 
# But summary doesn’t need to be a list itself anymore, it can be 1 or 2 data frames (you will need to use summarize() function inside). 
# Split still need to be implemented, but with dplyr approach (hope you understand what I mean)

library(dplyr)

name <- c("Barsik", "Murka", "Bobik", "Nusha")
weight <- c(8, 5, 20, 6)
is_cat <- c(T, T, F, F)
sex <- c("m", "f", "m", "f")
age <- c(1, 5, 3, 15)

my_pets <- data.frame(name, weight, is_cat, sex, age)
# my_pets

#my_pets %>%
#  slice(1:3) %>%
#  group_by(sex) %>%
#  summarise_if(is.numeric, funs(mean), na.rm = TRUE)



f <- function(data_frame, row_selection=1:nrow(data_frame), column_selection = 1:ncol(data_frame), func, split_factor){
  
  subset_res <- data_frame %>%
    select(column_selection) %>%
    slice(row_selection) 
    
  summary_res <- subset_res %>%
    group_by_(split_factor) %>%
    summarise_all(function(x) {
      if (is.numeric(x)) {
        func(x)
      }
      else {
        table(x)
      }
    })
      
    #summarise_if(is.numeric, .funs = func, na.rm = TRUE) #%>%
    #summarise_if(Negate(is.numeric), .funs = table, na.rm = TRUE) #paste
    #summarise_all(~ if(is.numeric(.)) func(., na.rm = TRUE) else table(.))
  
  #summary_res2 = data_frame %>%
  #  slice(row_selection) %>%
  #  group_by_(split_factor) %>%
  #  summarise_if(Negate(is.numeric), .funs = table, na.rm = TRUE)
  
  return(list(subset = subset_res, summary = summary_res))# + summary_res2))
}

f(data_frame = my_pets, row_selection = c(1:3), column_selection = c(1:4), func = mean, split_factor = "sex")