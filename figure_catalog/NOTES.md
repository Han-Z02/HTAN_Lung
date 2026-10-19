# 图号与复现说明

- [Ext_Fig5D.pdf](extended/singlecell__Ext_Fig5D/README.md)：图号冲突：文件名和输出名为 Extended 5D，代码内部注释为 Extended 7D。
- [S9C_TFH_combined.pdf](extended/singlecell__S9C_TFH_combined/README.md)：图号冲突：输出名是 S9C，但位于 S7C_continue 章节。可同时在 Extended 7C / 9C 下查找，最终论文归属待核对。
- [S9C_validation_cohort.pdf](extended/singlecell__S9C_validation_cohort/README.md)：图号冲突：输出名是 S9C，但位于 S7C_continue 章节。可同时在 Extended 7C / 9C 下查找，最终论文归属待核对。
- [F4D_enrichment.pdf](main/singlecell__F4D_enrichment/README.md)：图号冲突：章节注释为 F5D pathway enrichment，输出文件却为 F4D_enrichment.pdf。保留两者，未擅自更正。

- bulk boxplots.R 将输出 3a.pdf、3d.pdf、3e.pdf 标为 EXTENDED FIG 3A/D/E；依明确章节注释归入 Extended Data。
- all_spatial_plots.R 的 Fig 3D/3I/4I/5G 为原注释中的关联图号；缺少论文原图，未将运行时未知样本强行映射到最终图版。
- survival.R 的开头总注释与下方输出编号存在历史差异；本目录以具体保存名和邻近章节为索引。
- 同一论文子图可由 singlecell / bulk / spatial 多脚本贡献；同号的不同输出保留各自文件夹，避免覆盖。
- `FIG_4D_sema3a_nrp1  .pdf` 的原输出名有两个空格，metadata.json 保留原样，目录名作了规范化。
- source_original 副本保持原文件字节一致。片段并非依赖闭包，不宣称可单独执行；本次没有修复原分析脚本，也没有校验原统计结论。
- 本目录只覆盖指定提交中的代码与资产；原仓库未提供的示意图、实验照片、整版论文图或补充图无法从代码推得。
