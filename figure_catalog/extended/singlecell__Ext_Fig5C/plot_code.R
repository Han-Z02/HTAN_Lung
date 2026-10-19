



#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#################### Extended 5C
mes <- get(load("../zenodo_data/mes.final.nodoublets.Rda"))

# Stacked bar plot
obj <- mes

Idents(obj) <- obj$orig.identSec

my_color_palette <- rev(hue_pal()(length(unique(obj$subtype))))
Dout <- table(obj$subtype,Idents(obj))

Dout <- Dout[,c(WT.filt,p53.filt, other)]
Dout <- prop.table(Dout, 2)

names<-c("CAF.ADH1B","CAF.APOE","CAF.Adventitial","CAF.COLs","CAF.Complement","CAF.Cycling","CAF.ISGs",
         "CAF.Ribo","Myofibroblast","Pericyte","Pericyte.EMT","SmoothMuscle.Airway","SmoothMuscle.Vascular")
Dout <- Dout[rev(names),]

############
pdf(paste0(figures.dir, "Ext_Fig5C.pdf"), height = 5, width = 14, useDingbats=FALSE)
par(mar=c(5, 4.1, 4.1, 2.1))
barplot2(Dout, main="Cell type composition", legend = rownames(Dout),col = my_color_palette, xlim=c(0, ncol(Dout) + 15), las=2,
         legend.text=TRUE,args.legend=list(x=ncol(Dout)+15,y=max(colSums(Dout)),bty = "n"))
dev.off()
