#load dplyr
library(dplyr)
#load data
data("airquality")
monthly_temp<-read.csv("data/processed/monthly_temperature_summary.CSV")

# Chart 1: Monthly Temperature Line Plot_____-----
# Save plot
png("outputs/plots/monthly_temperature.png", width = 800, height = 600)
plot(monthly_temp$Month, monthly_temp$Avg_temp, type = 'b',
     main = "Average temperature by month",
     xlab = "Month",
     ylab = "Temperature (F)",
     col = "red",
     pch = 16,
     lwd = 2)
dev.off()

# Chart 2: Temperature Distribution______----
 #save plot
png("outputs/plots/monthly_distribution.png",width = 800,height = 600)
hist(airquality$Temp,
     main = "Temperature Distribution",
     xlab = "Templerature (f)",
     col = "lightblue",
     breaks = 15)
dev.off()

# Chart 3: Wind vs Temperature Scatter__----
#save plot
png("outputs/plots/wind_vs_temperature.png",width = 800,height = 600)
plot(airquality$Wind,airquality$Temp,
     main = "Wind speed vs Temperature",
     xlab = "Wind speed (mph",
     ylab = "Temperature (F)",
     col="darkgreen",
     pch=16)
dev.off()
