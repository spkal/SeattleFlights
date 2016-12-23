b <- seq(0, 24, by=1/6)
hist(fracHour, breaks=b, xlab="Hour",
  main="Flight Arrival Time at SeaTac in Ten Minute Intervals",
  sub="Flights in 1987 through 2008",
  axes=FALSE)
abline(v = seq_len(23), lty=2, col="red", lwd=0.5)
axis(side=1, at=seq(0, 24, by=2))
axis(side=2)

#
library("dplyr")
library("ggplot2")
data.frame(fracHour=fracHour) %>%
  ggplot(aes(x=fracHour)) + geom_histogram(binwidth=1/6, boundary=0)



b1 <- seq(0L, 60L, by=10L)
h <- rep(seq_len(24) - 1L, each=7)
b <- rep(b1, 24) + h * 100L
b[168] <- 2400L
binArrTime <- cut(sea$ArrTime, breaks=b)
countBin <- table(binArrTime)
plot(1:167, countBin, type='h')
