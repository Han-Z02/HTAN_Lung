


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 3G (Right-Hif1a)
comp.df = get(load(paste0(data.path, "exp_Hif1a_kp_mouse_30wks.Rda")))  

#############
colnames(comp.df)[2] = "status"
comp.df$status = as.character(comp.df$status)
comp.df$status[which(comp.df$status == "T")] = "Normal"
comp.df$status = factor(comp.df$status, levels = c("Normal", "K", "KP"))

my_comparisons = list(c("Normal", "K"), c("Normal", "KP"), c("K", "KP"))

mean.plot <- ggviolin(comp.df, x = "status", y = "HIF1A", color = "black", fill = "status",
                      palette = c("grey", "#0091CA", "#D8423D"),
                      add = "boxplot", add.params = list(fill = "white"))+
  rotate_x_text(angle = 45) + NoLegend() +
  stat_compare_means(comparisons = my_comparisons)

############# 
pdf(paste0(figures.dir, "Fig3G_right.pdf"), width = 5, height = 5, useDingbats=FALSE)
mean.plot
dev.off()
