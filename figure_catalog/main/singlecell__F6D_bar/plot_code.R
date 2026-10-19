



### F6D ####

# T-malignant ----------------------------------------
df <- get(load(file.path(data.path, "lig_rec_differential_htan_df_not_allzeros.Rda")))
pairs1 <- c("PVR_TIGIT", "TIGIT_NECTIN3", "TIGIT_NECTIN2", "PDCD1_FAM3C", "PDCD1_CD274", "KLRB1_CLEC2D", "LGALS9_HAVCR2", "LGALS9_CD47")
print(all(pairs1 %in% df$interacting_pair))

df1 <- df |>
    filter(interacting_pair %in% pairs1 & cell.pair %in% c("Cancer.Tcell", "Tcell.Cancer")) |>
    mutate(interacting_pair = factor(interacting_pair, levels = rev(pairs1)))

# manually remove the unwanted entries
df1 <- df1 |>
    filter(!(interacting_pair == "LGALS9_CD47" & cell.b != "Cancer"))

# df1 |>   
#     select(interacting_pair, p53_wt_neglogpval_fishertest) |> 
#     write.csv(file.path(data.path, "5d_bar.t_malignant.csv"))

p.bar.t_malig <- df1 |>   
    select(interacting_pair, p53_wt_neglogpval_fishertest) |>
    ggplot(aes(x = p53_wt_neglogpval_fishertest, y = interacting_pair)) +
    geom_bar(stat = "identity", fill = "gray30") +
    geom_vline(xintercept = 1.3, linetype = "dashed") +
    theme_classic() +
    xlab(expression(-log[10]("p-value"))) +  # Correctly format the axis label
    ylab("Ligand-Receptor pair")

# T-myeloid ------------------------------------------
pairs2 <- c("CCL4L2_VSIR", "TNF_VSIR", "PDCD1_PDCD1LG2", "PDCD1_FAM3C", "PDCD1_CD274", "HLA-E_KLRC1", "KLRB1_CLEC2D", "LGALS9_HAVCR2", "CTLA4_CD86", "CTLA4_CD80", "LGALS9_CD47")
print(all(pairs2 %in% df$interacting_pair))

df2 <- df |>
    filter(interacting_pair %in% pairs2 & cell.pair %in% c("Myeloid.Tcell", "Tcell.Myeloid")) |>
    mutate(interacting_pair = factor(interacting_pair, levels = rev(pairs2)))

# manually remove the unwanted entries
df2 <- df2 |>
    filter(!(interacting_pair == "LGALS9_HAVCR2" & cell.a != "Myeloid")) |>
    filter(!(interacting_pair == "LGALS9_CD47" & cell.a != "Myeloid")) |>
    filter(!(interacting_pair == "TNF_VSIR" & cell.b != "Myeloid")) |>
    filter(!(interacting_pair == "CCL4L2_VSIR" & cell.a != "Myeloid"))

# df2 |>   
#     select(interacting_pair, p53_wt_neglogpval_fishertest) |>
#     write.csv(file.path(data.path, "5d_bar.t_myeloid.csv"))

p.bar.t_myeloid <- df2 |>   
    select(interacting_pair, p53_wt_neglogpval_fishertest) |>
    ggplot(aes(x = p53_wt_neglogpval_fishertest, y = interacting_pair)) +
    geom_bar(stat = "identity", fill = "gray30") +
    geom_vline(xintercept = 1.3, linetype = "dashed") +
    theme_classic() +
    xlab(expression(-log[10]("p-value"))) +  # Correctly format the axis label
    ylab("Ligand-Receptor pair")

# generate patchwork for bar plots
p.6d.bar <- p.bar.t_malig + p.bar.t_myeloid + patchwork::plot_layout(ncol = 1, heights = c(1, 11/8))
ggsave(filename = file.path(figures.dir, "F6D_bar.pdf"), 
       plot = p.6d.bar, 
       device = "pdf", 
       width = 5, 
       height = 5 * 2)
