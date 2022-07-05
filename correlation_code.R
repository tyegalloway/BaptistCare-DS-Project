library("dplyr")
library("ggpubr")

# Data File for Carer UTI Correlation: Carers_Falls_Correlation_Data.CSV

# Shapiro-Wilk normality test for distinct carers
shapiro.test(pair_strength_pressure_injuries_correlation_v2$pair_strength) # => p-value = 0.0004528
# Shapiro-Wilk normality test for residents reporting uti
shapiro.test(pair_strength_pressure_injuries_correlation_v2$pressure_injuries_reported) # => p-value = 5.313e-11
# The normal distribution test shows that the distribution of data is significantly different to normal distribution.
# This helps us determine which kind of correlation test we need to perform

# Correlation With Carers and UTI Reported
ggscatter(pair_strength_pressure_injuries_correlation_v2, x = "pair_strength", y = "pressure_injuries_reported", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "kendall",
          xlab = "Pair Strength", ylab = "Pressure Injuries")
res <- cor.test(pair_strength_pressure_injuries_correlation_v2$pair_strength, pair_strength_pressure_injuries_correlation_v2$pressure_injuries_reported, 
                method = "kendall")
# There is a negative correlation between Distinct carers seen and the number of residents reporting Falls. p-value is
# less than 0.05, hence we can conclude the correlation is significant and not caused by random chance.
