# Section 2A scatterplots
# lets read our input file first

read.table("bimm143_05_rstats/weight_chart.txt")
baby <- read.table("bimm143_05_rstats/weight_chart.txt")
baby <- read.table("bimm143_05_rstats/weight_chart.txt",header=TRUE)

#plot the basic scatterplot and convert it to a line plot 
plot(baby)
plot(baby$Age, baby$Weight,type = "o",pch=15,cex=1.5,lwd=2,ylim=c(2,10),xlab="Age")
plot(baby$Age, baby$Weight,type = "o",ylab="Weight",xlab="Age",main="baby")
# cex = character size 
# pch = character type 
plot(1:5,pch=1:5,cex=1:5)
plot(5:1,pch=1:5,cex=1:5,xlab="x")

#generate the required plot for 2a
plot(baby$Age, baby$Weight,type = "o",ylim=c(2,10),ylab="Weight (kg)",xlab="Age (month)",main="Baby weight with age",lwd=2,pch=15,cex=1.5,col="blue")

# Section 2B barplot
read.table("bimm143_05_rstats/feature_counts.txt",sep="\t",header=TRUE)
mouse <- read.delim("bimm143_05_rstats/feature_counts.txt")
mouse
par(mar=c(3,12,4.1,2))
barplot (mouse$Count, names.arg = mouse$Feature, horiz = "True",las=1,xlim=c(0,80000),main="Number of features in the mouse GRCm38 genome")

#Section 2C Histograms
read.delim("bimm143_05_rstats/male_female_counts.txt")
color <-read.delim("bimm143_05_rstats/male_female_counts.txt")
color
par(mar=c(5,6,2,3))
barplot (color$Count,ylab="Counts",names.arg=color$Sample, col=rainbow(nrow(color)),las=1)



