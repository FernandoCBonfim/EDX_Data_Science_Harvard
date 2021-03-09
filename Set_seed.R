set.seed(1, sample.kind="Rounding")  
library(tidyverse)

library(dslabs)
data(heights)

x <- heights %>% filter(sex == "Male") %>%
  .$height
View(x)

N <- 50
X <- sample(x,N,replace=TRUE)
mean(X)
sd(X)

se <- sd(X)/sqrt(N)
se

a <- c(0.025,0.975) 
ci <- qnorm(a,mean(X),se)
ci

mu <- mean(x)
set.seed(1)
N <- 50
B <- 10000
res <- replicate(B,{
  X <- sample(x,N,replace = TRUE)
  se <- sd(X)/sqrt(N)
  a <- c(0.025,0.975) 
  ci <- qnorm(a,mean(X),se)
  between(mu,ci[1],ci[2])
})
mean(res)

