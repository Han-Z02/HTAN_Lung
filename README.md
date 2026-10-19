[![DOI](https://zenodo.org/badge/737005410.svg)](https://doi.org/10.5281/zenodo.15866295)

# HTAN_Lung

## 逐图代码与示意图目录

查看 [figure_catalog 逐图索引](figure_catalog/README.md)：按独立输出整理主图、Extended Data 图、批量样本图与历史版本，每个子文件夹包含图形结构示意、对应代码片段、完整原脚本和中文说明。原分析目录保持原样。

仓库没有上传大多数论文结果图；目录中的 SVG 为明确标注的结构示意，不包含真实数据。原有 PDF 单独保留，缺失数据、缺失实现和图号冲突均有注明。

This repository contains custom code to reproduce main analyses in our manuscript, "A cellular and spatial atlas of TP53-associated tissue remodeling defines a multicellular tumor ecosystem in lung adenocarcinoma."

Processed scRNA-seq data, spatial transcriptomic data, and mutation information can be downloaded at https://doi.org/10.5281/zenodo.16546233.

System Requirements:
- Operating System: Tested on Rocky Linux 9.4.
- R Version: 4.1.0
- Python Version: 3.7
- R Packages:
  - Seurat (v4.4.0) (https://satijalab.org/seurat/)
  - ComplexHeatmap (v2.10.0) (https://bioconductor.org/packages/release/bioc/html/ComplexHeatmap.html)
  - pheatmap (v1.0.12) (https://github.com/raivokolde/pheatmap)
  - circlize (v0.4.16) (https://github.com/jokergoo/circlize)
  - clusterProfiler (v4.2.2) (https://bioconductor.org/packages/release/bioc/html/clusterProfiler.html)
  - ggpubr (v0.4.0) (https://rdrr.io/cran/ggpubr/)
  - data.table (v1.16.2) (https://rdatatable.gitlab.io/data.table/)
  - rlist (v0.4.6.1) (https://github.com/renkun-ken/rlist)
  - readxl (v1.3.1) (https://github.com/tidyverse/readxl)
  - gdata (v3.0.1) (https://github.com/r-gregmisc/gdata)
  - dplyr (v1.1.4) (https://dplyr.tidyverse.org/)
  - tidyverse (v2.0.0) (https://www.tidyverse.org/)
  - scuttle (v1.4.0) (https://www.bioconductor.org/packages/release/bioc/html/scuttle.html)
  - forestplot (v1.10.1) (https://cran.r-project.org/web/packages/forestplot/index.html)
  - LICORS (v0.2.0) (https://rdrr.io/cran/LICORS/)
  - SCENT (v1.0.3) (https://github.com/aet21/SCENT)
  - survival (v3.7-0) (https://github.com/therneau/survival)
  - survminer (v0.5.0) (https://github.com/kassambara/survminer)
  - ggplot2 (v3.5.1) (https://ggplot2.tidyverse.org/)
  - ggvis (v0.4.9) (https://ggvis.rstudio.com/)
  - colorRamps (v2.3) (https://rdrr.io/cran/colorRamps/)
  - RColorBrewer (v1.1-3) (https://cran.r-project.org/web/packages/RColorBrewer/index.html)
  - gplots (v3.2.0) (https://github.com/talgalili/gplots)
  - scales (v1.3.0) (https://github.com/r-lib/scales)
  - msigdbr (v7.5.1) (https://igordot.github.io/msigdbr/)
  - org.Hs.eg.db (v3.14.0) (https://bioconductor.org/packages/release/data/annotation/html/org.Hs.eg.db.html)
- Python Packages:
  - anndata (v0.7.6)
  - scanpy (v1.8.1)
  - pyscenic (0.11.2)
- Additional Hardware: No special hardware required.

Installation Guide for R Scripts:

```R
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
remotes::install_version(package = 'Matrix', version = package_version('1.6.4')) # Seurat dependency
remotes::install_version(package = 'MASS', version = package_version('7.3-54')) # Seurat dependency
remotes::install_version(package = 'Seurat', version = package_version('4.4.0'))
BiocManager::install("ComplexHeatmap")
remotes::install_version(package = 'pheatmap', version = package_version('1.0.12'))
remotes::install_github('YuLab-SMU/ggtree') # clusterProfiler dependency
BiocManager::install("clusterProfiler")
remotes::install_version(package = 'nloptr', version = package_version('1.2.2.2')) # ggpubr dependency
remotes::install_version(package = 'pbkrtest', version = package_version('0.5.2')) # ggpubr dependency
remotes::install_version(package = 'ggpubr', version = package_version('0.4.0'))
remotes::install_version(package = 'rlist', version = package_version('0.4.6.1'))
remotes::install_version(package = 'readxl', version = package_version('1.3.1'))
install.packages("gdata")
install.packages("tidyverse")
BiocManager::install("scuttle")
remotes::install_version(package = 'forestplot', version = package_version('1.10.1'))
remotes::install_version(package = 'LICORS', version = package_version('0.2.0'))
remotes::install_github("aet21/SCENT")
install.packages("survminer")
install.packages("ggvis")
remotes::install_version(package = 'colorRamps', version = package_version('2.3'))
remotes::install_version(package = 'msigdbr', version = package_version('7.5.1'))
BiocManager::install("org.Hs.eg.db") 
```

Installation Guide for Python Scripts:

```bash
pip install anndata scanpy pyscenic
```
