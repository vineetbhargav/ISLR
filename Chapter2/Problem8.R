#set the working directory
setwd("D:/ISLR/Datasets")
getwd();

#read the file
college<-read.csv("College.csv", header = TRUE)
fix(college)

#check only the first column and creating the new column as row.name
rownames(college)=college[,1]
#fix(college)

#remove the first column
college<-college[-1]
fix(college)

#checking the summary
summary(college)

#draw the scatter plot of first 10 variables.
pairs(college[,1:10])

#Use the plot() function to produce side-by-side boxplots of "Outstate" versus "Private".
plot(college$Private, college$Outstate , xlab= "Private College", ylab= "Out of state tution" , main="Out of state tution v/s private college box plot")


#creating an elite variable to figure out how the top 10 percent high school prportion is 

Elite = rep("No", nrow(college))
#fix(Elite)
Elite[college$Top10perc>50] = "yes"

##to see how many are yes and no
table(Elite)
#converting yes and No to factors of 1 and 2, this will help in creating the plot
Elite= as.factor(Elite)

#adding Elite in a dataframe
college= data.frame(college, Elite)

##creating a box plot to see the comparision of Out of state and Elite

plot(college$Elite, college$Outstate, xlab= "Elite University", ylab= "out of state tution", main="Elite v/s outside tution")


#Use the hist() function to produce some histograms with numbers of bins for a few of the quantitative variables.

par(mfrow =c(2,2))
hist(college$Books, col=2,  xlab="Books", ylab="count")
hist(college$PhD, col=3,  xlab="Phd", ylab="count")
hist(college$perc.alumni, col=4,  xlab="percentofAlumni", ylab="count")
hist(college$Expend, col=4,  xlab="Expenditure", ylab="count")
##Further EDA

summary(college)
college[college$PhD==103,]

#it is evident to notice that University of Texas has more than 100 percent of the faculty who are PHD.
#which is not possible.

