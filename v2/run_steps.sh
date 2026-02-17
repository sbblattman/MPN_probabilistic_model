#!/bin/bash
#SBATCH --job-name=scvi
#SBATCH --partition=peerd
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=50G
#SBATCH --array=0-0
#SBATCH --output=scvi_%j.out

#!/bin/bash

# Script to run notebooks sequentially with parameters
# Usage: ./run_notebooks.sh [SAMPLE_ID] [BATCH_SIZE]

source /data1/lareauc/users/blattms/miniconda3/etc/profile.d/conda.sh
conda activate gapfill_utilities


echo "Starting notebook execution sequence..."
set -e  # Exit on any error

# List of notebooks to run in order

# rm -r likelihood_tables_*
# rm -r unexpected_gapfill_likelihoods_*
# papermill "step1_2_pcr_swap_and_gapfill_frequencies.ipynb" "step1_2_pcr_swap_and_gapfill_frequencies.ipynb" --kernel python3 --progress-bar

# papermill "step3_define_feature_sets.ipynb" "step3_define_feature_sets.ipynb" --kernel python3 --progress-bar

# papermill "step4_save_gapfill_likelihoods_in_feature_set.ipynb" "step4_save_gapfill_likelihoods_in_feature_set.ipynb" --kernel python3 --progress-bar
# papermill "step5_get_cell_probabilities.ipynb" "step5_get_cell_probabilities.ipynb" --kernel python3 --progress-bar

conda activate mrvi-env
cd ../..
# papermill "20250721_mrvi_non_heterozygous_JAK2.ipynb" "20250721_mrvi_non_heterozygous_JAK2.ipynb" --kernel python3 --progress-bar
# papermill "20250726_save_mrvi_objects.ipynb" "20250726_save_mrvi_objects.ipynb" --kernel python3 --progress-bar
papermill "scvi_integration_genotyped.ipynb" "scvi_integration_genotyped.ipynb" --kernel python3 --progress-bar
