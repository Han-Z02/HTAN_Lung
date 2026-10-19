

# # EXTENDED FIG 4C
# levels.tmp <- levels(luad.2018@meta.data$comut)
# p.s4c <- createEntropyViolinplots(plotVar = "ccat", outfileName = "s4c",
#                          titleStr = NULL,
#                          plotDF = luad.2018@meta.data, 
#                          xVar = "comut", 
#                          comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)))
# ggsave(filename = file.path(paste0(figures.dir, "s4c.pdf")), 
#        plot = p.s4c, 
#        device = "pdf", 
#        width = 3.5, 
#        height = 5)


# FIG 3K
levels.tmp <- levels(combined.luad.2018@meta.data$DNE_LOFclass)
p.3kA <- createEntropyViolinplots(plotVar = "ccat", outfileName = "3kA",
                         titleStr = NULL,
                         plotDF = combined.luad.2018@meta.data, 
                         xVar = "DNE_LOFclass", 
                         comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)))
levels.tmp <- levels(combined.luad.2018@meta.data$impact)
p.3kB <- createEntropyViolinplots(plotVar = "ccat", outfileName = "3kB",
                         titleStr = NULL,
                         plotDF = combined.luad.2018@meta.data, 
                         xVar = "impact", 
                         comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)))
p.3kA + p.3kB + patchwork::plot_layout(axes = "collect_y")
ggsave(filename = file.path(paste0(figures.dir, "3k.pdf")), 
       plot = (p.3kA + p.3kB + patchwork::plot_layout(axes = "collect_y")), 
       device = "pdf", 
       width = 4 * 2, 
       height = 5)
