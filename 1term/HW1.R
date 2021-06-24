###############################################HW1

# Write a function that:
# Takes data frame, row selection and column selection as arguments
# Subsets data according to the given selections. Possible selections are:
###### By index/indexes
###### By name/names
###### By logical vector
# For each column of the subsetted data performs some computations:
###### For numeric data – any of sum(), mean(), sd(), etc. As you wish
###### For non-numeric data (characters and logical vectors, factors) – frequency table
# Returns an output as a data frame and calculation results as a list (subset + summary)
# Apply it in a few examples for test

name <- c("Barsik", "Murka", "Bobik", "Nusha")
weight <- c(8, 5, 20, 6)
is_cat <- c(T, T, F, F)
sex <- c("m", "f", "m", "f")

my_pets <- data.frame(name, weight, is_cat, sex)
# my_pets

f <- function(data_frame, row_selection, column_selection){
    data_frame <- data_frame[row_selection,column_selection, drop=FALSE]
    
    l <- list()
    for (i in 1:ncol(data_frame)) {
        if (is.numeric(data_frame[,i])){
            l[[names(data_frame)[i]]] <- sum(data_frame[,i])
        }
        else {
            l[[names(data_frame)[i]]] <- table(data_frame[,i])
        }
    }
    
    return(list(subset=data_frame, summary=l))
}

f(my_pets, row_selection = c(1, 2), column_selection = c(1))

# f(my_pets, row_selection = c(T, F, F, T), column_selection = c(T,F,F,F))

# f(my_pets, column_selection = c('name', 'weight'))