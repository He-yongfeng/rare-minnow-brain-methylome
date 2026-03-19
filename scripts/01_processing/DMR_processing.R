# ==========================
# 0. Libraries
# ==========================
library(dplyr)
library(data.table)

# ==========================
# 1. Paths
# ==========================
# 输入（processed data）
dmr_file <- file.path(data_processed_dir,
                      "DMR_full_results.tsv")

# 输出（analysis层）
output_dir <- file.path(results_analysis_dir, "DMR")
dir_create_safe(output_dir)

cat("Running DMR processing...\n")

# ==========================
# 2. Load data
# ==========================
dmr_all <- fread(dmr_file)

# ==========================
# 3. DMR Type
# ==========================
dmr_all$Type <- ifelse(
  dmr_all$methyl_diff > 0,
  "Hypermethylated",
  "Hypomethylated"
)

# ==========================
# 4. Length
# ==========================
dmr_all$Length <- dmr_all$end - dmr_all$start

# ==========================
# 5. Count summary
# ==========================
dmr_count <- dmr_all %>%
  group_by(Comparison, Type) %>%
  summarise(Number = n(), .groups="drop")

# ==========================
# 6. Length table
# ==========================
length_table <- dmr_all %>%
  select(Comparison, chr, start, end, Length, Type, methyl_diff)

# ==========================
# 7. Save outputs
# ==========================
fwrite(
  dmr_count,
  file.path(output_dir, "DMR_summary.tsv"),
  sep = "\t"
)

fwrite(
  length_table,
  file.path(output_dir, "DMR_length_table.tsv"),
  sep = "\t"
)

cat("DMR processing completed.\n")
