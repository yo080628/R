library("rjson")
jsondata <- fromJSON(file = "hashimoto.txt")#テキストファイル呼び出し
cols <- unique(unlist(sapply(jsondata, 
	names)))
x <- t(sapply(jsondata, 
	function(x) {
		d <- c()
		for (col in cols) {
			d[col] <- ifelse(is.null(x[[col]]), 
				"", x[[col]])
		}
		return(d)
	}))
#paste(x[, "time"], x[,
#"relative_humidity"],
#sep = ",")#関数を出力
#b<-paste( x[,'time'], x[,'relative_humidity'], sep=",")#変数bにpaste関数を代入
write.csv(x, "x.csv", quote=FALSE, row.names=FALSE)#変数bをcsvファイルに出力

