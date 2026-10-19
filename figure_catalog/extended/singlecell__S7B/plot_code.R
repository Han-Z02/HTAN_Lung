

#### S7B ####            
bcell = bcell [, !bcell$subtype %in% c('Mast','Plasmacytoid.DC')]

pdf (file.path (figures.dir,'S7B.pdf'))
dp = DimPlot (bcell, group.by = 'subtype')
dp
dev.off()
