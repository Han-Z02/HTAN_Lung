

# FIG 3C
# ---- add code here ---


# EXTENDED FIG 2F: regression plot added during final revision; new_regression_plot.csv file received from Will
df.s2f <- read_csv(file.path(data.path, "new_regression_plot.csv")) |>
    column_to_rownames("...1")

selectedPrograms <- sort(unique(df.s2f$program))
selectedMutations <- c("uncorrected", "Histology corrected", "Stage corrected", "Histology + stage corrected")

p.s2f <- generateRegressionPlot(df.s2f, selectedPrograms, selectedMutations)
ggsave(filename = file.path(paste0(figures.dir, "s2f.pdf")), 
       plot = p.s2f, 
       device = "pdf", 
       width = 5, 
       height = 6.25)
