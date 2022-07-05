library("dplyr")
library("ggpubr")

# Data File for Carer UTI Correlation: UTI_CARER_DISTRIBUTION.CSV

# Shapiro-Wilk normality test for distinct carers
shapiro.test(Pair_Strength_vs_Total_Falls_Correlation$pair_strength) # => p-value = 0.4702
# Shapiro-Wilk normality test for residents reporting uti
shapiro.test(Pair_Strength_vs_Total_Falls_Correlation$falls_reported) # => p-value = 1.346e-06
# The normal distribution test shows that the distribution of data is significantly different to normal distribution.
# This helps us determine which kind of correlation test we need to perform

# Correlation With Carers and UTI Reported
ggscatter(Pair_Strength_vs_Total_Falls_Correlation, x = "pair_strength", y = "falls_reported", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "kendall",
          xlab = "Pair Strength", ylab = "Falls Reported")
res <- cor.test(Pair_Strength_vs_Total_Falls_Correlation$pair_strength, Pair_Strength_vs_Total_Falls_Correlation$falls_reported, 
                method = "kendall")
# There is a negative correlation between pair strength and the number of residents reporting falls. p-value is
# less than 0.05, hence we can conclude the correlation is significant and not caused by random chance.

