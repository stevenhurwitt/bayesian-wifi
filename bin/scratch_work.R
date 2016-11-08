library(G1DBN)
library(neuralnet)
library(nnet)

getwd()
setwd("/Users/stevenhurwitt/Documents/bayesian-wifi/data")

afternoon = read.csv("afternoonrates.csv", header = T, sep = ",")
evening = read.csv("eveningrates.csv", header = T, sep = ",")

vars = c("mode", "guard", '#', 'best_rate', 'name', 'idx', 'airtime',
         'max_tp', 'avg_tp', 'avg_prob', 'sd_prob', 'prob',
         'retry', 'suc', 'att', 'sum_suc', 'sum_att')
colnames(afternoon) = vars
colnames(evening) = vars

#BuildEdges(score,threshold=1,nb=NULL,targetNames=NULL,predNames=NULL,prec=3,dec=FALSE)

#basic lm:
linear.mod.aft = lm(avg_tp~best_rate+airtime+avg_prob+suc+att+sum_suc+sum_att, data = afternoon)
linear.mod.eve = lm(avg_tp~best_rate+airtime+avg_prob+suc+att+sum_suc+sum_att, data = evening)

summary(linear.mod.aft)
summary(linear.mod.eve)

#neural net:
fit.aft = neuralnet(avg_tp~airtime+avg_prob+sum_suc+sum_att, data=afternoon, hidden=3, err.fct = "sse", linear.output=T)
fit.aft$weights
plot(fit.aft)
fit.aft$result.matrix

fit.eve = neuralnet(avg_tp~airtime+avg_prob+sum_suc+sum_att, data=afternoon, hidden=3, err.fct = "sse", linear.output=T)
fit.eve$weights
plot(fit.eve)
fit.eve$result.matrix
