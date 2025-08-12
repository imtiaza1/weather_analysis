# load packages
library(dplyr)

#load data
data("airquality")
#view data
View(airquality)

# ______Question 1: Average temperature by month______----
monthly_temp<-airquality%>%
  group_by(Month)%>%
  summarise(
    Min_temp=min(Temp,na.rm = TRUE),
    Avg_temp=mean(Temp,na.rm=TRUE),
    Max_temp=max(Temp,na.rm=TRUE)
  )
View(monthly_temp)

# ______Question 2: Hottest and coldest months____----
# Base R
hottest_month <- monthly_temp[which.max(monthly_temp$Avg_temp), ]
coldest_month <- monthly_temp[which.min(monthly_temp$Avg_temp), ]

View(hottest_month)
View(coldest_month)

# dplyr version
monthly_temp %>%
  summarise(
    hottest_Month = max(Max_temp),
    coldest_Month = min(Min_temp)
  ) %>%
  View()

