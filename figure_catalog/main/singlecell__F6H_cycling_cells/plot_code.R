


#### F6H cycling cells ####            
sums <- cycling_malig
pdf (file.path(figures.dir,'F6H_cycling_cells.pdf'))
barplot(as.matrix(sums),
        # names.arg = wide$Seed, # x-axis labels
        cex.names = 1, # makes x-axis labels small enough to show all
        col = sequential, # colors
        las=2,
        # xlab = "Seed Source",
        ylab = "Proportion of cycling cancer cells",
        xlim = c(0,10), # these two lines allow space for the legend
        ylim = c(0,1),
        width = 1, # these two lines allow space for the legend
        legend = rownames(sums), #in order from top to bottom
        fill = sequential[4:1],
        )#, # 6:1 reorders so legend order matches graph
#title = "Years")
dev.off()
