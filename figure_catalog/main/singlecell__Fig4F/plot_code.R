


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 4F
meta = get(load(paste0(data.path, "Fig4F_metadata_labeltrans.Rda")))

conf_mtx <- matrix(0, ncol = length(unique(meta$predicted.id)), nrow = length(unique(meta$subtype)))
colnames(conf_mtx) <- unique(meta$predicted.id)
rownames(conf_mtx) <- unique(meta$subtype)
for (actual.subtype in rownames(conf_mtx)){
  for (predicted.subtype in colnames(conf_mtx)){
    pair_freq <- sum(meta$subtype==actual.subtype & meta$predicted.id==predicted.subtype)
    conf_mtx[actual.subtype,predicted.subtype] <- pair_freq
  }
}
library(LICORS)
conf_mtx <- t(normalize(conf_mtx, byrow=TRUE))

conf_mtx2 = conf_mtx[c("Vascular Smooth Muscle","Airway Smooth Muscle","Fibromyocyte","Lipofibroblast","Alveolar Fibroblast",
                       "Adventitial Fibroblast","Pericyte","Myofibroblast"),
                     c("Pericyte", "Pericyte.EMT","SmoothMuscle.Airway","SmoothMuscle.Vascular","CAF.ADH1B","CAF.Adventitial","Myofibroblast",
                       "CAF.COLs","CAF.Complement","CAF.ISGs", "CAF.Cycling","CAF.Ribo","CAF.APOE")]

pdf(paste0(figures.dir, "Fig4F.pdf"), height = 5, width = 7, useDingbats=FALSE)
par(mar = c(10, 10, 10, 10))
heatmap.2(conf_mtx2, tracecol=NA, margins=c(12,14), col=bluered(100), Rowv=F,Colv=F,dendrogram="none")
dev.off()
