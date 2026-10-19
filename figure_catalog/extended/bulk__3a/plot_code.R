

# EXTENDED FIG 3A, D, E
v.s3ade <- c("p53_targets", "AT2", "CC.G2M", "`Glycolysis/Hypox`", "pEMT") # row 1

levels.tmp <- levels(luad.2018@meta.data$comut)
createBoxplots(plotVector = v.s3ade, 
               xVar = "comut", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x))[-6],
               numCol = 5, 
               plotDF = luad.2018@meta.data, 
               outfileName = "3a")
