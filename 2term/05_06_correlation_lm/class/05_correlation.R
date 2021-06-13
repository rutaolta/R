df <- iris
x <- iris$Petal.Length
y <- iris$Petal.Width

plot(x, y)
cor(x, y)
cor(x, y, method = "spearman")

cor.test(x,y)

datasets::anscombe
