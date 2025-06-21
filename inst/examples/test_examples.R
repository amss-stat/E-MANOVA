library(GUniFrac)
data("throat.otu.tab")
data("throat.tree")
data("throat.meta")

smoke_stat<-rep(0,60)
for (i in 1:60) {
  if(throat.meta$SmokingStatus[i]==throat.meta$SmokingStatus[1]){
    smoke_stat[i]<-0
  }
  else{
    smoke_stat[i]<-1
  }
}

row.sum<-apply(throat.otu.tab,1,sum)
std_out<-throat.otu.tab/row.sum

##########
unifracs = GUniFrac::GUniFrac(std_out, throat.tree, alpha = c(0,0.5,1))$unifracs
Dw  = unifracs[,,"d_1"]
#Variance adjusted weighted UniFra
Du  = unifracs[,,"d_UW"]
D0  = unifracs[,,"d_0"]
D.05= unifracs[,,"d_0.5"]
D.BC= as.matrix(vegan::vegdist(std_out, method="bray"))

dis_adaptive<-abind::abind(D.05, Du, D.BC, along = 3)
EMANOVA(dis_adaptive, smoke_stat, confonding_stat = FALSE, r_vec = c(0.125,0.25,0.5,1,2))
