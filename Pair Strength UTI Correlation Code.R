library("dplyr")
library("ggpubr")

# Data File for Carer UTI Correlation: UTI_CARER_DISTRIBUTION.CSV

# Shapiro-Wilk normality test for distinct carers
shapiro.test(Pair_Strenght_UTI_Correlation$pair_strength) # => p-value = 1.824e-05
# Shapiro-Wilk normality test for residents reporting uti
shapiro.test(Pair_Strenght_UTI_Correlation$uti_reported) # => p-value = 1.912e-13
# The normal distribution test shows that the distribution of data is significantly different to normal distribution.
# This helps us determine which kind of correlation test we need to perform

# Correlation With Carers and UTI Reported
ggscatter(Pair_Strenght_UTI_Correlation, x = "pair_strength", y = "uti_reported", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "kendall",
          xlab = "Pair Strength", ylab = "UTIs Reported")
res <- cor.test(Pair_Strenght_UTI_Correlation$avg_carer_in_month, Pair_Strenght_UTI_Correlation$uti_reported, 
                method = "kendall")
# There is a negative correlation between Distinct carers seen and the number of residents reporting UTIs. p-value is
# less than 0.05, hence we can conclude the correlation is significant and not caused by random chance.

