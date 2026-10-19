
levels.tmp <- levels(luad.2018@meta.data$DNE_LOFclass)
createBoxplots(plotVector = v.s3ade, 
               xVar = "DNE_LOFclass", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)),
               numCol = 5, 
               plotDF = luad.2018@meta.data, 
               outfileName = "3d")
