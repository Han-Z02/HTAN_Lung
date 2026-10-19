


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 1F and Extended 1D
all = get(load("../zenodo_data/all.merge.Rda"))

# celltype_2: rename celltype
all$celltype_2 = all$celltype
all$celltype_2[which(all$celltype == "Cancer")] = "Malignant"
all$celltype_2[which(all$celltype == "Nonmalig")] = "Nonmalig Epi"
all$celltype_2[which(all$subtype == "Lymphatic")] = "Lymphatic"
all$celltype_2[which(all$subtype %in% c("CAF.ADH1B", "Myofibroblast", "CAF.Complement", 
                                        "CAF.COL", "CAF.Ribo", "CAF.Adventitial", 
                                        "CAF.APOE.IGFBP", "CAF.ISG", "CAF.Cycling"))] = "CAF"
all$celltype_2[which(all$subtype %in% c("Pericyte.EMT", "SmoothMuscle.Airway", "SmoothMuscle.Vascular"))] = "SmoothMuscle"

all.v2.meta = all@meta.data

CD4T_ID = rownames(all.v2.meta)[which(all.v2.meta$subtype %in% c("CD4.Naive.CM", "CD4.TRM","Treg", "TFH"))]
CD8T_ID = rownames(all.v2.meta)[which(all.v2.meta$subtype %in% c("CD8.IFN", "CD8.GZMK", "CD8.TRM", "T.Exhausted"))]

#
all$celltype_3 = all$celltype_2
all$celltype_3[which(all$subtype %in% c("CD4.Naive.CM", "CD4.TRM","Treg", "TFH"))] = "CD4_T"
all$celltype_3[which(all$subtype %in% c("CD8.IFN", "CD8.GZMK", "CD8.TRM", "T.Exhausted"))] = "CD8_T"
all$celltype_3[which(all$celltype_3 == "Tcell")] = "T_other"


############ Figure 1F and Extended 1D left part
Idents(all) <- "orig.ident"
unsorted <- subset(all, idents = c("14MA","14ML","17M","19_Norm","MGH_1170","MGH1172a","MGH1172b",
                                      "MGH1173a","MGH1173b","MGH1174a","MGH1174b","MGH1175a","MGH1175b","MGH1176","MGH1179a","MGH1181",
                                      "MGH1182","MGH1183","NSC001BLT_FT","NSC004bBN_FT","NSC005bLT_FT","NSC006bLT_FT_V2","NSC009bLT_FT_T1",
                                      "NSC011bLT_FT_T1","NSC014bLT_FT1","NSC016bLT_FT_T1","NSC019bLTcd45n","NSC023bLT")) 

comp.df <- as.matrix(table(unsorted$orig.identSec, unsorted$celltype_2))
comp.df  <- prop.table(comp.df , 1)

comp.df <- comp.df[sampleids.filt,]

############
p53_status <- p53.status.filt
comp.df <- cbind(comp.df, p53_status)
comp.df = as.data.frame(comp.df)
comp.df$p53_status <- factor(comp.df$p53_status, levels = c("WT", "p53_mut"))


subtypes <- colnames(comp.df)[-14]
for (i in 1:(ncol(comp.df)-1))
{
  comp.df[,i] = as.numeric(comp.df[,i])
}

mean.plots <- list()

for (subtype in subtypes){
  mean.plot <- ggboxplot(comp.df, x = "p53_status", y = subtype, color = "p53_status",
                         palette = c("#0091CA", "#D8423D"), add = "jitter",
                         title = subtype) +
    stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(comp.df[,subtype]))) +
    theme(plot.title = element_text(size = 12, face = "bold")) + NoLegend()
  mean.plots[[subtype]] <- mean.plot
}


############ Figure 1F
mean.plots.2 = list()
mean.plots.2[[1]] = mean.plots[[3]] ## Endothelial
mean.plots.2[[2]] = mean.plots[[10]]   ## Pericyte

pdf(paste0(figures.dir, "Fig1_overview/Fig1F.pdf"), width = 6, height = 3, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots.2, ncol=2)
dev.off()
