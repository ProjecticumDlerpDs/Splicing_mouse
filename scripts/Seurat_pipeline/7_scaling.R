# 7
# Scaling all genes, preprocessing PCA

seurat <- readRDS(here("data/rds_files/6_seurat_variable_features.rds"))

all.genes <- rownames(seurat)
seurat <- ScaleData(seurat, features = all.genes)

# Save the Seurat object
saveRDS(seurat, here("data/rds_files/7_seurat_scaled.rds"))



# Clear environment
rm(seurat, all.genes)
gc()
