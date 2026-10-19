


# ----------------------------------------------------
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
# ----------------------------------------------------
# compute Pearson correlation
# ----------------------------------------------------
cor_test <- cor.test(metadata.p$counts_PVR, metadata.p$CC.G2M1, method = "pearson")
r_val <- round(cor_test$estimate, 2)
p_val <- format.pval(pv = cor_test$p.value, digits = 2)
# ----------------------------------------------------
# 6f right
# ----------------------------------------------------
ggplot(metadata.p, aes(x = counts_PVR, y = CC.G2M1, color = p53_status)) +
    geom_point(size = 3, alpha = 0.9) +
    geom_smooth(method = "lm", se = TRUE, color = "blue", fill = "lightgray") +
    annotate("text", x = 0.02, y = 0.5,
             label = bquote(italic(R) * "=" * .(r_val) * ";" ~ italic(p) * "=" * .(p_val)),
             hjust = 0, size = 5) +
    labs(x = expression("Mean " * italic("PVR") * " expression"),
         y = "Cell cycle score",
         color = NULL) +
    theme_classic(base_size = 14) +
    theme(legend.position = c(0.05, 0.95),
          legend.justification = c(0, 1),
          legend.text.align = 0,
          legend.background = element_blank(),
          legend.text = element_text(size = 12))

# save data
metadata.p |> 
    select(orig.identSec, p53_status, counts_PVR, CC.G2M1) |> 
    write.csv("../data/p53_fig6f_right.csv")
# ----------------------------------------------------




#### F6H ####            
all_malig = data.frame (
        row.names = c(
        'PVR+CD274+',
        'PVR+CD274-',
        'PVR-CD274+',
        'PVR-CD274-'),WT=c(0.004290886,
     0.072632191,
     0.024315023,
     0.898761901),p53_mut=c(0.03597884,
        0.15806878,
        0.05740741,
        0.74854497))
cycling_malig = data.frame (
        row.names = c(
        'PVR+CD274+',
        'PVR+CD274-',
        'PVR-CD274+',
        'PVR-CD274-'),
        WT=c(
        0.01237964,
        0.10729023,
        0.03507565,
        0.84525447),
        p53_mut=c(
        0.1402525,
        0.3029453,
        0.0743338,
        0.4824684))

sums <- all_malig

rownames(sums) <- sums$X
sums$X <- NULL
sequential <- brewer.pal(4, "Spectral")
# sequential <- rev(sequential)

#### F6H malignant cells ####            
pdf (file.path(figures.dir,'F6H_malignant_cells.pdf'))
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
