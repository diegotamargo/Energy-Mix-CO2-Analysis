# Set your working directory to the location of this repository's data folder
# setwd("path/to/repository/data")

# Then we must load the downloaded libraries
library(dplyr)
library(cluster)

# Now we can load the data
df <- read.csv("../data/euro_data.csv")

# We group the data to find the 21-year average for each country
country_summary <- df %>%
  group_by(Country) %>%
  summarise(
    Mean_CO2 = mean(CO2, na.rm = TRUE),
    Mean_GDP = mean(GDP, na.rm = TRUE),
    Mean_Ren = mean(Renewables, na.rm = TRUE)
  )

# So that data is converted to a standard data frame (to see the names)
country_summary <- as.data.frame(country_summary)

# Set the row names to the Country names so they appear on our plot
rownames(country_summary) <- country_summary$Country

# Scale the data (Crucial for clustering so GDP doesn't overpower CO2)
clustering_vars <- scale(country_summary[, 2:4])


# Run K-Means Clustering (We will group them into 3 distinct clusters)
set.seed(123) # Ensures you get the exact same result every time
km_res <- kmeans(clustering_vars, centers = 4, nstart = 25)

# Plot the Clusters
clusplot(clustering_vars, km_res$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0, main="European Energy & Economic Clusters")