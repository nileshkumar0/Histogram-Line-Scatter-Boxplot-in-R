####################################################### 
#### Created by Nilesh Kumar, IIM Raipur, India
#######################################################


###### Histogram #####

#Read (or import) the "New_Babies_Weight" dataset into the RStudio with the heading as true. 
New_Babies_Weight_Data <- read.table("New_Babies_Weight.txt", sep = " " , header = TRUE)

#Explore the structure of the data. Write the command and data type of all the three variables of the dataset.
str(New_Babies_Weight_Data);

# Create a basic histogram of birthweight using hist():
hist(New_Babies_Weight_Data$birthweight)

# Specify the number of cells for the histogram using: breaks = N, where N=35. Use the chart generated in part-A of this question.
hist(New_Babies_Weight_Data$birthweight, breaks = 35)

#Relabel the x-axis using: xlab = "Birth Weight" and relabel the main title using: main = "Histogram of Birth Weight". Use the chart generated in part-B of this question.
hist(New_Babies_Weight_Data$birthweight, 
     breaks = 35, 
     xlab = "Birth Weight", 
     main = "Histogram of Birth Weight")

#Modify the range of xlim from 0 to 7 and range of ylim from 0 to 120. Use the chart generated in part-C of this question.
hist(New_Babies_Weight_Data$birthweight, 
     breaks = 35, 
     xlab = "Birth Weight", 
     main = "Histogram of Birth Weight",
     xlim=c(0,7),
     ylim=c(0,120))





###### Line Chart ########

#Read (or import) the "New_Insects" dataset into the RStudio with heading as true. Write the command.
New_Insects_Data <- read.table("New_Insects.txt", header = TRUE, sep = "\t")

#Explore the structure of the data. Write the command and data type of all variables of the dataset.
str(New_Insects_Data)

#Create a plot using the command plot. Write the command and paste the output.
plot(New_Insects_Data)

#There are several types of plot within the plot function. Change the plot by using the type parameter in the plot function. Use "type": "o" "p" "l" "b". Write all commands and paste all outputs.
plot(New_Insects_Data, type="o") #overplotted points and lines
plot(New_Insects_Data, type="p") #points
plot(New_Insects_Data, type="l") #lines
plot(New_Insects_Data, type="b") #both points and lines

#Change the plot to the line plot. Alter the line type using lty parameter: "dashed", "dotted". Write the command and paste the output for the above two lty parameters.
plot(New_Insects_Data, type="l", lty="dashed") #dashed lines type
plot(New_Insects_Data, type="l", lty="dotted") #dotted lines type

#Change the color of the line plot. By adding col parameter in the plot function. E.g.: col = "yellow" or col = 7. Note number can be used as a value for the col parameter. Do not use lty parameter in the plot function. Write the command and paste the output.
plot(New_Insects_Data, type="l", col="red") #dotted lines type

#Change the thickness (or width) of the line by using lwd parameter. Use lwd=3. Write the command and paste the output.
plot(New_Insects_Data, type="l", col="red", lwd=3) #dotted lines type

#Assign the name to the x-axis, y-axis, and title of the plot as "Year", "Population Size", and "Insect Population During 1971-2020" respectively. Write the command and paste the output.
plot(New_Insects_Data, type="l", col="red", lwd=3, xlab = "Year", ylab="Population Size", main="Insect Population During 1971-2020")

#Add a linear regression line to the plot by using the abline function. So, Is the insect population increasing in size? Write the command and plot the output.
 
#First generate a linear regression line using the lm function.
lin_reg <- lm(PopSize ~ Year, data = New_Insects_Data)
summary(lin_reg)

#Add a line base on the output of lm function.
abline(lin_reg$coefficients[1], lin_reg$coefficients[2])

#The abline() function requires two mandatory parameters, first is intercept and second is the slope of the line.
#Add the R-square value as text on the plot by using text function.
plot(New_Insects_Data, 
     type="l", 
     col="red", 
     lwd=3, 
     xlab = "Year", 
     ylab="Population Size", 
     main="Insect Population During 1971-2020")
text(x =1985, y = 850, labels="R2 = 0.9391 \n P = 2.2e-16")




###### Scatter plot ###########

#Attach or load the iris dataset, which explains the characteristics of 3 species of the iris flower. Write the command.
attach(iris)

#Plot the variables by using pairs function. Pairs function returns a plot matrix, consists of scatterplots for all variables of the data set. Write the command and plot the output.
pairs(iris)

#doesn't tell us much about the species differences. So, plot using different colors for the three species of iris. Use the col parameter in the pair function. And provide the value as species like col = iris$Species. Write the command and paste the output.
pairs(iris, col = iris$Species)

#The pattern between Sepal.Length and Petal.Length looks exciting. Let's explore these variables. Plot Sepal.Length and Petal.Length variables only. Do not forget to add colors as we did in the previous exercise. e.g.: plot(x, y, col = "variable name"). Write the command and paste the output.
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species) 

#The points plotted in the graph are hallow circles, which are difficult to see. So, let's change the plotted character using pch parameter. Different shapes for plotted characters are shown below:
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species, pch = 16)

#Change the size of the plotted character by using cex = 2. Then, write the command and paste the output. Use the output of the second part of Exercise#5 (where pch=16) of this section.
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species, pch = 16, cex = 2)


#There are 3 species of the iris flower. "Species" variables store the type of iris species. So, the values of this variable are characterized as factors because the variable can have only three values.  
levels(iris$Species)

plot(iris$Sepal.Length, iris$Petal.Length,      # x variable, y variable
     col = iris$Species,                          	# colour by species
     pch = 16,                                    		# type of point to use
     cex = 1.5,                                     		# size of point to use
     xlab = "Sepal Length",                      	# x axis label
     ylab = "Petal Length",                       	# y axis label
     main = "Flower Characteristics in Iris")    # plot title
legend (x = 4.5, y = 7, legend = levels(iris$Species), col = c(1:3), pch = 16)



#########    Box Plot


#Let's inspect the spreading of the Sepal Length for each species using the boxplot function. First, write the command and paste the output. Then, write the number of outliers shown in the plot.
boxplot(iris$Sepal.Length ~ iris$Species)

#Let's change the notch of the boxes using the notch = TRUE parameter, which helps us compare the box plots. Write the command and paste the output.
boxplot(iris$Sepal.Length ~ iris$Species, notch = TRUE)
 

#Suppose you observed that the y-axis label is perpendicularly positioned to the axis. Let's change the orientation of the label using las = 1. Write the command and paste the output.
boxplot(iris$Sepal.Length ~ iris$Species, notch = TRUE, las = 1)

#Add the label on the x-axis, y-axis, title of the plot as "Species", "Sepal Length", and "Sepal Length of Iris Species" respectively.
boxplot(iris$Sepal.Length ~ iris$Species, notch = TRUE, las = 1, xlab = "Species", ylab="Sepal Length", main="Sepal Length of Iris Species")

#Change the font size of labels, axes, and title. 
boxplot(iris$Sepal.Length ~ iris$Species, 
        notch = TRUE,
        las = 1, 
        xlab = "Species",
        ylab="Sepal Length", 
        main="Sepal Length of Iris Species",
        cex.lab = 1.5,
        cex.axis = 1.5,
        cex.main = 2.5)



