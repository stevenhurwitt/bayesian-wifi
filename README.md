# Bayesian Wi-Fi

[Bayes rule is cool. Stable Wi-Fi rules. The former can give us the latter.](http://www.openias.org/bayesian-wifi-rate-control).

Question: Hi all,
Can I create some sort of forum for us to ask each other questions? Pretty new to github, so I'm not sure of the best way to do this. Also new to Linux/writing real code (coming from stats background), so my first main question is this:
To implement this in practice I assume we'd write some sort of Minstrel patch that replaces the EWMA with a Bayesian network and updates parameters in real-time somehow? I don't know much about Bayesian networks/Thompson sampling as well, so I want to try implementing a Neural Network to try to replace the EWMA and am having trouble doing so. So if anyone could give me somewhat detailed instructions about what to change in the current Minstrel.C file it would be appreciated, I will spend more time reading the source code and maybe trying stuff out. - [Steven](mailto:stevenhurwitt@gmail.com)
P.S. Also is there a way to log our own data straight from Linux without purchasing an additional wireless card (my /sys/kernel/debug/ieee80211/phy0/ directory has files that seem promising such as the "statistics" directory, but I can't quite figure out how to replicate the data in the .csv files on Github)
