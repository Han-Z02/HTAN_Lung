
levels.tmp <- levels(luad.2018@meta.data$DNE_LOFclass)
createBoxplots(plotVector = v.s4a, w = 3, h = 5,
               xVar = "DNE_LOFclass", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)),
               numCol = 1, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s4aB")
