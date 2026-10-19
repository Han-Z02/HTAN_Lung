
# EXTENDED FIG 5H
v.s5h <- c("Pericytes")

levels.tmp <- levels(luad.2018@meta.data$comut)
createBoxplots(plotVector = v.s5h, w = 3, h = 5, 
               xVar = "comut", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x))[-6],
               numCol = 1, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s5hA")
