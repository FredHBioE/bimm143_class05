#' ---
#' title: "BIMM 143 Class 5: R Graphics"
#' Author: "Fangchao He"
#' Date: "April 18, 2019"
#' ---


## 2A: Lineplot
# Open file
weight_table <- read.table("C:/Users/Fred/Desktop/Junior 3 - Spring 2019/BIMM 143/BIMM_143_Lab_5_R_Data_Visualization/bimm143_05_rstats/weight_chart.txt", header = TRUE)
# Plot
plot(weight_table$Age, weight_table$Weight, pch = 19, typ = "b", cex = 1.5, lwd = 2, ylim = c(2, 10), xlab = "Age (Months)", ylab = "Weight (kg)", main = "Baby weight with age")

## 2B: Barplot
# Open feature counts
feature_count <- read.table(file = "C:/Users/Fred/Desktop/Junior 3 - Spring 2019/BIMM 143/BIMM_143_Lab_5_R_Data_Visualization/bimm143_05_rstats/feature_counts.txt", header = TRUE, sep = "\t")
# Set margins
par(mar = c(3, 12, 2, 5))
# Barplot
barplot(feature_count$Count, horiz = TRUE, main = "Number of features in the mouse GRCm38 genome", names.arg = feature_count$Feature, las = 1)

## 2C: Histogram
par(mar = c(5, 5, 5, 2))
random_sample <- c(rnorm(10000),rnorm(10000)+4)
hist(random_sample, breaks = 50, freq = TRUE, xlab = "x", ylab = "Frequency")

# 3A
par(mar = c(8, 5, 3, 3))
male_female_counts <- read.table(file = "C:/Users/Fred/Desktop/Junior 3 - Spring 2019/BIMM 143/BIMM_143_Lab_5_R_Data_Visualization/bimm143_05_rstats/male_female_counts.txt", header = TRUE, sep = "\t")
barplot(male_female_counts$Count, horiz = FALSE, ylab = "Counts", names.arg = male_female_counts$Sample, las = 2, col = rainbow(nrow(male_female_counts)))
barplot(male_female_counts$Count, horiz = FALSE, ylab = "Counts", names.arg = male_female_counts$Sample, las = 2, col = c("blue2", "red2"))

# 3B
par(mar = c(5, 5, 3, 3))
genes <- read.table(file = "C:/Users/Fred/Desktop/Junior 3 - Spring 2019/BIMM 143/BIMM_143_Lab_5_R_Data_Visualization/bimm143_05_rstats/up_down_expression.txt", header = TRUE, sep = "\t")
table(genes$State)
palette(c("blue", "grey", "red"))
plot(genes$Condition1, genes$Condition2, col = genes$State, xlab = "Condition 1", ylab = "Condition 2", pch = 20)

# 3C
meth <- read.table(file = "C:/Users/Fred/Desktop/Junior 3 - Spring 2019/BIMM 143/BIMM_143_Lab_5_R_Data_Visualization/bimm143_05_rstats/expression_methylation.txt", header = TRUE, sep = "\t")
plot(meth[meth$expression > 0, ]$gene.meth, meth[meth$expression > 0, ]$expression, xlab = "Gene Methylation", ylab = "Expression", pch = 20, col = densCols(meth[meth$expression > 0, ]$gene.meth, meth[meth$expression > 0, ]$expression, colramp = colorRampPalette(c("blue", "green", "red", "yellow"))))