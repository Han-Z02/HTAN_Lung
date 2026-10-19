


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 2I
info = read_excel(paste0(data.path, "TableS1.xlsx"))
info = as.data.frame(info)
print(info[,c("Patient","SNPs","CNAs")])

p53.filt.v2 <- c("MGH1172", "MGH1173", "MGH1175", "MGH1182", "BWH16", "BWH11", "BWH14", "BWH06")
WT.filt.v2 <- c("P14", "MGH1174", "MGH1176", "MGH1183", "BWH01", "BWH04", "BWH05", "BWH09", "BWH19", "BWH23") 

comp.df = info[,c("Patient","SNPs","CNAs")]
comp.df[,"SNPs"] = log10(comp.df[,"SNPs"])
colnames(comp.df)[2] = "log10(SNPs)"
comp.df$p53_status = NA
comp.df$p53_status[which(comp.df$Patient %in% p53.filt.v2)] = "TP53_mut"
comp.df$p53_status[which(comp.df$Patient %in% WT.filt.v2)] = "TP53_wt"
se = which(is.na(comp.df$p53_status))
comp.df = comp.df[-se,]
comp.df$p53_status = factor(comp.df$p53_status, levels = c("TP53_wt", "TP53_mut"))

###########
subtypes = c("log10(SNPs)", "CNAs")
mean.plots = list()

for (subtype in subtypes){
  mean.plot <- ggboxplot(comp.df, x = "p53_status", y = subtype, color = "p53_status",
                         palette = c("#0091CA", "#D8423D"), add = "jitter",
                         title = subtype) +
    stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(comp.df[,subtype]))) +
    theme(plot.title = element_text(size = 12, face = "bold")) + NoLegend()
  mean.plots[[subtype]] <- mean.plot
}


pdf(paste0(figures.dir, "Ext_Fig2I.pdf"), width = 5, height = 3, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots, ncol=2)
dev.off()
