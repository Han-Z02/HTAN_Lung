
# EXTENDED FIG 7G
v.s7g <- c("PVR", "CD274")
createBoxplots(plotVector = v.s7g, w = 3, h = 4, 
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 2, 
               plotDF = cptac.luad.prot@meta.data, 
               outfileName = "s7g")
