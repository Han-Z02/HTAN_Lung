
levels.tmp <- levels(luad.2018@meta.data$impact)
createBoxplots(plotVector = v.s6de, w = 3, h = 5,
               xVar = "impact", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)),
               numCol = 4, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s6eB")
