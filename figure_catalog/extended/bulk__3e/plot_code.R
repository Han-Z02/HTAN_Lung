
levels.tmp <- levels(luad.2018@meta.data$impact)
createBoxplots(plotVector = v.s3ade, 
               xVar = "impact", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)),
               numCol = 5, 
               plotDF = luad.2018@meta.data, 
               outfileName = "3e")
