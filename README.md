# Getting and Cleaning Data Final Project

This repositoy contains the necessary scripts to be able to run the final project 
of the **Getting and Cleaning Data** Course. 

Please, read the Codebook for a briefly description of the problem. For further 
information about the data, please refer to the official documentation in **UCI HAR Dataset**
directory, which contains more detailed instructions. 

In order to replicate this project, refer to the **run_anaysis.R** script. Please, 
adjust the working directories accordingly. 


To the purpose of this exercise, I apply the following methodology:

- Merge the training and test data sets for both dependent and independent variiable to create one big dataset;
- Select the variables regarding the Mean value and Standard deviation values of each feature;
= Encode the activity code to their respective labels;
- Merge the resulted data set with the merged subject data set;
- Finally, create a new data set (called tidy_data.txt) with the average of each variable for each activity and each subject.
