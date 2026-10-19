


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 5I
df <- get(load(paste0(data.path, "lig_rec_differential_highlvl_df_not_allzeros.Rda")))

df <- df[grepl("Mesenchymal", df$cell.pair, fixed=TRUE),]

df2 <- df[!grepl("Nonmalig", df$cell.pair, fixed = TRUE),]

#mes
int_pairs <- c("VEGFA:KDR", "VEGFA:FLT1", "VEGFA:EPHB2", "TNFRSF1A:GRN", "TNC:a4b1 complex", "TGFB3:TGFbeta receptor2",
               "TGFB2:TGFbeta receptor2", "TGFB1:aVb6 complex", "PLAUR:a4b1 complex", "NRP2:VEGFA", "NRP1:VEGFB", "NRP1:VEGFA",
               "NRP1:SEMA3A", "NRP1:PGF", "NAMPT:P2RY6", "LGALS9:PTPRK", "JAG1:NOTCH3", "JAG1:NOTCH2", "FN1:a8b1 complex",
               "FN1:a5b1 complex", "FLT1:VEGFB", "FLT1:PGF", "FLT1 complex:VEGFA", "FBN1:a5b1 complex", "COPA:P2RY6", "COL6A2:a1b1 complex",
               "COL16A1:a2b1 complex", "COL16A1:a10b1 complex", "COL15A1:a10b1 complex", "COL12A1:a10b1 complex", "CCL2:CCR10",
               "AXL:IL15RA")
df2 <- df2[df2$int_name %in% int_pairs,]

range <- as.numeric(max(abs(df2$p53_wt_prop_diff)))

colors <- c(brewer_pal(palette = "Spectral", direction = -1)(7))
pal <- gradient_n_pal(colors)
custom_color_scale <- scale_fill_gradientn(
  colours = pal(c(0, rescale(seq_along(df2$p53_wt_prop_diff)), 1)), 
  values = c(0,rescale(seq_along(df2$p53_wt_prop_diff)),1), 
  limits = c(-range,range)
) 

############ 
pdf(file = paste0(figures.dir, "Ext_Fig5I.pdf"), useDingbats = F, height = 15, width = 8.3)
p<-ggplot(data = df2, mapping = aes(x=cell.pair, y=int_name, color=p53_wt_prop_diff, size=p53_wt_neglogpval_proptest))+geom_point(shape = 21, aes(colour = as.factor(signif), fill = p53_wt_prop_diff))+
  scale_colour_manual(values=c("00FFFFFF", "darkgray", "black")) + theme_minimal() +
  custom_color_scale +
  theme(text = element_text(size=12), strip.text = element_text(size=22,face='bold'))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
p
dev.off()
