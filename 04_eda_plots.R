## anscombe data---------------------------------------------------------
data("anscombe")
dim(anscombe)
head(anscombe)


class(anscombe)
str(anscombe)


## ---------------------------------------------------------
mean(anscombe$x1)
mean(anscombe$x2)
mean(anscombe$x3)
mean(anscombe$x4)


## -apply function works for dataframes, MARGIN = 1 refers to rows, MARGIN = 2 refers to columns.
apply(anscombe[,1:4], 2, mean) #applied to a partial dataframe but that's optional
apply(anscombe[,5:8], 2, mean)
apply(anscombe, 2, var)



## correlations---------------------------------------------------------
cor(anscombe$x1, anscombe$y1)
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4)


## ---linear models--and their coefficients-----------------
m1 <- lm(anscombe$y1 ~ anscombe$x1)
m2 <- lm(anscombe$y2 ~ anscombe$x2)
m3 <- lm(anscombe$y3 ~ anscombe$x3)
m4 <- lm(anscombe$y4 ~ anscombe$x4)

coef(m1)
coef(m2)
coef(m3)
coef(m4)


## --create a list with these models-----------------------
mlist <- list(m1, m2, m3, m4)
##function lapply applies a function to each element of a list
lapply(mlist, coef)

# plotting the anscombe dataset:----

par(mfrow = c(2,2), #you ask for 2 x 2 plot layout
    las = 1, #vertical axis labels
    bty = "l") #box type. check par() function for more options!
plot(anscombe$y1 ~ anscombe$x1)
abline(mlist[[1]]) # the double bracket selects for the nth element of a list. you are plotting the abline for m1
plot(anscombe$y2 ~ anscombe$x2)
abline(mlist[[2]])
plot(anscombe$y3 ~ anscombe$x3)
abline(mlist[[3]])
plot(anscombe$y4 ~ anscombe$x4)
abline(mlist[[4]])
par(mfrow=c(1, 1)) #you have to go back to default par() options or all your plots will be 2 x 2.


## --the iris dataset----
data(iris)
head(iris)
summary(iris)

#how many observations?
table(iris$Species)

plot(iris$Species) #barplot is the default function when you plot a categorical variable


## central tendency measures
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
##
# for each species:
tapply(X = iris$Sepal.Length,
       INDEX = iris$Species,
       FUN = mean)
## the third apply family functions is tapply that applies a function in one vector along the categories of a second vector (INDEX) so this calculation is for each species

tapply(X = iris$Sepal.Length,
       INDEX = iris$Species,
       FUN = median)


# mode----
# we use table to see how many times a value appears in a vector, sort it in decreasing order and select the first element
freqf <- sort(table(iris$Sepal.Length),
              decreasing = TRUE)
freqf[1] #the most common value (mode) is 5, it appears 10 times


## --variation measures--
range(iris$Sepal.Length)
diff(range(iris$Sepal.Length))


## --
var(iris$Petal.Length) # variance
sd(iris$Petal.Length) #standard deviation
sd(iris$Petal.Length) / mean(iris$Petal.Length) * 100 # variation coefficient

# for each species:
tapply(X = iris$Sepal.Length, INDEX = iris$Species, FUN = sd)
tapply(X = iris$Sepal.Width, INDEX = iris$Species, FUN = sd)


## -quantiles: remember summary also returns these
quantile(iris$Petal.Length) #quantiles
quantile(iris$Petal.Length, probs = c(0.05, 0.5, 0.95)) #other quantiles
IQR(iris$Petal.Length) #inter-quantile range
summary(iris$Petal.Length)


## --bosplot:
boxplot(iris$Petal.Length)


## --JUST FOR ILLUSTRATION PURPOSES: look at the illustrative boxplot
set.seed(2) #sets a seed for reproducibility purposes, any random sampling will be the same (instead of randomly different)
par(bty = "n") #no box
bp <- rnorm(1000, 0, 0.1) #creates a vector of 1000 values that follow a normal distribution
#plots it: with no axes
boxplot(bp, yaxt = "n", xlim = c(0, 3), ylim=c(-0.3, 0.3))
#annotates: text is one of the functions that OVERLAY the current device
text(x = 2, y = min(bp), "last point (-1.5 x IQR)", cex = 2)
text(x = 2, y = quantile(bp)[2], "first quantile", cex = 2)
text(x = 2, y = median(bp), "median", cex = 2)
text(x = 2, y = quantile(bp)[4], "third quantile", cex = 2)
text(x = 2, y = bp[203], "last point (+1.5 x IQR)", cex = 2)
#arrows also can be added, check the help info
arrows(x0 = 0.68, x1 = 0.68,
       y0 = quantile(bp)[2], y1 = quantile(bp)[4],
       code = 3, length = 0.05)
