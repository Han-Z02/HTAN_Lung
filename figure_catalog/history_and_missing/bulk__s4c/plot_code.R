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

