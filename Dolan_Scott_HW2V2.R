# Author: Scott Dolan
# Course: STAT 401
# Date:   09/12/2020
# Homework #2
# Page 47-49  #1, 3, 4, 5, 11, 14, 16, 17, 19

## --- Clean up ---
rm(list = ls(all=T)) # clear the workspace
cat("\014")     # clear the console
graphics.off()  # clear all plots

##--- Load Libraries ---
library(tidyverse)
library(greekLetters)
library(latex2exp)

##--- Problem 1 ---
# An experiment is conducted to determine the optimal time and temperature 
# combination for baking a cake. The response variable of interest is taste. 
# Four batches of cake will be baked separately at each combination of baking 
# times (25 and 30 minutes) and temperature settings (275 o F, 300 o F, and 325 o F).

times = c(25,30)
temps = c(275,300,325)
combos = expand.grid(times,temps)
dat1 = data.frame(times,temps,'t'=combos[1:6,1],'T'=combos[1:6,2])

# (a) What are the experimental units?
cat(paste('The experimental units are minutes for the time and \u00B0F for temperature'))
# (b) What are the factors in this experiment?
print('The factors in this experiment is time and temperature.')
# (c) State the levels of each factor.
cat(paste('The time has two levels, 25 and 30 minutes and the temperature has three levels, 275, 300 and 325 \u00B0F'))
# (d) List all the treatments in this experiment.
print('There are not any treatments in this experiment since it is not a one-factor study')
# (e) Is the response variable qualitative or quantitative?
print('The response variable is taste which is qualitative')

##--- Problem 3 ---
# 3. A quantification of coastal water quality converts measurements on several 
# pollutants (arsenic in oyster shells, mercury, etc.) to a water quality index
# with values from 1 to 10. An investigation into the after-clean-up waterquality
# of a lake analyzes water samples collected from five areas encompassing the two
# beaches on the eastern shore and the three beaches on the western shore. Let
# μ 1 and μ 2 denote the mean water quality index for the beaches on the eastern
# shore, and μ 3 , μ 4 , and μ 5 be the mean water quality index for the beaches
# on the westernshore.

# (a) Write the contrasts that represent the effects of each of the five areas.

# Define our variables using uni-code inputs
mu = '\u0305\u3BC'
mu1 = '\u3BC\u2081'
mu2 = '\u3BC\u2082'
mu3 = '\u3BC\u2083'
mu4 = '\u3BC\u2084'
mu5 = '\u3BC\u2085'

# The answer for a):
cat(paste0('The contrasts representing the effects of each of the five areas 
            are: \n',
            mu1,'-',mu,'\n',mu2,'-',mu,'\n',mu3,'-',mu,'\n',mu4,'-',mu,'\n',
            mu5,'-',mu,'\n'))

# (b) Write the contrast for comparing the water quality around the two beaches
# on the eastern shore with that around the three beaches on the western shore.

# Use LaTeX to create an image of the equation representing the 
# contrast/solution to b):
plot(TeX("$\\frac{\\mu_1 + \\mu_2}{2}\\,- 
         \\frac{\\mu_3+\\mu_4+\\mu_5}{3}$"),cex=1)

# 4. An article reports on the results of a cloud-seeding experiment. 20 The 
# question of interest is whether cloud seeding with silver nitrate increases 
# rainfall. Out of 52 clouds, 26 were randomly selected for seeding, with the
# remaining 26 serving as controls. The rainfall measurements, in acre-feet, 
# are given in CloudSeedingData.txt. Use the R commands given in Example 1.8-4 
# to construct a comparative boxplot and comment on possible differences in 
# rainfall between seeded and unseeded clouds.

## --- Set working directory and read data in ---
setwd('/home/scott/Documents/STAT401/akritas_datasets/')
dat4 = read.table('CloudSeedingData.txt',header=T)

head(dat4)
w = stack(dat4) # stacks data and assigns indices
boxplot(w$values~w$ind, col = rainbow(4),ylab='Rainfall [acre-feet]',xlab='')

## --- Problem 4 Comments ---
# As shown in the boxplot, the control group received alot less rain than the 
# seeded group did. The mean of the control group is less than half the mean of 
# seeded group. The minimum of the seeded group is close to the control group
# however the maximum rainfall of the seeded group is over twice the maxium of
# the control. Both groups have outliers with the control having 3 and the seeded
# having 4. 

# 5. For its new generation of airplanes, a commercial airline is considering 
# three new designs of the control panel as possible alternatives to the current
# design with the aim of improving the pilot’s response time to emergency 
# displays. Letting μ 1 denote the mean pilot response time to simulated 
# emergency conditions with the current design, and μ 2 , μ 3 , and μ 4 denote 
# the mean response times with the three new designs, write the control versus 
# treatment contrasts.

cat(paste0('The contrasts for the conrol vs. treatment are: \n',
           mu1,'-',mu2,'\n',mu1,'-',mu3,'\n',mu1,'-',mu4,'\n'))

# 11. Import the data on monthly online and catalog sales of a company into the
# R object oc using oc = read.table(”MonthlySalesOC.txt”, header = T).

dat11 = read.table('MonthlySalesOC.txt',header=T)

# (a) Use R commands similar to those in Example 1.8-5 to construct a bar graph 
# comparing the online and catalog volumes of sale.

m = rbind(dat11$Online, dat11$Catalog)
# creates a data matrix
barplot(m, names.arg = dat11$Month, ylim = c(0, 20),
        col = c('darkblue', 'red'), legend.text = c('Online','Catalog'),
        beside = T, las = 2) # constructs the bar graph
# (b) Use R commands similar to those in Example 1.8-6 to construct a stacked
# bar graph showing the breakdown of the total volume of sales into online and
# catalog.


# (c) Comment on the relative advantages of each of the two types of plots.


 
 
 