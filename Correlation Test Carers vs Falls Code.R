library("dplyr")
library("ggpubr")

# Data File for Carer UTI Correlation: Carers_Falls_Correlation_Data.CSV

# Shapiro-Wilk normality test for distinct carers
shapiro.test(Carers_Falls_Correlation_Data$avg_carer_in_month) # => p-value = 8.719e-06
# Shapiro-Wilk normality test for residents reporting uti
shapiro.test(Carers_Falls_Correlation_Data$falls_reported) # => p-value = 2.2e-16
# The normal distribution test shows that the distribution of data is significantly different to normal distribution.
# This helps us determine which kind of correlation test we need to perform

# Correlation With Carers and UTI Reported
ggscatter(Carers_Falls_Correlation_Data, x = "avg_carer_in_month", y = "falls_reported", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Distinct Carers Seen", ylab = "Falls Reported")
res <- cor.test(Carers_Falls_Correlation_Data$avg_carer_in_month, Carers_Falls_Correlation_Data$falls_reported, 
                method = "pearson")
# There is a negative correlation between Distinct carers seen and the number of residents reporting Falls. p-value is
# less than 0.05, hence we can conclude the correlation is significant and not caused by random chance.