text(x = 0.54, y = median(bp), "IQR", cex = 2)


## --histograms----
hist(iris$Sepal.Width)
hist(iris$Sepal.Length)
hist(iris$Petal.Length)


## ---probability density or absolute frequency histograms
par(mfrow = c(1,2)) #two plots
hist(iris$Sepal.Length)
hist(iris$Sepal.Length, probability = TRUE) # empirical probabilistic density curve
par(mfrow = c(1,1))


## --adding a density curve
par(mfrow = c(1,2))
plot(density(iris$Sepal.Width))
hist(iris$Sepal.Width, probability = TRUE) # empirical probabilistic density curve
lines(density(iris$Sepal.Width), col="blue")
par(mfrow = c(1,1))


## --breaks in histograms
par(mfrow = c(1,3))
hist(iris$Petal.Length)
hist(iris$Petal.Length,
     breaks = seq(0, max(iris$Petal.Length), length = 4))
hist(iris$Petal.Length,
     breaks = seq(0, max(iris$Petal.Length), length = 6))
par(mfrow = c(1,1))


## -scatter plots
x <- iris$Petal.Length
y <- iris$Petal.Width
plot(x, y)
#but you can also avoid creating the vectors
plot(iris$Petal.Length, iris$Petal.Width) #check the help for parameter order, x, y axis.
plot(iris$Petal.Width ~ iris$Petal.Length) #remember the formula notation


## ----correlation----
cor(x, y)

#the basic plot:
plot(iris$Petal.Length, iris$Petal.Width)
#let's change some parameters
plot(iris$Petal.Length, iris$Petal.Width,
     xlab = "Petal Length (mm)", #labels
     ylab = "Petal width (mm)",
     pch = 19) #symbol shape
#fit a linear model
lmod <- lm(Petal.Width ~ Petal.Length, data = iris)
coef(lmod) #just to see the coefficients
abline(lmod, col = "red")



## -symbol color can follow a vector:
plot(iris$Petal.Length, iris$Petal.Width,
     xlab = "Petal Length (mm)",
     ylab = "Petal width (mm)", pch = 19,
     col = iris$Species)


## -and there are MANY options for color in R, one example is package wesanderson, we'll create a vector for colors
pal <- wesanderson::wes_palette(name = "Darjeeling1", n = 3)
pal
as.character(pal) #to see the hexadecimal color codes. just one of the many ways to codify colors

plot(iris$Petal.Length, iris$Petal.Width,
     xlab = "Petal Length (mm)",
     ylab = "Petal width (mm)", pch = 19,
     col = pal[iris$Species]) #iris$Species tells which element of pal should be used



## --a more complex tweaking:
#vector of colors
colors <- c("#3B9AB2", "#EBCC2A", "#F21A00")
# some labels: you can create text strings by using paste
sp <- paste("I.", unique(iris$Species), sep = " ")
sp
#you set the plotting options:
par(mfrow = c(2, 2),
    mar = c(4, 3, 2, 2),
    bty = 'l',
    las = 1)
#and plot:
boxplot(Sepal.Length ~ Species,
        data = iris,
        xlab = "", #no labels because you'll use sp above
        col = colors, #the colo vector
        xaxt = "n") #no ticks in xaxis
#function axis is one of those that adds itself into the existing device:
axis(1, #for x, 2 would be y
     at = 1:3, #where will the ticks/labels be?
     labels = sp, #we had created the vector sp above
     font = 3) # font here refers to italics.

boxplot(Sepal.Width ~ Species,
        data = iris,
        xlab = "",
        col = colors,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)

boxplot(Petal.Length ~ Species, data = iris,  col = colors,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
boxplot(Petal.Width ~ Species,
        data = iris,
        col = colors,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
par(mfrow = c(1,1)) #go back to the original parameters


## --to save this plot you need to open a graphic device, with png() for example
colors <- c("#3B9AB2", "#EBCC2A", "#F21A00")
sp <- paste("I.", unique(iris$Species), sep = " ")

png(filename = "./figs/figure01.png") #you open the graphic device and say the name of the output file. remember figures go in the figs subfolder.
#this is the same code from above: BUT WE ARE INSIDE A PNG DEVICE SO it will plot inside it
par(mfrow = c(2, 2),
    mar = c(4, 3, 2, 2),
    bty = 'l',
    las = 1)
boxplot(Sepal.Length ~ Species,
        data = iris,
        xlab = "",
        col = colors,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
boxplot(Sepal.Width ~ Species,
        data = iris,
        xlab = "",
        col = colors,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
boxplot(Petal.Length ~ Species, data = iris,  col = colors,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
boxplot(Petal.Width ~ Species,
        data = iris,
        col = colors,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
dev.off() #you HAVE to close the device to create the file

