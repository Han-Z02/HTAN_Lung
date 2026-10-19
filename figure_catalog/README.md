# HTAN Lung 逐图目录

按**独立输出/子图**整理：179 个现行绘图输出条目、2 个未保存的交互绘图、3 个注释历史版本、1 个缺失实现占位，以及 1 份仓库原有图像/PDF。左右图、条形图和气泡图分别建目录；一个 PDF 内由原代码组合的多面板保留为一个条目。

原仓库版本：`9afc9d6f5e6e15a9c365f6ec5ce661d299ad0108`。原始分析目录与代码均保留。

每个代码条目包含：`schematic.svg`（图形结构示意）、`plot_code.R` 或 `.py`（原代码片段）、`source_original.R` 或 `.py`（完整原脚本）、中文 `README.md` 和 `metadata.json`（来源与校验值）。

**仓库没有上传绝大多数原始结果图。示意图只表示代码中的图形类型，不含真实观测数据，不是论文原图，也不是代码复现结果。** 外部处理数据来自 [Zenodo](https://doi.org/10.5281/zenodo.16546233)，R/Python 环境要求见[原 README](../README.md)。整理过程中没有运行原始分析。

代码片段逐字复制，供阅读定位，可能依赖上游变量或包含循环上下文；单独执行前需配置数据、路径、共享函数和软件包。完整代码副本保留原样，执行会生成原脚本中的其他图。所有输入候选标注的是原脚本级别的静态识别结果，不宣称是单图最小依赖。

`all_spatial_plots.R` 中选取的 14 个样本按循环位置分别建目录，样本名须读取外部 `spatial_list.Rda` 才能确定；每个 PDF 内含 8 个基因面板。inferCNV 的 5 个命名切片分别收录。批次目录的片段仍为原始循环，`metadata.json` 的 selector 记录对应迭代。

查看[CSV 索引](index.csv)、[机器可读清单](manifest.json)、[代码覆盖清单](COVERAGE.md)和[图号冲突说明](NOTES.md)。[原有 PDF](assets/combined_annotation_breakdown/README.md)单独保留，其生成代码未知。

| 图号（按输出名，含冲突别名） | 独立条目 | 图形类型 | 状态 |
| --- | --- | --- | --- |
| Extended_01A | [Fig1_overview/Ext_Fig1A.pdf](extended/singlecell__Ext_Fig1A/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_01B | [Fig1_overview/Ext_Fig1B.pdf](extended/singlecell__Ext_Fig1B/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Extended_01C | [Fig1_overview/Ext_Fig1C.pdf](extended/singlecell__Ext_Fig1C/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Extended_01D | [s1d.pdf](extended/bulk__s1d/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_01D | [Fig1_overview/Ext_Fig1D.pdf](extended/singlecell__Ext_Fig1D/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_01D | [Fig1_overview/Ext_Fig1D_part2.pdf](extended/singlecell__Ext_Fig1D_part2/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_01E | [EX_FIG_1E.pdf](extended/spatial__EX_FIG_1E/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_01E | [EX_FIG_1E_bottom.pdf](extended/spatial__EX_FIG_1E_bottom/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_01F | [EX_FIG_1F.pdf](extended/spatial__EX_FIG_1F/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Extended_01G | [EX_FIG_1G.pdf](extended/spatial__EX_FIG_1G/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Extended_01H | [EX_FIG_1H.pdf](extended/spatial__EX_FIG_1H/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Extended_02A | [Ext_Fig2A.pdf](extended/singlecell__Ext_Fig2A/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Extended_02B | [Ext_Fig2B.pdf](extended/singlecell__Ext_Fig2B/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_02C | [Ext_Fig2C.pdf](extended/singlecell__Ext_Fig2C/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_02D | [Ext_Fig2D.pdf](extended/singlecell__Ext_Fig2D/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_02E | [s2e.pdf](extended/bulk__s2e/README.md) | 生存曲线 | 绘图代码，原图未上传 |
| Extended_02F | [s2f.pdf](extended/bulk__s2f/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_02G | [s2g.pdf](extended/bulk__s2g/README.md) | 生存曲线 | 绘图代码，原图未上传 |
| Extended_02H | [Ext_Fig2H.pdf](extended/singlecell__Ext_Fig2H/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_02I | [Ext_Fig2I.pdf](extended/singlecell__Ext_Fig2I/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_03A | [3a.pdf](extended/bulk__3a/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_03A | [Ext_Fig3A.pdf](extended/singlecell__Ext_Fig3A/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Extended_03B | [s3b.pdf](extended/bulk__s3b/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_03C | [s3cA.pdf](extended/bulk__s3cA/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_03C | [s3cB.pdf](extended/bulk__s3cB/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_03D | [3d.pdf](extended/bulk__3d/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_03D | [Ext_Fig3D.pdf](extended/singlecell__Ext_Fig3D/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Extended_03E | [3e.pdf](extended/bulk__3e/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_04A | [s4aA.pdf](extended/bulk__s4aA/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_04A | [s4aB.pdf](extended/bulk__s4aB/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_04B | [Ext_Fig4B.pdf](extended/singlecell__Ext_Fig4B/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_04B | [s4b_old.pdf](history_and_missing/bulk__s4b_old/README.md) | 气泡/点图 | 已注释的历史代码 |
| Extended_04C | [Ext_Fig4C.pdf](extended/singlecell__Ext_Fig4C/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Extended_04C | [s4c.pdf](history_and_missing/bulk__s4c/README.md) | 小提琴图 | 已注释的历史代码 |
| Extended_04D | [Ext_Fig4D.pdf](extended/singlecell__Ext_Fig4D/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Extended_04E | [s4e.pdf](extended/bulk__s4e/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_04F | [Ext_Fig4F_bottom.pdf](extended/singlecell__Ext_Fig4F_bottom/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_04F | [Ext_Fig4F_top.pdf](extended/singlecell__Ext_Fig4F_top/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_04G | [EX_FIG_4G_ephb2_efnb1.pdf](extended/spatial__EX_FIG_4G_ephb2_efnb1/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_04G | [EX_FIG_4G_spatial.pdf](extended/spatial__EX_FIG_4G_spatial/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Extended_05A | [Ext_Fig5A.pdf](extended/singlecell__Ext_Fig5A/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_05B | [Ext_Fig5B.pdf](extended/singlecell__Ext_Fig5B/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Extended_05C | [Ext_Fig5C.pdf](extended/singlecell__Ext_Fig5C/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Extended_05C | [new_entropy.comut4.pdf](history_and_missing/bulk__new_entropy_comut4/README.md) | 小提琴图 | 已注释的历史代码 |
| Extended_05D / Extended_07D | [Ext_Fig5D.pdf](extended/singlecell__Ext_Fig5D/README.md) | 调控子排名图 | 绘图代码，原图未上传 |
| Extended_05E | [Ext_Fig5E.pdf](extended/singlecell__Ext_Fig5E/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_05F | [EX_FIG_5F.pdf](extended/spatial__EX_FIG_5F/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_05G | [s5g.pdf](extended/bulk__s5g/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_05H | [s5hA.pdf](extended/bulk__s5hA/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_05H | [s5hB.pdf](extended/bulk__s5hB/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_05I | [Ext_Fig5I.pdf](extended/singlecell__Ext_Fig5I/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_05J | [Ext_Fig5J_bottom.pdf](extended/singlecell__Ext_Fig5J_bottom/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_05J | [Ext_Fig5J_top.pdf](extended/singlecell__Ext_Fig5J_top/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_06A | [S6A.pdf](extended/singlecell__S6A/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Extended_06B | [s6b.pdf](extended/bulk__s6b/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_06C | [s6c.pdf](extended/bulk__s6c/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_06D | [s6d.pdf](extended/bulk__s6d/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_06E | [s6eA.pdf](extended/bulk__s6eA/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_06E | [s6eB.pdf](extended/bulk__s6eB/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_06F | [s6f.pdf](extended/bulk__s6f/README.md) | 生存曲线 | 绘图代码，原图未上传 |
| Extended_06G | [S6G.pdf](extended/singlecell__S6G/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Extended_06H | [S6H.pdf](extended/singlecell__S6H/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_07A | [S7A.pdf](extended/singlecell__S7A/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_07B | [S7B.pdf](extended/singlecell__S7B/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Extended_07E | [S7E_left.pdf](extended/singlecell__S7E_left/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Extended_07E | [S7E_right.pdf](extended/singlecell__S7E_right/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_07F | [s7f.pdf](extended/bulk__s7f/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_07G | [s7g.pdf](extended/bulk__s7g/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_08B | [Ext_Fig8B_left.pdf](extended/bulk__Ext_Fig8B_left/README.md) | 风险比森林图 | 绘图代码，原图未上传 |
| Extended_08B | [Ext_Fig8B_right.pdf](extended/bulk__Ext_Fig8B_right/README.md) | 风险比森林图 | 绘图代码，原图未上传 |
| Extended_09A | [EX_FIG_9A_mut.pdf](extended/spatial__EX_FIG_9A_mut/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_09A | [EX_FIG_9A_wt.pdf](extended/spatial__EX_FIG_9A_wt/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_09B | [EX_FIG_9B_diff.pdf](extended/spatial__EX_FIG_9B_diff/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_09B | [EX_FIG_9B_mean.pdf](extended/spatial__EX_FIG_9B_mean/README.md) | 热图 | 绘图代码，原图未上传 |
| Extended_09C | [EX_FIG_9C.pdf](extended/spatial__EX_FIG_9C/README.md) | 平滑趋势图 | 绘图代码，原图未上传 |
| Extended_09C / Extended_07C | [S9C_TFH_combined.pdf](extended/singlecell__S9C_TFH_combined/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_09C / Extended_07C | [S9C_validation_cohort.pdf](extended/singlecell__S9C_validation_cohort/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Extended_09D | [s9d.pdf](extended/bulk__s9d/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_01C | [Fig1_overview/Fig1C.pdf](main/singlecell__Fig1C/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Figure_01D | [Fig1_overview/Fig1D.left.pdf](main/singlecell__Fig1D_left/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_01D | [Fig1_overview/Fig1D.right.pdf](main/singlecell__Fig1D_right/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_01E | [Fig1_overview/Fig1E.pdf](main/singlecell__Fig1E/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_01F | [1f.pdf](main/bulk__1f/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_01F | [Fig1_overview/Fig1F.pdf](main/singlecell__Fig1F/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_01G | [FIG_1G_immune.pdf](main/spatial__FIG_1G_immune/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_01G | [FIG_1G_malig.pdf](main/spatial__FIG_1G_malig/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_01G | [FIG_1G_spatial.pdf](main/spatial__FIG_1G_spatial/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Figure_01G | [FIG_1G_spatial_patho.pdf](main/spatial__FIG_1G_spatial_patho/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Figure_01G | [FIG_1G_stromal.pdf](main/spatial__FIG_1G_stromal/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_01H | [FIG_1H_endo.pdf](main/spatial__FIG_1H_endo/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_01H | [FIG_1H_peri.pdf](main/spatial__FIG_1H_peri/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_02A | [Fig2A.pdf](main/singlecell__Fig2A/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_02B | [Fig2B.pdf](main/singlecell__Fig2B/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Figure_02C | [Fig2C.pdf](main/singlecell__Fig2C/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_02D | [2d.pdf](main/bulk__2d/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Figure_02E | [2e.pdf](main/bulk__2e/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_02E | [Fig2E_left.pdf](main/singlecell__Fig2E_left/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_02F | [FIG_2F_ccg2m_gyl.pdf](main/spatial__FIG_2F_ccg2m_gyl/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_02F | [FIG_2F_pemt_hyp.pdf](main/spatial__FIG_2F_pemt_hyp/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_02F | [FIG_2F_spatial.pdf](main/spatial__FIG_2F_spatial/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Figure_02G | [Fig2G.pdf](main/singlecell__Fig2G/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_03B | [3b.pdf](main/bulk__3b/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Figure_03C | [Figure_3C_placeholder](history_and_missing/bulk__Figure_3C_placeholder/README.md) | 绘图流程 | 占位注释，未提供绘图实现 |
| Figure_03F | [Fig3F.pdf](main/singlecell__Fig3F/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_03G | [Fig3G_left.pdf](main/singlecell__Fig3G_left/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_03G | [Fig3G_right.pdf](main/singlecell__Fig3G_right/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_03H | [3h.pdf](main/bulk__3h/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_03H | [Fig3H_left.pdf](main/singlecell__Fig3H_left/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_03I | [Fig3I.pdf](main/singlecell__Fig3I/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_03J | [3j.pdf](main/bulk__3j/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_03K | [3k.pdf](main/bulk__3k/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_03L | [Fig3L.pdf](main/singlecell__Fig3L/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_03M | [Fig3M.pdf](main/singlecell__Fig3M/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Figure_03N | [Fig3N.pdf](main/singlecell__Fig3N/README.md) | 小提琴图 | 绘图代码，原图未上传 |
| Figure_04A | [Fig4A.pdf](main/singlecell__Fig4A/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_04B | [Fig4B.pdf](main/singlecell__Fig4B/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_04C | [Fig4C.pdf](main/singlecell__Fig4C/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Figure_04D | [FIG_4D_sema3a_nrp1  .pdf](main/spatial__FIG_4D_sema3a_nrp1/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_04D | [FIG_4D_spatial.pdf](main/spatial__FIG_4D_spatial/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Figure_04D / Figure_05D | [F4D_enrichment.pdf](main/singlecell__F4D_enrichment/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Figure_04E | [Fig4E.pdf](main/singlecell__Fig4E/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_04F | [Fig4F.pdf](main/singlecell__Fig4F/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_04G | [Fig4G.pdf](main/singlecell__Fig4G/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_04H | [Fig4H.pdf](main/singlecell__Fig4H/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_04I | [FIG_4I_spatial.pdf](main/spatial__FIG_4I_spatial/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Figure_04I | [FIG_4I_tgfb2_tgfbr2.pdf](main/spatial__FIG_4I_tgfb2_tgfbr2/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_05A | [F5_A.pdf](main/singlecell__F5_A/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_05B | [F5_B.pdf](main/singlecell__F5_B/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_05C / Extended_06C | [F5C_S6C.pdf](main/singlecell__F5C_S6C/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_05D | [5d.pdf](main/bulk__5d/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_05D | [F5D_right_SPP1_single_cell_p53_mut_vs_wt.pdf](main/singlecell__F5D_right_SPP1_single_cell_p53_mut_vs_wt/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_05E | [F5E.pdf](main/singlecell__F5E/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_05F | [F5F.pdf](main/singlecell__F5F/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Figure_05G | [F5G.pdf](main/singlecell__F5G/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Figure_05H | [F5H.pdf](main/singlecell__F5H/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_05I | [FIG_5I_spatial.pdf](main/spatial__FIG_5I_spatial/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Figure_05I | [FIG_5I_spp1_cd44.pdf](main/spatial__FIG_5I_spp1_cd44/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_06A | [F6A.pdf](main/singlecell__F6A/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_06B | [F6B.pdf](main/singlecell__F6B/README.md) | 细胞降维/特征图 | 绘图代码，原图未上传 |
| Figure_06C / Extended_07C | [F6C_S7C.pdf](main/singlecell__F6C_S7C/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_06D | [F6D_bar.pdf](main/singlecell__F6D_bar/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Figure_06D | [F6D_dot.pdf](main/singlecell__F6D_dot/README.md) | 气泡/点图 | 绘图代码，原图未上传 |
| Figure_06E | [F6E.pdf](main/singlecell__F6E/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Figure_06F | [Figure_6F_left_interactive](main/singlecell__Figure_6F_left_interactive/README.md) | 箱线图 | 交互式绘图，原代码没有保存命令 |
| Figure_06F | [Figure_6F_right_interactive](main/singlecell__Figure_6F_right_interactive/README.md) | 散点/相关性图 | 交互式绘图，原代码没有保存命令 |
| Figure_06G | [FIG_6G_pvr_tigit.pdf](main/spatial__FIG_6G_pvr_tigit/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_06G | [FIG_6G_spatial.pdf](main/spatial__FIG_6G_spatial/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Figure_06H | [F6H_cycling_cells.pdf](main/singlecell__F6H_cycling_cells/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Figure_06H | [F6H_malignant_cells.pdf](main/singlecell__F6H_malignant_cells/README.md) | 柱状图 | 绘图代码，原图未上传 |
| Figure_07B | [FIG_7B.pdf](main/spatial__FIG_7B/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_07C | [FIG_7C.pdf](main/spatial__FIG_7C/README.md) | 散点/相关性图 | 绘图代码，原图未上传 |
| Figure_07D | [FIG_7D.pdf](main/spatial__FIG_7D/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_07E | [Fig7E_left.pdf](main/bulk__Fig7E_left/README.md) | 风险比森林图 | 绘图代码，原图未上传 |
| Figure_07E | [Fig7E_right.pdf](main/bulk__Fig7E_right/README.md) | 风险比森林图 | 绘图代码，原图未上传 |
| Figure_08A | [FIG_8A_diff.pdf](main/spatial__FIG_8A_diff/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_08A | [FIG_8A_mean.pdf](main/spatial__FIG_8A_mean/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_08B | [FIG_8B_end_cancer.pdf](main/spatial__FIG_8B_end_cancer/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_08B | [FIG_8B_end_mye.pdf](main/spatial__FIG_8B_end_mye/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_08B | [FIG_8B_endo_mes.pdf](main/spatial__FIG_8B_endo_mes/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_08C | [FIG_8C.pdf](main/spatial__FIG_8C/README.md) | 热图 | 绘图代码，原图未上传 |
| Figure_08D | [FIG_8D.pdf](main/spatial__FIG_8D/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| Figure_08E | [FIG_8E_endo_nmf.pdf](main/spatial__FIG_8E_endo_nmf/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_08E | [FIG_8E_hallmarkemt_nmf.pdf](main/spatial__FIG_8E_hallmarkemt_nmf/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_08E | [FIG_8E_hallmarkhypoxia_nmf.pdf](main/spatial__FIG_8E_hallmarkhypoxia_nmf/README.md) | 箱线图 | 绘图代码，原图未上传 |
| Figure_08G | [FIG_8G.pdf](main/spatial__FIG_8G/README.md) | 箱线图 | 绘图代码，原图未上传 |
| 未指定 | [smoking.pack_years.pdf](other/bulk__smoking_pack_years/README.md) | 箱线图 | 绘图代码，原图未上传 |
| 未指定 | [BW09_D_cnv_score.pdf](other/spatial__BW09_D_cnv_score/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [BW11_C_cnv_score.pdf](other/spatial__BW11_C_cnv_score/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [BW14_B_cnv_score.pdf](other/spatial__BW14_B_cnv_score/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [MGH1174_C_cnv_score.pdf](other/spatial__MGH1174_C_cnv_score/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [MGH1174_D_cnv_score.pdf](other/spatial__MGH1174_D_cnv_score/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_01.pdf](other/spatial__spatial_features_sample_01/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_02.pdf](other/spatial__spatial_features_sample_02/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_03.pdf](other/spatial__spatial_features_sample_03/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_04.pdf](other/spatial__spatial_features_sample_04/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_05.pdf](other/spatial__spatial_features_sample_05/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_06.pdf](other/spatial__spatial_features_sample_06/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_07.pdf](other/spatial__spatial_features_sample_07/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_08.pdf](other/spatial__spatial_features_sample_08/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_09.pdf](other/spatial__spatial_features_sample_09/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_10.pdf](other/spatial__spatial_features_sample_10/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_11.pdf](other/spatial__spatial_features_sample_11/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_12.pdf](other/spatial__spatial_features_sample_12/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_13.pdf](other/spatial__spatial_features_sample_13/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |
| 未指定 | [spatial_features_sample_14.pdf](other/spatial__spatial_features_sample_14/README.md) | 空间特征/病理分布图 | 绘图代码，原图未上传 |

重新生成：从仓库根目录运行 `python tools/build_figure_catalog.py`。校验所有生成文件及源代码一致性：`python tools/build_figure_catalog.py --check`。仅使用 Python 标准库。
