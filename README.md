
# Alternative Splicing in Embryonic Mouse Cells

Goal is to write a pipeline that can detect different types of RNA withing dataset E8.5 clusters for the determination of alternative splicing.

## Phase 1 Data inspection & preprocessing with Seurat
Script [Seurat_clusters.rmd](https://github.com/ProjecticumDlerpDs/Splicing_mouse/blob/main/scripts/Seurat_clusters.Rmd)

- Load data & objectify
- Data inspection
- Normalization
- Scaling
- Principal component analysis
- UMAP cluster visualisation
- Optimalisation script

## Phase 2 Transcriptome identification & Quantification with Whippet
Fase 2 not reached yet



## Data
 
Datasets are stored withing the Rstudio Server "/home/data/projecticum/splicing/data"

## Analysis

Pipeline and analysis with the following packages

- [@satijalab/seurat](https://github.com/satijalab/seurat)
- [@timbitz/Whippet.jl](https://github.com/timbitz/Whippet.jl)


## Author

Selina Dreesman [@Refelicus](https://www.github.com/Refelicus)


## Extra information
Data origins 

- Article: High-throughput total RNA sequencing in single cells using VASA-seq (https://doi.org/10.1101/2021.09.15.460240)
- Github:  [@hemberg-lab/VASAseq_2022](https://github.com/hemberg-lab/VASAseq_2022)



## Version

R version 4.3.3 (2024-02-29) -- "Angel Food Cake"
Copyright (C) 2024 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)