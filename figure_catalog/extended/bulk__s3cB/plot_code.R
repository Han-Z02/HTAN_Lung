
levels.tmp <- levels(cptac.luad.prot@meta.data$impact)
createBoxplots(plotVector = v.s3c, w = 3.5, h = 5,
               xVar = "impact", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)),
               numCol = 3, 
               plotDF = cptac.luad.prot@meta.data, 
               outfileName = "s3cB")
