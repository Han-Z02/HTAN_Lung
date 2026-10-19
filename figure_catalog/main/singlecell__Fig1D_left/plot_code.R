


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 1D
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

############ 1D right
my_color_palette<-c("#FF8D05", "#ACCF41", "#32B37C", "#70BA4C", "#283593", "#F44336",
                    "#3D4EB2", "#08B2DB", "#FFB605", "#FFDD29", "#FE5523", "#E1E239", "#268AE8")
pdf(paste0(figures.dir, "Fig1_overview/Fig1D.left.pdf"), useDingbats = F, width = 8)
p<-DimPlot(all, group.by = "celltype_2", cols = my_color_palette)
p
dev.off()
