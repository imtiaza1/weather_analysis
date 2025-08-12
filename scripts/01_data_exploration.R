install.packages("dplyr")
 # load package
library(dplyr)
 # laod data set
 data("airquality")

 # save raw data to data/raw folder
 write.csv(airquality,"data/raw/airquality.CSV",row.names = FALSE)
 
 # explore the data 
 str(airquality)
 summary(airquality) 
 # view first few row
 head(airquality)
 #missing values check
 colSums(is.na(airquality))
 
 