## Installing the packages
install.packages("tidyverse")


## Loading packages
library(readr)
library(tidyverse)

## Importing data set into R
datad <- read.csv("Best_Start_Kindergarten.csv")
attach(data)

## Removing the rows in data having overall_score = 0
data=datad[which(datad$overall_score!=0),]

## create a function to count the number of students by any number of variables present in data set   

count_by <- function(df, ...) {
  df %>%
    group_by(...) %>%
    summarise(count=n())
  
  
}

## Call a function to generate data frame containing the count of students obtained different grades across LNAP and NOn-LNAP schools by year
grad_y = count_by(data, LNAPStatus,Year,Grade)

## Filter the obtained data frame to get the number of students who achieved Red grade in three different years 2019, 2020, 2021
red_y = grad_y %>% filter(Grade == "Red") 

## Export the resulted data frame into excel file
write_csv(red_y,"C:\\Users\\mkaur28\\Desktop\\Red_Yearwise23.csv")


