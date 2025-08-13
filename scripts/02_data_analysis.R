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
# dplyr version
monthly_temp %>%
  summarise(
    hottest_Month = max(Max_temp),
    coldest_Month = min(Min_temp)
  ) %>%
  View()

# ____Question 3: Wind-Temperature correlation____-----
View(airquality)
correlation<-cor(airquality$Temp,airquality$Wind,use = "complete.obs")
cat("Correlation between Temperature and Wind speed:", correlation, "\n")
airquality%>%
  group_by(Month) %>%
  summarise(correlation=cor(Temp,Wind))%>%
  View()

# Save processed data
write.csv(monthly_temp, "data/processed/monthly_temperature_summary.csv", row.names = FALSE)

# save reports
sink("outputs/reports/analysis_summary.txt")
cat("=== WEATHER ANALYSIS SUMMARY ===\n")
cat("Hottest month:", hottest_month$Month, "- Avg temp:", round(hottest_month$Avg_temp, 1), "F\n")
cat("Coldest month:", coldest_month$Month, "- Avg temp:", round(coldest_month$Avg_temp, 1), "F\n")
sink()

# print results_________-----
print("=== ANALYSIS RESULTS ===")
print(monthly_temp)
print(paste("Hottest month:", hottest_month$Month, "- Avg temp:", round(hottest_month$Avg_temp, 1)))
print(paste("Coldest month:", coldest_month$Month, "- Avg temp:", round(coldest_month$Avg_temp, 1)))
print(paste("Wind-Temperature correlation:", round(correlation, 3)))
