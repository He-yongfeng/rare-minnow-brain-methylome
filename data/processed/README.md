## Processed data

This directory contains all processed datasets required to reproduce the analyses and figures presented in this repository.

---

## Data source

All datasets are publicly available from Figshare:

DOI: https://doi.org/10.6084/m9.figshare.31769062

The Figshare repository provides files in a flat structure (no subdirectories).  
After downloading, all files should be placed into this directory:

data/processed/

Ensure that original file names are preserved, as analysis scripts rely on fixed file paths.

---

## Data description

The datasets include both primary analysis outputs and derived summary tables:

### PCA input data
- PCA_top10000_methylation_matrix_CG.tsv  
- PCA_top10000_methylation_matrix_CHG.tsv  
- PCA_top10000_methylation_matrix_CHH.tsv  

### Global methylation
- global_methylation_summary.tsv  

### Feature-level methylation
- feature_methylation_summary.tsv  
- feature_methylation_matrix.tsv  

### Chromosome-level methylation
- chromosome_methylation_summary.tsv  
- chromosome_methylation_matrix.tsv  

### DMR analysis
- DMR_full_results.tsv                (primary output from DMR calling)  
- DMR_feature_summary.tsv  
- DMR_gene_list.tsv  

---

## Derived data

The following files are not included in the Figshare repository and are generated during analysis:

- DMR_summary.tsv (generated from DMR_full_results.tsv using scripts/01_processing/DMR_processing.R)

---

## Notes

- Do not modify file names, as scripts rely on fixed paths.  
- These datasets are not included in the GitHub repository due to size constraints.  
- Derived datasets (e.g., summary tables) can be regenerated using the provided scripts.  
