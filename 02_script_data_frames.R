#
?matrix

matrix(nrow = 4, ncol = 3)

nums <- 1:12

matrix(data = nums, nrow = 3)

matrix(data = nums, nrow = 3, byrow = T)

#create
list(c("row1", "row2", "row3"),
     c("col1", "col2", "col3", "col4"))

names_matrix <- list(c("row1", "row2", "row3"),
     c("col1", "col2", "col3", "col4"))
names_matrix

matrix(data = nums, nrow = 3, byrow = T, dimnames = names_matrix)


m <- matrix(data = nums, nrow = 3, byrow = T, dimnames = names_matrix)

dim(m)
dimnames(m)

df <- data.frame(m)
class(df)
class(m)

# reading data into R

surveys <- read.csv(file = "./data/raw/portal_data_joined.csv")

head(surveys)

surveys_check <- read.table(
  file = "./data/raw/portal_data_joined.csv",
                            sep = ",",
  header = TRUE)
head(surveys_check)

# inspecting
str(surveys) #structure
dim(surveys)
nrow(surveys)
ncol(surveys)

head(surveys)
tail(surveys)

names(surveys)
rownames(surveys)
length(surveys)

sub <- surveys[1:10,]
sub[1,1]
sub[1,6]
sub[["record_id"]]
sub$record_id

sub[1:3, 7]

sub[3, ]

# [row, columns]

surveys[ , 6]
surveys[1, ]
surveys[4, 13]

surveys[1:4, 1:3]

surveys[, -1]
nrow(surveys)
surveys[-(7:34786), ]
head(surveys)
surveys[-(7:nrow(surveys)), ]

surveys["species_id"]
surveys[["species_id"]]

da <- surveys["species_id"]


surveys[ ,"species_id"]
surveys$species_id

##
sub <- surveys[1:10,]
str(sub)

sub$hindfoot_length

sub$hindfoot_length == NA

is.na(sub$hindfoot_length)
!is.na(sub$hindfoot_length)

sub$hindfoot[!is.na(sub$hindfoot_length)]

mean(sub$hindfoot_length)
mean(sub$hindfoot_length, na.rm = T)

non_NA_w <- surveys[!is.na(surveys$weight),]
dim(non_NA_w)
dim(surveys)


non_NA <- surveys[!is.na(surveys$weight) &
                    !is.na(surveys$hindfoot_length), ]
dim(non_NA)

complete.cases(surveys)

surveys1 <- surveys[ complete.cases(surveys) , ]
dim(surveys1)

surveys2 <- na.omit(surveys)
dim(surveys2)

write.csv(surveys1, "data/processed/surveys_mod.csv")


