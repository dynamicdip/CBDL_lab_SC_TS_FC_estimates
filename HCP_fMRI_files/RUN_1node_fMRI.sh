#!/bin/bash
#SBATCH -A cvit
#SBATCH -N 1
#SBATCH --exclusive
#SBATCH -p long
#SBATCH --mem=60g
#SBATCH -t 3-00:00:00
#SBATCH -o logs/slurm-%A_%a.out
#SBATCH --mail-type=END
#SBATCH --mail-user=<EMAIL_ID>


module load mrtrix/3.0
module load freesurfer/6.0.0
source /global/fsl.sh

# Run code as 
#
# $ sbatch RUN_1node_fMRI.sh subjects.txt
#
# where subjects.txt is a list of HCP-subject-ids
#
# <parc> : Yeo_100, Yeo_200, Desikan-Kiliany, etc.
# <fMRI> : WM_LR, REST1_LR, etc.

for subj_id in `cat ${1}`; do

	bash gen_fMRI.sh "$subj_id" <parc> <fMRI>

done
