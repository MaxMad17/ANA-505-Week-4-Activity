#Week 4: dplyr package


#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))

t_df <- as.data.frame(Titanic)


#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(t_df,5)


#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")


#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
library(dplyr)
select(t_df, Sex, Survived)



#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
sel_sex_survivde <- select(t_df, Sex, Survived)
head(sel_sex_survivde)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
sel_survivde <- select(sel_sex_survivde, -Sex)
head(sel_survivde)



#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'

rename(t_df, Gender = Sex )
head(t_df)

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' 
new_df <- data.frame(Titanic)
new_df$gender <-new_df$Sex
head(new_df)


#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'

new_df_male<- filter(new_df, Sex == "Male")
head(new_df_male)

#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
new_data_arange <- arrange(new_df, gender)
head(new_data_arange)


#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:_2201___
examined <- sum(new_data_arange$Freq)
print(examined)


#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'

new_data_females <- filter(new_df, Sex == "Female")
head(new_data_females)


#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

new_male_female <- union(new_df_male, new_data_females)
tail(new_male_female)
head(new_male_female)



#Optional Task: add any of the other functions 
#you learned about from the dplyr package

selected_df <- new_data_females %>% select(Class, Survived)
head(selected_df)
dim(selected_df)
dim(new_male_female)

# Adding a new variable 'Freq_Group'
New_class_df<- new_male_female %>% mutate(Age_Group = ifelse(Freq < 30, "Small_gp", "Big_gp"))
head(New_class_df)
