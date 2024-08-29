# Seurat_pipeline

Pipeline containing multiple R scripts, labeled with number first, then function name. 
Same for saving RDS files and images, number output corresponding with the script.

To load pipeline enter in console, not terminal! Due to dependency issue console R.4.3.3. - terminal 4.1.2
source("~/Splicing_mouse/scripts/In Progress/Seurat_pipeline/run_pipeline.R")

Output are saved under ~/Splicing_mouse/data
   - /plots
   - /raw_data
   - /rds_files

## Data
Accession number: [GSE176588](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM5369519)

## Pipeline:

- 1 Load packages
Containing all packages and setup for pipeline

- 2 Load data
Loading the data into a RDS

- 3 Create seurat object
Rendering loaded data RDS into a Seurat object

- 4 Data quality
QC metrics for genes, RNA molecules and mitochondrial percentage
Scatterplots and featureplots with pearson correlations, violinplots for average standard deviation.


- 5 Normalize data
Data normalization with LogNormalize, scalefactor 10.000 
Features cutoff >2000, <12000, 5% MT

- 6 Variable Features
Finding variable features, 2000 features included
top 10 genes, plotted

- 7 Scaling data
Preprocessing step for PCA analysis

Note!Restarting server is advisable before running PCA analysis!

- 8 PCA analysis

- 9 UMAP
Visualisation umap & PCA with dimension reduction set to PCA

- 10 Individual Cluster analysis
Visualisation and identification of genes in subset clusters

## In progress
-  Working on a functional script to load pipeline in console/terminal without dependicy issues
-  Working on a version of script 10 Individual Cluster Analysis as loop for full analysis of all clusters instead one at a time

