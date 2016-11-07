setwd("/your/wd/here")

afternoon = read.csv("afternoonrates.csv", header = T, sep = ",")
evening = read.csv("eveningrates.csv", header = T, sep = ",")

vars = c("mode", "guard", '#', 'best rate', 'name', 'idx', 'airtime',
         'max_tp', 'avg(tp)', 'avg(prob)', 'sd(prob)', 'prob',
         'retry', 'suc', 'att', 'sum_suc', 'sum_att')

colnames(afternoon) = vars
colnames(evening) = vars
