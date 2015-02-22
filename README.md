# Project-Getting-and-Cleaning-Data

First we need to load the required library to rn this program, in this its dplyr.
We set the directory using "setwd" command where we unzip all the files necessary for this project.
It makes sure all files are available at an instant in a single location.

Using read.table function, we load the tables:
features, X_test, Y_test, Subject_test, X_train, Y_train, Subject_train INTO the OBJECTS
features, xte, yte, subte, xtr, ytr, subtr respectively.

We now insert the activity names using in test and training data set using a for loop and
variable name using  col.names and make.names function.

Using select function, we choose only those column which have mean and std in their column names.

Finally, we group the data into two ids, activity and subject and then we calculate mean for each observation for those id using pipeline function.

We write the table in ".txt" format using write.table function

