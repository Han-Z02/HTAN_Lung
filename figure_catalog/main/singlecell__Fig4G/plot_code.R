


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 4G
# regulon heatmap
df <- read.csv(paste0(data.path, "mes_pyscenic_subtype_zscore.csv"), row.names = 1)
df2 <- dcast(df, regulon ~ subtype, value.var = "Z")
rownames(df2) <- df2$regulon
df2$regulon <- NULL
df2 <- t(df2)
df2 <- as.matrix(df2)
library(gplots)
tfs <- c("GATA5", "FOXO3", "FOXP2", "RARG", "ELK3", "ZNF433", "TWIST1", "CREB3L1", "SOX11", "SOX4", "SPIB", "E2F1", "MYBL2", "FOSL1", "IRF7", "STAT1", "ETV7", "GATA6", "NFATC4", "ZNF426", "KLF5", "TFCP2L1", "REL", "ZNF527", "YY2", "ERG", "MLX", "RBAK", "FOXA1", "NFATC2", "ZNF671", "MEF2C", "SOX15", "JUNB", "NR4A3", "FOXN2", "MYC", "TEAD4")
df2 <- df2[,tfs]

rownames(df2) = c("CAF.ADH1B", "CAF.APOE", "CAF.COLs", "CAF.Complement",
                  "CAF.Cycling", "CAF.ISGs", "CAF.Adventitial", "CAF.Ribo", "Myofibroblast",
                  "Pericyte", "Pericyte.PTN", "SmoothMuscle.Airway", "SmoothMuscle.Vascular")

############
pdf(paste0(figures.dir, "Fig4G.pdf"), useDingbats = F, width = 10, height = 3)
p<-Heatmap(df2, cluster_rows = FALSE, cluster_columns = FALSE)
p
dev.off()
