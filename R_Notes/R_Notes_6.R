# R Notes #6 	9/10/2020

# PMF of the Sum of 2 Die Rolls

s=expand.grid(X1=1:6, X2=1:6)

s

length(table(rowSums(s)))

table(s$X1+s$X2)

pmf.p=table(s$X1+s$X2)/36		#population (theoretical)

attach(s)

pop=X1+X2

hist(pop, breaks=seq(1.5, 12.5, 1), freq=FALSE)

mean(pop)

var(pop)*(35/36)

sqrt(5.83333)

set.seed(111)				#ensures reproducibility of results

# Why cant I sample the actual pop? I get 2:12 is all the possible roll values 
# but the population is more than 2:12, it is all possible combinations, and Id
# like to sample that because sampling 2:12 is messing with probability.

sam=sample(2:12, size=1000, replace=T, prob=pmf.p)

sam

pmf.s=table(sam)/1000			#sample (empirical)

mean(sam)

sd(sam)

hist(sam)

hist(sam, breaks=seq(1.5, 12.5, 1), freq=FALSE)
