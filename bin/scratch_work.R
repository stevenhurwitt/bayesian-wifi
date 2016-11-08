library(G1DBN)
library(neuralnet)
library(nnet)

getwd()
setwd("/Users/stevenhurwitt/Documents/bayesian-wifi/data")

##Once we get more data we can combine csvs and split into training/test sets as needed
#need to learn more about DBN's and Thompson Sampling, as well as how to constantly run it in a Linux environment...

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

fit.eve = neuralnet(avg_tp~airtime+avg_prob+sum_suc+sum_att, data=evening, hidden=3, err.fct = "sse", linear.output=T)
fit.eve$weights
plot(fit.eve)
fit.eve$result.matrix


#DBN
model.vars = list('airtime','avg_prob','sum_suc','sum_att')
Xn = afternoon[colnames(afternoon) %in% model.vars]
S1 = DBNScoreStep1(Xn, method='ls')
G1 = BuildEdges(S1,threshold=1,nb=NULL,targetNames=NULL,predNames=NULL,prec=3,dec=FALSE)
G1

alpha1 = .05
S2 = DBNScoreStep2(S1$S1ls, Xn, method='ls', alpha1)
alpha2 = 0.05
G2 = BuildEdges(S2,threshold=alpha2,dec=FALSE)
G2
