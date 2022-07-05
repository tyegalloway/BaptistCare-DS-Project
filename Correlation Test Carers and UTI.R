library("dplyr")
library("ggpubr")

# Data File for Carer UTI Correlation: UTI_CARER_DISTRIBUTION.CSV

# Shapiro-Wilk normality test for distinct carers
shapiro.test(Avg_Carer_Seen_vs_UTI_Reported_in_Month_Correlation$avg_carer_in_month) # => p-value = 0.0001758
# Shapiro-Wilk normality test for residents reporting uti
shapiro.test(Avg_Carer_Seen_vs_UTI_Reported_in_Month_Correlation$uti_reported) # => p-value = 2.086e-14
# The normal distribution test shows that the distribution of data is significantly different to normal distribution.
# This helps us determine which kind of correlation test we need to perform

# Correlation With Carers and UTI Reported
ggscatter(Avg_Carer_Seen_vs_UTI_Reported_in_Month_Correlation, x = "avg_carer_in_month", y = "uti_reported", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Distinct Carers Seen", ylab = "UTIs Reported")
res <- cor.test(Avg_Carer_Seen_vs_UTI_Reported_in_Month_Correlation$avg_carer_in_month, Avg_Carer_Seen_vs_UTI_Reported_in_Month_Correlation$uti_reported, 
                method = "pearson")
# There is a negative correlation between Distinct carers seen and the number of residents reporting UTIs. p-value is
# less than 0.05, hence we can conclude the correlation is significant and not caused by random chance.
