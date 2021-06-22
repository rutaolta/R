###############################################HW2

# Rewrite your function using *apply()
# Add formal argument to split the data
# Add calculation function as a formal argument to your function

name <- c("Barsik", "Murka", "Bobik", "Nusha")
weight <- c(8, 5, 20, 6)
is_cat <- c(T, T, F, F)
sex <- c("m", "f", "m", "f")

my_pets <- data.frame(name, weight, is_cat, sex)

f <- function(data_frame, row_selection=1:nrow(data_frame), column_selection=1:ncol(data_frame), func, split_arg){
  data_frame <- data_frame[row_selection, column_selection, drop = FALSE]
  data_frame <- split(data_frame, split_arg)
  
  cols <- lapply(data_frame, function(x) {
    return(lapply(x, function(y) {
      if (is.numeric(y)){
        return(func(y))
      }
      else {
        return(table(y))
      }
    })
    )
    
  })
  names(cols) = names(data_frame)
  return(list(subset = data_frame, summary = cols))
}

f(my_pets, column_selection = c('name', 'weight'), func = mean, split_arg = my_pets$sex)