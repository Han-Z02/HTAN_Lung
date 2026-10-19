


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 2C
res = get(load(paste0(data.path, "malig.corr.cells.Rda")))
rownames(res)=colnames(res)=c("AT2.like", "AT1.2.like", "CC.G2M", "CC.S", "Ciliated", 
                              "Glycolysis.Hypox", "MHCII", "Hypoxia", "IFNG", "StressResponse", 
                              "Respiration.MT", "Metallothionein", "OxPhos", "PEMT", "Ribosome", 
                              "Secretory", "Senescence", "TNFA.NFKB")
ann = c("Metallothionein","Hypoxia","Senescence","Glycolysis.Hypox","OxPhos","CC.G2M", "CC.S", "Ciliated","PEMT","Secretory","TNFA.NFKB","IFNG",
        "Ribosome","StressResponse","AT2.like","MHCII","Respiration.MT","AT1.2.like")
res.ann = res[ann,ann]

###########
pdf(paste0(figures.dir,"Fig2C.pdf"), width = 10, height = 9, useDingbats=F)
p<-Heatmap(res.ann, cluster_rows = F, cluster_columns = F)
p
dev.off()
