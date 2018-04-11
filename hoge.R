hoge <- read.csv("hama.csv",header=TRUE,fileEncoding = "UTF-8")
mu <- mean(hoge$rain)#標本平均
s2 <- mean((hoge$rain-mu)^2)#標本分散
c(mu,s2)
a <- (hoge$rain-mu)^2/s2#異常度
th <- qchisq(0.99,1)#カイ二乗分布による1%水準の閾値
plot(a,xlab="index",ylab="anomaly score")#異常度のプロット
lines(0:35,rep(th,length(0:35)),col="red",lty=2)#閾値の線
