# =========================================================
# Master script for full reproducibility
# =========================================================

cat("Starting WGBS methylation analysis pipeline...\n")

# -----------------------------
# 1. Load setup
# -----------------------------
cat("Loading environment setup...\n")
source(file.path("scripts", "00_setup.R"))

# -----------------------------
# 2. Check required files
# -----------------------------
cat("Checking input files...\n")

required_files <- c(
  file.path(data_processed_dir, "PCA_top10000_methylation_matrix_CG.tsv"),
  file.path(data_processed_dir, "PCA_top10000_methylation_matrix_CHG.tsv"),
  file.path(data_processed_dir, "PCA_top10000_methylation_matrix_CHH.tsv"),
  file.path(data_processed_dir, "DMR_full_results.tsv"),
  file.path(data_processed_dir, "feature_methylation_matrix.tsv"),
  file.path(data_processed_dir, "chromosome_methylation_summary.tsv")
)

check_files_exist(required_files)

# -----------------------------
# 3. Run analysis
# -----------------------------

cat("\nRunning PCA analysis...\n")
source(file.path("scripts", "02_analysis", "PCA_analysis.R"))

cat("\nRunning DMR processing...\n")
source(file.path("scripts", "01_processing", "DMR_processing.R"))

# -----------------------------
# 4. Generate figures
# -----------------------------

cat("\nGenerating Figure 1...\n")
source(file.path("scripts", "03_figures", "plot_Figure1.R"))

cat("\nGenerating Figure 2...\n")
source(file.path("scripts", "03_figures", "plot_Figure2.R"))

cat("\nGenerating Figure 3...\n")
source(file.path("scripts", "03_figures", "plot_Figure3.R"))

cat("\nGenerating Figure 4...\n")
source(file.path("scripts", "03_figures", "plot_Figure4.R"))

# -----------------------------
# 5. Save session info
# -----------------------------
cat("\nSaving session information...\n")

env_dir <- file.path(results_dir, "env")
dir_create_safe(env_dir)

writeLines(
  capture.output(sessionInfo()),
  file.path(env_dir, "sessionInfo.txt")
)

cat("\nPipeline completed successfully.\n")
