# Energy Mix and CO2 Emissions: A Statistical Analysis

Statistical analysis of the relationship between energy mix (coal, natural gas, renewables, nuclear), GDP per capita, and CO2 emissions per capita across 10 countries, with a focus on Europe.

## Overview

This project studies how the composition of a country's energy mix relates to its carbon emissions and economic output. The analysis covers 10 countries (Spain, Bulgaria, Italy, France, Ireland, the Netherlands, China, the United States, Germany, and Denmark) over the period 2000-2020, using data from [Our World in Data](https://ourworldindata.org).

The project combines exploratory statistics, correlation analysis, multiple regression, cluster analysis, and time series forecasting to answer the following research questions:

- How do different energy sources affect CO2 emissions per capita?
- Is there a significant relationship between renewable energy share and emissions?
- Can countries be grouped based on their energy profiles and emission levels?
- Is there a relationship between energy sources and a country's economic status?

## Repository structure

```
.
├── data/
│   └── euro_data.csv          Cleaned dataset used for the R analysis (Country, Year, CO2, GDP, Renewables)
├── excel/
│   └── EnergyMix.xlsx         Full Excel workbook: data cleaning, EDA, correlation, regression, t-tests
├── scripts/
│   ├── cluster_analysis.R     K-means clustering of countries based on CO2, GDP, and renewables
│   └── arima_forecast.R       ARIMA time series forecast of global CO2 emissions
└── docs/
    └── project_report.pdf     Full written report with methodology and results
```

## Data source

All data was obtained from [Our World in Data](https://ourworldindata.org/search), including:

- CO2 emissions per capita
- GDP per capita
- Life expectancy
- Energy mix by source (coal, natural gas, nuclear, biofuels, hydro, solar, wind)

Renewable energy share was calculated by summing biofuels, hydro, solar, and wind for each country and year.

## Methods

**Excel (data cleaning, EDA, correlation, regression)**
- Data cleaning and merging using XLOOKUP, with country and year combined as a lookup key
- Descriptive statistics (mean, standard deviation, variance, coefficient of variation) and growth rates
- 95 percent confidence intervals for yearly averages
- Independent and one-sample t-tests to compare CO2 emissions between countries and against the European average
- Pearson correlation between CO2, GDP, and renewables, with significance testing
- Multiple regression models predicting CO2 emissions from GDP, coal share, and renewable share

**R (cluster analysis and time series)**
- K-means clustering (`cluster_analysis.R`) using CO2, GDP, and renewable share, visualized through principal component analysis
- ARIMA forecasting (`arima_forecast.R`) of global average CO2 emissions per capita, projecting five years ahead

## Key findings

- Renewable energy share is negatively correlated with CO2 emissions in most European countries analyzed, but the strength of this relationship varies by country (for example, strong in Denmark and Spain, weak in Bulgaria).
- In multiple regression models, coal usage is consistently the strongest driver of CO2 emissions, often outweighing the effect of renewable energy adoption.
- Cluster analysis groups the 10 countries into four profiles: a core Western/Northern European cluster, the United States as a high-consumption outlier, France as a nuclear-power outlier, and China together with Bulgaria as high-carbon, industrializing economies.
- GDP growth is not always tied to rising emissions. Some countries, such as Denmark, show economic growth without a corresponding increase in CO2 per capita.
- The ARIMA forecast suggests a continuation of recent CO2 trends over the next five years, with widening confidence intervals further into the forecast horizon.

Full details, figures, and interpretation are available in the project report under `docs/`.

## Tools and requirements

- Microsoft Excel with the Analysis ToolPak add-in
- R (version 4.3 or later), with the following packages:
  - `dplyr`
  - `cluster`
  - `forecast`

## How to reproduce

1. Clone this repository.
2. Open `excel/EnergyMix.xlsx` to review the data cleaning, EDA, correlation, and regression steps.
3. Open `scripts/cluster_analysis.R` in R or RStudio and run it to reproduce the cluster analysis. The script reads data from `data/euro_data.csv`.
4. Open `scripts/arima_forecast.R` to reproduce the CO2 forecast. This script expects a data frame named `df` with `Year` and `CO2` columns, which can be loaded from `data/euro_data.csv`.

## Author

Diego Tamargo
Degree in Management Engineering, University of Ruse (Erasmus), Statistics course, 2026
