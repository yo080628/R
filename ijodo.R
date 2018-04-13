x<-read.csv("hama_soukan.csv",header=TRUE) #Excelファイル読み込みエラー出るとファイル作り直し
plot (x[,2],x[,3],pch=16,xlab="rain",ylab="soil_water_content") #雨量と土壌水分量の散布図を描画
X<-cbind(x[,2],x[,3])#雨量と降水量の値を変数に格納
mx <- colMeans(X)#共分散
Xc <- X - matrix(1,nrow(X),1) %*% mx #中心化したデータ行列
Sx <- t(Xc) %*% Xc / nrow(X)#標本共分散行列
a <- rowSums((Xc %*% solve(Sx)) * Xc)#異常度
plot(a,xlab="index",ylab="anomaly score")#異常度のプロット
lines(0:35,rep(th,length(0:35)),col="red",lty=2)#閾値

