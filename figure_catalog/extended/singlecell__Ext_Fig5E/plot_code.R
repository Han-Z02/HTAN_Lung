


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 5E 
meta = get(load(paste0(data.path, "meta.caf.modulescore.top20.paper.top20.ours.rna.assay.Rda")))

paper.score = meta[,c(36:43)]
our.score = meta[,c(44:56)]

res = cor(paper.score, our.score, method = "p")
rownames(res) = substr(rownames(res), 1, (nchar(rownames(res))-1))

##
library(ComplexHeatmap)
library(circlize)

res2 = res[c(1,2,4,6,7,8),c(1,2,3,4,5,7,8,9)]
res2 = t(res2)
rownames(res2) = gsub("Adm20.", "", rownames(res2))
res2 = res2[c("CAF.COLs", "CAF.Complement", "CAF.Adventitial", "CAF.ADH1B", "CAF.APOE", "Myofibroblast", "CAF.ISGs", "CAF.Ribo"),
            c("c2.CAF.infla", "c4.CAF.adi", "c7.CAF.PN", "c1.CAF.myo", "c8.CAF.ap", "c6.CAF.EndMT" )]

pdf(paste0(figures.dir, "Ext_Fig5E.pdf"), useDingbats = F, width = 8, height = 8) 
Heatmap(res2, cluster_rows = F, cluster_columns = F, name = "Pearson.cor")
dev.off()
