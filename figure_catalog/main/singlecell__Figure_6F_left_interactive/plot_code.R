# fig 6f ---------------------------------------------
# ----------------------------------------------------

# ----------------------------------------------------
# load the libraries
# ----------------------------------------------------
library(Seurat)
library(tidyverse)
# ----------------------------------------------------
# load the malig compartment object
# ----------------------------------------------------
obj <- get(load("../zenodo_data/malig.Rda"))
# ----------------------------------------------------
# preparing the data for plotting
# ----------------------------------------------------
p53 <- c("1172", "1173", "1175", "1182", "BW16", "BW11", "BW14", "BW06")
WT <- c("14", "1174", "1176", "1183", "BW01", "BW04", "BW05", "BW09", "BW19", "BW23")

obj@meta.data <- obj@meta.data |> 
    mutate(p53_status = case_when(orig.identSec %in% WT ~ "WT", 
                                  orig.identSec %in% p53 ~ "p53_mut", 
                                  .default = "Not LUAD"))
obj.filt <- subset(obj, subset = p53_status %in% c("WT", "p53_mut"))
# ----------------------------------------------------
# adding the counts for PVR to the metadata
# ----------------------------------------------------
df.counts <- FetchData(object = obj.filt, vars = c("PVR"), slot = "counts")
colnames(df.counts) <- paste0("counts_", colnames(df.counts))
metadata <- obj@meta.data
metadata <- merge(x = metadata, y = df.counts, by = "row.names") |> 
    column_to_rownames("Row.names")
# ----------------------------------------------------
# get patient-level metadata by averaging
# ----------------------------------------------------
metadata.p <- metadata |> 
  group_by(orig.identSec) |> 
  summarise(across(where(is.numeric), \(x) mean(x, na.rm = TRUE)),
            subtype = first(subtype),
            p53_status = first(p53_status),
            .groups = "drop")
metadata.p$log_meancounts_PVR <- log10(metadata.p$counts_PVR + 1)
# ----------------------------------------------------
# fig 6f left
# ----------------------------------------------------
metadata.p |> 
    ggpubr::ggboxplot(x = "p53_status", y = "log_meancounts_PVR", 
    color = "p53_status",
    palette = c("#0091CA", "#D8423D"), 
    add = "jitter",
    title = "log10(mean counts + 1) for PVR | wilcox test") +
    ggpubr::stat_compare_means(method = "wilcox.test") +
    theme(plot.title = element_text(size = 12, face = "bold")) + 
    NoLegend()

# save data
metadata.p |> 
    select(orig.identSec, p53_status, log_meancounts_PVR) |> 
    write.csv("../data/p53_fig6f_left.csv")
