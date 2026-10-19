


### S6H ####
Idents(myeloid) <- "subtype"
Idents (myeloid) = factor (Idents(myeloid), levels = rev(c(
  'TAM.FABP4',
  'DC2',
  'TAM.CXCL',
  'Mreg.DC',
  'Myeloid.cycling',
  'DC3',
  'DC1',
  'CD16.Mono',
  'Mono-Mac',
  'TAM.SPP1',
  'CD14.Mono',
  'TAM.AZU1',
  'TAM.FOLR2',
  'TAM.APOE',
  'Mast',
  'Plasmacytoid.DC')))

#myeloid <- FindVariableFeatures(myeloid)

mye_markers = ('SPP1
CCL17
PSAP
SEMA4D
P2RY6
TGFBR2
LGALS9
VEGFB
TGFBR1
NRP2
NRP1
CD86
CXCL11
SIGLEC10
VEGFA
TNFSF13B
FPR3
TNFRSF14
ANXA1
FLT1
TNFSF10
CXCL10
MIF
CCL5'
)

mye_markers = unlist(strsplit(mye_markers,'\n'))
DefaultAssay (myeloid) = 'RNA'
myeloid <- ScaleData(myeloid, features = c(VariableFeatures(myeloid),mye_markers)) # add genes of interest to the heatmap

pdf(file.path(figures.dir, 'S6H.pdf'), useDingbats = F, width = 10, height = 6)
 dp= DotPlot(object = myeloid, features = mye_markers, scale = T) +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
    #scale_color_gradientn(colours = rev(brewer.pal(11,"Spectral"))) +
      scale_colour_gradient2(low = "navy", high = "firebrick") +
    geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
    dp
dev.off()
