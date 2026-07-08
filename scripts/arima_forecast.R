# We first load the needed libraries
library(dplyr)
library(forecast)

# Load the dataset
df <- read.csv("../data/euro_data.csv")

# Global CO2 average per year (2000-2020)
yearly_co2 <- df %>%
  group_by(Year) %>%
  summarise(Avg_CO2 = mean(CO2, na.rm = TRUE))

# Converting those data into a time series object (This is needed for ARIMA)
co2_ts <- ts(yearly_co2$Avg_CO2, start = 2000, end = 2020, frequency = 1)

# Create the ARIMA model automatically (R will find the best mathematical formula)
arima_model <- auto.arima(co2_ts)

# Predict the next 5 years of CO2 emissions using the ARIMA model
co2_forecast <- forecast(arima_model, h = 5)

# Plot the forecast
plot(co2_forecast, 
     main="5-Year Aggregate CO2 Forecast (ARIMA)", 
     ylab="Average CO2 Per Capita", 
     xlab="Year",
     col="black",     # Actual data line color
     fcol="blue")     # Prediction line color