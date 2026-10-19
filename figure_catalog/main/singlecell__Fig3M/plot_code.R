


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 3M
conf_mtx = get(load(paste0(data.path, "conf_mtx.Rda")))
conf_mtx <- as.data.frame(conf_mtx, drop = F)
conf_mtx = conf_mtx[which(!conf_mtx$HPCS==0),,drop=F]

conf_mtx$types <- rownames(conf_mtx)
conf_mtx$x <- "HPCS"

############ 
pdf(file = paste0(figures.dir, "Fig3M.pdf"), useDingbats = F, width = 2.3, height = 4)
ggplot(conf_mtx, aes(fill=types, y=HPCS, x=x)) +
  geom_bar(position="stack", stat="identity") +
  scale_fill_manual(values=material.heat(7)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                     panel.background = element_blank(), axis.line = element_line(colour = "black"))
dev.off()
