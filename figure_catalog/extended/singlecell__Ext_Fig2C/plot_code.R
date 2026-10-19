


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 2C
res = get(load(paste0(data.path, "corr.pts.Rda")))
rownames(res)=colnames(res)=c("AT2.like", "AT1.2.like", "CC.G2M", "CC.S", "Ciliated", 
                              "Glycolysis.Hypox", "MHCII", "Hypoxia", "IFNG", "StressResponse", 
                              "Respiration.MT", "Metallothionein", "OxPhos", "PEMT", "Ribosome", 
                              "Secretory", "Senescence", "TNFA.NFKB")
ann = c("Glycolysis.Hypox","Metallothionein","Hypoxia","CC.G2M", "CC.S","PEMT","Senescence","OxPhos", "Ciliated","IFNG","Ribosome","Secretory","TNFA.NFKB",
        "MHCII","AT2.like","Respiration.MT","StressResponse","AT1.2.like")
res.ann = res[ann,ann]


pdf(paste0(figures.dir,"Ext_Fig2C.pdf"), width = 10, height = 9, useDingbats=F)
p<-Heatmap(res.ann, cluster_rows = F, cluster_columns = F)
p
dev.off()
