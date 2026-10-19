


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended 1C
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

# Stacked bar plot
obj <- all

Idents(obj) <- obj$orig.identSec

my_color_palette <- c("#F44336", "#FE5523", "#FF8D05", "#FFDD29", "#E1E239",
                      "#ACCF41", "#70BA4C", "#32B37C", "#08B2DB", "#268AE8", "#3D4EB2", "#FFB605",
                      "#283593")

#
Dout <- table(obj$celltype_2,Idents(obj))
Dout <- Dout[,c(WT.filt,p53.filt, other)]
Dout <- prop.table(Dout, 2)

names<-c("Malignant", "Nonmalig Epi", "Myeloid", "Tcell", "NK", "Endothelial", "Lymphatic",
         "CAF", "SmoothMuscle", "Pericyte", "Bcell", "Plasma", "Mast")
Dout <- Dout[rev(names),]
colnames(Dout) = c("P14", "MGH1174", "MGH1176", "MGH1183", "BWH01", "BWH04", "BWH05", "BWH09",
                   "BWH19", "BWH23", "MGH1172", "MGH1173", "MGH1175", "MGH1182", "BWH16", "BWH11",
                   "BWH14", "BWH06", "P19", "MGH1181", "MGH1179", "MGH1170", "P17")

############
pdf(paste0(figures.dir, "Fig1_overview/Ext_Fig1C.pdf"), height = 5, width = 10, useDingbats=FALSE)
barplot2(Dout, main="Cell type composition", legend = rownames(Dout),col = my_color_palette, xlim=c(0, ncol(Dout) + 15), las=2,
         legend.text=TRUE,args.legend=list(x=ncol(Dout)+15,y=max(colSums(Dout)),bty = "n"))
dev.off()
