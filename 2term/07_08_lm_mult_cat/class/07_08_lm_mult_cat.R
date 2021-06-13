
df <- read.csv("advertising.csv")
str(df)
pairs(df)

lm_fit1 <- lm(Sales ~ TV, data = df)
summary(lm_fit1)

lm_fit2 <- lm(Sales ~ Radio, data = df)
summary(lm_fit2)

lm_fit3 <- lm(Sales ~ Newspaper, data = df)
summary(lm_fit3)

lm_fit_full <- lm(Sales ~ TV + Radio + Newspaper, data = df)
lm_fit_full <- lm(Sales ~ . - X, data = df)
summary(lm_fit_full)
# y = b0 + b1*x
# y = b0 + b1*x1 + b2*x2
# y = b0 + b1*x1 + b2*x2 + b3*x3

lm_fit_opt <- lm(Sales ~ TV + Radio, data = df)
summary(lm_fit_opt)

# e = y - est(y)
# RSS = e[1]^2 +.... + e[n]^2 = sum(e^2)
# TSS = sum( (y - mean(y))^2 )
# R^2 = (TSS - RSS)/ TSS = 1 - RSS/TSS
# R^2 = cor(y, est(y))^2

# se = sd / sqrt(n) = sqrt( SS / n )
# RSE = sqrt( RSS / (n-2) ) - simple
# RSE = sqrt( RSS / (n - p - 1) ) - mulitple


# p * 30 = n
# p >> n =(


library(ISLR)
df <- Credit

# ifelse(), as.integer()
# y = b0 + b1*x
# x=0: y = b0
# x=1: y = b0 + b1

lm_fit4 <- lm(Limit ~ Gender, data = df)
summary(lm_fit4)

# x=1: b0+b1
# x=-1: b0-b1

# normal: 0, 1
# signif: 0, 1
# k levels -> k-1 features

# y = b0 + b1*x1 + b2*x2
# x1=0, x2=0: b0
# x1=1, x2=0: b0 + b1
# x1=0, x2=1: b0 + b2

lm_fit5 <- lm(Limit ~ Ethnicity, data = df)
summary(lm_fit5)



lm_fit6 <- lm(Limit ~ Education + Student, data = df)
summary(lm_fit6)

pairs(df)
