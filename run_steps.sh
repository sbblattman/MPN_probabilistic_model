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

# rm -r part1/likelihood_tables
# rm -r part2/likelihood_tables
# rm -r part1/unexpected_gapfill_likelihoods
# rm -r part2/unexpected_gapfill_likelihoods

echo "Starting notebook execution sequence..."
set -e  # Exit on any error

# List of notebooks to run in order

cd part1
# papermill "step1_save_pcr_swap_likelihoods.ipynb" "step1_save_pcr_swap_likelihoods.ipynb" --kernel python3 --progress-bar
# papermill "step2_save_gapfill_frequencies_for_feature_set.ipynb" "step2_save_gapfill_frequencies_for_feature_set.ipynb" --kernel python3 --progress-bar
# papermill "step3_define_feature_sets.ipynb" "step3_define_feature_sets.ipynb" --kernel python3 --progress-bar

# cd ../part2
# papermill "step1_save_pcr_swap_likelihoods.ipynb" "step1_save_pcr_swap_likelihoods.ipynb" --kernel python3 --progress-bar
# papermill "step2_save_gapfill_frequencies_for_feature_set.ipynb" "step2_save_gapfill_frequencies_for_feature_set.ipynb" --kernel python3 --progress-bar
# papermill "step3_define_feature_sets.ipynb" "step3_define_feature_sets.ipynb" --kernel python3 --progress-bar

# cd ../part1
# papermill "step4_save_gapfill_likelihoods_in_feature_set.ipynb" "step4_save_gapfill_likelihoods_in_feature_set.ipynb" --kernel python3 --progress-bar
# cd ../part2
# papermill "step4_save_gapfill_likelihoods_in_feature_set.ipynb" "step4_save_gapfill_likelihoods_in_feature_set.ipynb" --kernel python3 --progress-bar

# cd ../part1
# papermill "step5_get_cell_probabilities.ipynb" "step5_get_cell_probabilities.ipynb" --kernel python3 --progress-bar
cd ../part2
# papermill "step5_get_cell_probabilities.ipynb" "step5_get_cell_probabilities.ipynb" --kernel python3 --progress-bar

cd ../..
conda activate mrvi-env
papermill "scvi_integration_genotyped.ipynb" "scvi_integration_genotyped.ipynb" --kernel python3 --progress-bar
