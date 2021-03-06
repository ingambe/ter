library(wvioplot)
library(wesanderson)

setwd("/home/ingambe/Bureau/ter/output/parallel/naif")
palette <- wes_palette(n=3,name="Zissou1")

xLabels<-c("sequential", "1 Thread", "2 Thread", "3 Thread", "4 Thread", "5 Thread", "6 Thread", "7 Thread", "8 Thread")

gccSeq<-read.table(file = "../../gcc/ia_commence/O3/resultat.txt",sep="\n", header=FALSE)
gcc1TH<-read.table(file = "gcc/resultat_1.txt",sep="\n", header=FALSE)
gcc2TH<-read.table(file = "gcc/resultat_2.txt",sep="\n", header=FALSE)
gcc3TH<-read.table(file = "gcc/resultat_3.txt",sep="\n", header=FALSE)
gcc4TH<-read.table(file = "gcc/resultat_4.txt",sep="\n", header=FALSE)

generalDetails<-c(expression(
  
  italic("Linux kernel = 4.13.0-38"), 
  italic("Compiler = GCC 5.4.0"),
  italic("File = j1.txt"),
  italic("Executions = 5")))

#cicada
generalHardware<-("Intel Xeon W3520, 2.66GHz GHz, 4 cores, 4 GB RAM")

wvioplot(gccSeq$V1,gcc1TH$V1,gcc2TH$V1, gcc3TH$V1,gcc4TH$V1,clip=TRUE, adjust = 1, col=palette[1],names=FALSE)

axis(1,cex.axis=0.6,at=1:9, labels=xLabels)

legend("bottomright", generalDetails, bty = "n", cex=0.8)

mtext(generalHardware, side=3, cex=1.5)

title(ylab = "Time (seconds)", xlab="Number of Threads", line = NA)