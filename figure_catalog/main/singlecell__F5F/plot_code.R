

#### F5F ####
df <- get(load(paste0(data.path, "lig_rec_differential_highlvl_df_not_allzeros.Rda")))

df <- df[grepl("Myeloid", df$cell.pair, fixed=TRUE),]

df2 <- df[!grepl("Nonmalig", df$cell.pair, fixed = TRUE),]

#end
int_pairs <- c("VEGFA:FLT1", "VEGFA:EPHB2", "TNFRSF10B:TNFSF10", "TGFB2:TGFbeta receptor1", "SPP1:a9b1 complex",
               "SPP1:a4b1 complex", "SPP1:CD44", "PLXNB1:SEMA4D", "NRP2:SEMA3C", "NRP2:PGF", "NRP1:VEGFB",
               "NRP1:VEGFA", "NRP1:SEMA3A", "NRP1:PGF", "MIF:TNFRSF14", "LGALS9:PTPRK", "LGALS9:HAVCR2",
               "GPR37:PSAP", "FLT1:VEGFB", "FLT1:PGF", "CXCL11:CXCR3", "CXCL10:CXCR3", "CTLA4:CD86",
               "COPA:P2RY6", "CD52:SIGLEC10", "CD40:TNFSF13B", "CCL5:ACKR1", "ANXA1:FPR3", "ADRB2:VEGFB", "ACKR1:CCL17")
df2 <- df2[df2$int_name %in% int_pairs,]

range <- as.numeric(max(abs(df2$p53_wt_prop_diff)))

colors <- c(brewer_pal(palette = "Spectral", direction = -1)(7))
pal <- gradient_n_pal(colors)
custom_color_scale <- scale_fill_gradientn(
  colours = pal(c(0, rescale(seq_along(df2$p53_wt_prop_diff)), 1)), 
  values = c(0,rescale(seq_along(df2$p53_wt_prop_diff)),1), #
  limits = c(-range,range)
) 

############
pdf(file = paste0(figures.dir, "F5F.pdf"), useDingbats = F, height = 15, width = 8.3)
p<-ggplot(data = df2, mapping = aes(x=cell.pair, y=int_name, color=p53_wt_prop_diff, size=p53_wt_neglogpval_proptest))+geom_point(shape = 21, aes(colour = as.factor(signif), fill = p53_wt_prop_diff))+
  scale_colour_manual(values=c("00FFFFFF", "darkgray", "black")) + theme_minimal() +
  custom_color_scale +
  theme(text = element_text(size=12), strip.text = element_text(size=22,face='bold'))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
p
dev.off()
