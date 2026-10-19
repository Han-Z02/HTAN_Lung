# # EXTENDED FIG 4B old- taken out during revision 
# formula <- "p53_status + kras_status + egfr_status + stk11_status + Cancer_prop"
# programs <- c("p53_targets", "AT.SFTPA2,1", "CC.G2M", "Glycolysis/Hypox", "pEMT", "Endothelial", "Pericytes")

# finalModelResultsDF <- generateModelResults(df, programs, formula)
# # finalModelResultsDF |>
# #     filter((program %in% selectedPrograms) & (mutation %in% selectedMutations)) |>
# #     write.csv(file.path(data.path, "s3b.csv"))
# # Selected programs and mutations for the plot
# selectedPrograms <- c("p53_targets", "AT.SFTPA2,1", "CC.G2M", "Glycolysis/Hypox", "pEMT", "Endothelial", "Pericytes")
# selectedMutations <- c("uncorrected_p53", "EGFR", "KRAS", "STK11", "P53")

# p.s3b <- generateRegressionPlot(finalModelResultsDF, selectedPrograms, selectedMutations)
# ggsave(filename = file.path(paste0(figures.dir, "s4b_old.pdf")), 
#        plot = p.s3b, 
#        device = "pdf", 
#        width = 4, 
#        height = 6.25)
