# read processed data
surveys <- read.csv("data/processed/surveys_mod.csv")
# transform to factor
surveys$plot_type <- factor(surveys$plot_type)
levels(surveys$plot_type) #ok

surveys$sex <- factor(surveys$sex)

#that notatio with the dollarsign allows you to create new variables
# surveys$new_col <- NA
# surveys$new_col <- 1:nrow(surveys) #just an index for example
#names(surveys)

###This was only an example
#sex <- factor(c("male", "female", "female", "male"))
#levels(sex) # in alphabetical order
#change order
#sex <- factor(sex, levels = c("male", "female"))
#levels(sex)

#plot factors
plot(surveys$sex)
levels(surveys$sex)

#change the levels
levels(surveys$sex)[1] <- "Undetermined"
#change F to female
levels(surveys$sex)[2] <- "Female"
#change M to male
levels(surveys$sex)[3] <- "Male"

plot(surveys$sex)

# change the order of the levels
surveys$sex <- factor(surveys$sex, levels = c("Female", "Male", "Undetermined"))
plot(surveys$sex)

# explore plotting
plot(surveys$hindfoot_length)
plot(surveys$record_id)
plot(sort(surveys$hindfoot_length))

### scatterplot
plot(x = surveys$weight, y = surveys$hindfoot_length)

### another way to draw the same scatterplot
### tilde ~ (curvy)  "as a function of"
plot(surveys$hindfoot_length ~ surveys$weight)

# plotting as a function of a factor: a boxplot
plot(surveys$hindfoot_length ~ surveys$sex)

