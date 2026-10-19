


### S6A ####
meta_df = table (data.frame (sample = myeloid$orig.identSec, subtype = myeloid$subtype))
meta_df = as.data.frame (prop.table (meta_df, 1))
meta_df$sample = factor(meta_df$sample, levels = c(
  '14',
  '1174',
  '1176',
  '1183',
  'BW01',
  'BW04',
  'BW05',
  'BW09',
  'BW19',
  'BW23',
  '1172',
  '1173',
  '1175',
  '1182',
  'BW16',
  'BW11',
  'BW14',
  'BW06',
  '19',
  '1181',
  '1179',
  '1170',
  '17'))

bp = ggplot (meta_df, aes (x = sample, y = Freq, fill = subtype)) + 
  geom_bar (position = 'stack', stat = 'identity', color='black') +
  theme(
      axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
      axis.line =element_line(colour = 'black', size = .1),
        axis.ticks = element_line(colour = "black", size = .1),
      panel.background = element_blank()#,
    #panel.border = element_blank(),
    #panel.grid.major = element_blank(),
    #panel.grid.minor = element_blank()
  )

pdf (file.path (figures.dir,'S6A.pdf'), height=4)
bp
dev.off()
