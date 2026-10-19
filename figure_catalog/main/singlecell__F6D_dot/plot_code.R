# ----------------------------------------------------
# dot plots
# ----------------------------------------------------
comb.df <- get(load(file.path(data.path, "viz_comb.df.Rda")))
pairs1 <- c("TIGIT--PVR", "TIGIT--NECTIN3", "TIGIT--NECTIN2", "PDCD1--FAM3C", "PDCD1--CD274", "KLRB1--CLEC2D", "HAVCR2--LGALS9", "CD47--LGALS9")
pairs2 <- c("VSIR--CCL4L2", "TNF--VSIR", "PDCD1--PDCD1LG2", "PDCD1--FAM3C", "PDCD1--CD274", "KLRC1--HLA-E", "KLRB1--CLEC2D", "HAVCR2--LGALS9", "CTLA4--CD86", "CTLA4--CD80", "CD47--LGALS9")
selectedInteractions <- c(pairs1, pairs2)
selectedCelltypes <- c("Lymphoid--cancer", "Lymphoid--Myeloid")

comb.df.filtered <- comb.df |>
    mutate(cell.pair = cell.pair.x) |>
    filter(lr.pair %in% selectedInteractions & cell.pair %in% selectedCelltypes)

# Add TP53 mutation information
p53_samples <- c("1172", "1173", "1175", "1182", "BW16", "BW11", "BW14", "BW06")
wt_samples <- c("14", "1174", "1176", "1183", "BW01", "BW04", "BW05", "BW09", "BW19", "BW23")
comb.df.filtered <- comb.df.filtered |>
    mutate(p53 = case_when(sampleid %in% p53_samples ~ "TP53mut", .default = "WT"), 
           p53 = factor(p53, levels = c("WT", "TP53mut")), 
           cell.pair = factor(cell.pair, levels = c("Lymphoid--cancer", "Lymphoid--Myeloid")), 
           sampleid = factor(sampleid, levels = c(wt_samples, p53_samples)))

# T-malignant ----------------------------------------
p.t_malig <- comb.df.filtered |>
    drop_na(sampleid) |>
    filter(lr.pair %in% pairs1 & cell.pair == selectedCelltypes[1]) |>
    ggplot(aes(x = sampleid, y = lr.pair, size = neg_log10pval, color = log2mean)) +
    geom_point() +
    scale_size_continuous(range = c(1, 10), breaks = c(0.5, 1, 2, 3)) +
    scale_color_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0, limits = c(-2, 3)) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
        text = element_text(size = 12),
        strip.text = element_text(size = 14, face = "bold")) +
    labs(title = "T cell-malignant",
       x = "Sample ID",
       y = "Ligand-Receptor pair",
       size = "-log10(p-value)",
       color = "Log2 Mean Expression")

# comb.df.filtered |>
#     drop_na(sampleid) |>
#     filter(lr.pair %in% pairs1 & cell.pair == selectedCelltypes[1]) |>
#     select(sampleid, lr.pair, neg_log10pval, log2mean) |>
#     write.csv(file.path(data.path, "5d_dot.t_malignant.csv"))

# T-myeloid ------------------------------------------
p.t_myeloid <- comb.df.filtered |>
    drop_na(sampleid) |>
    filter(lr.pair %in% pairs2 & cell.pair == selectedCelltypes[2]) |>
    ggplot(aes(x = sampleid, y = lr.pair, size = neg_log10pval, color = log2mean)) +
    geom_point() +
    scale_size_continuous(range = c(1, 10), breaks = c(0.5, 1, 2, 3)) +
    scale_color_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0, limits = c(-2, 3)) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
        text = element_text(size = 12),
        strip.text = element_text(size = 14, face = "bold")) +
    labs(title = "T cell-myeloid",
       x = "Sample ID",
       y = "Ligand-Receptor pair",
       size = "-log10(p-value)",
       color = "Log2 Mean Expression")

# comb.df.filtered |>
#     drop_na(sampleid) |>
#     filter(lr.pair %in% pairs2 & cell.pair == selectedCelltypes[2]) |>
#     select(sampleid, lr.pair, neg_log10pval, log2mean) |>
#     write.csv(file.path(data.path, "5d_dot.t_myeloid.csv"))

# generate patchwork for dot plots
p.6d.dot <- patchwork::wrap_plots(p.t_malig, p.t_myeloid, nrow = 2) + patchwork::plot_layout(heights = c(1, 11/8))
p.6d.dot

ggsave(filename = file.path(figures.dir, "F6D_dot.pdf"), 
       plot = p.6d.dot, 
       device = "pdf", 
       width = 10, 
       height = 5 * 2)
