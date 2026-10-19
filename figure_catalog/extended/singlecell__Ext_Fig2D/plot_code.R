


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 2D 
meta = get(load(paste0(data.path, "meta_30_20_top_nmf_genes.Rda")))

malig.score = meta[,c(52:69)]
colnames(malig.score) = substr(colnames(malig.score), 1, (nchar(colnames(malig.score))-1))
cnmf.score = meta[,c(71:(ncol(meta)-1))]

res = cor(malig.score, cnmf.score, method = "p")

res2 = res[c("AT.SFTPC", "MT.respiration", "HLA.D.AT2", "AT.SFTPA2.1", "JUN.FOS", "TNFA.NFKB", 
             "Ribosome", "IFNG", "Secretory", "Ciliated", "PEMT", "Metallothionein", 
             "Hypoxia", "Glycolysis.Hypox", "Senescence", "OxPhos", "CC.S",
             "CC.G2M"),
           c("CN29", "CN1", "CN3", "CN23", "CN22", "CN12", "CN26", "CN19", "CN13", "CN30", "CN21", "CN25", "CN8", "CN5", "CN9", "CN10", "CN20", "CN7", "CN27", "CN2",
             "CN14", "CN28", "CN18", "CN17", "CN16", "CN11", "CN15", "CN6", "CN4", "CN24")]
rownames(res2) = c("AT1.2.like", "Respiration.MT", "MHCII", "AT2.like", "StressResponse", "TNFA.NFKB", 
                   "Ribosome", "IFNG", "Secretory", "Ciliated", "PEMT", "Metallothionein", 
                   "Hypoxia", "Glycolysis.Hypox", "Senescence", "OxPhos", "CC.S",
                   "CC.G2M")

############
pdf(paste0(figures.dir, "Ext_Fig2D.pdf"), width = 10, height = 8) 
Heatmap(res2, cluster_rows = F, cluster_columns = F, name = "Pearson.cor")
dev.off()
