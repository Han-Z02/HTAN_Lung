


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 2G
lung.sigs.avg.rbind <- get(load(paste0(data.path, "lung.sigs.avg.rbind.Rda")))

snps <- log10(c(151, 412, 43, 694, 73, 28, 125, 66, 657, 295, 468, 57, 4227, 947, 104, 66, 84, 380, 443, 182, 544, 347, 64))
p53_status <- c("WT", "WT", "WT", "WT", "WT", "WT", "WT", "WT", "WT", "WT",
                "Mutant", "Mutant", "Mutant", "Mutant", "Mutant", "Mutant", "Mutant", "Mutant", 
                "Mutant", "Mutant", "WT", "WT", "Mutant")
histology <- c(rep("LUAD", 18), rep("LUSC", 2), rep("NE", 1), rep("Mucinous/Colloid", 2))

lung.sigs.avg.rbind <- lung.sigs.avg.rbind[,c(WT.filt, p53.filt, other)]
ann = c("P14", "MGH1174", "MGH1176", "MGH1183", "BWH01", "BWH04", "BWH05", "BWH09", 
        "BWH19", "BWH23", "MGH1172", "MGH1173", "MGH1175", "MGH1182", "BWH16", "BWH11", 
        "BWH14", "BWH06", "P19", "MGH1181", "MGH1179", "MGH1170", "P17")
colnames(lung.sigs.avg.rbind) = ann

###
dark2 <- brewer.pal(n = 4, name = "Dark2")

ha = HeatmapAnnotation(
  histology = histology,
  p53_status = p53_status,
  col = list(p53_status = c("Mutant" = "#0091CA", "WT" = "#D8423D"),
             histology = c("LUAD" = dark2[1], "LUSC" = dark2[2],
                           "NE" = dark2[3], "Mucinous/Colloid" = dark2[4]))
)

col_fun <- colorRamp2(c(min(snps), max(snps)), c("white", "#4B0082"))
hb = HeatmapAnnotation(
  snps = snps,
  col = list(snps = col_fun)
)

############ 
pdf(paste0(figures.dir, "Fig2G.pdf"), useDingbats = F, width = 8, height = 3)
p<-Heatmap(lung.sigs.avg.rbind, cluster_rows = F, cluster_columns = F, top_annotation = ha, bottom_annotation = hb)
p
dev.off()
