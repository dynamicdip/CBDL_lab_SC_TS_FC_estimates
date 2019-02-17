#!/bin/bash
#SBATCH -A research
##SBATCH --nodelist=gnode19
#SBATCH --job-name=run_SC                     # Job name
#SBATCH --time=2-00:00:00                   # Time limit hrs:min:sec
#SBATCH --qos=medium                        # medium
#SBATCH --partition=long                    # Mention partition-name. default
#SBATCH --output=out_SC.txt                  # Output file.
#SBATCH --gres=gpu:2                        # N number of GPU devices.
#SBATCH --mail-type=ALL                     # Enable email
##SBATCH --mail-user=joyneelmisra@gmail.com  # Where to send mail
#SBATCH --mem=100G                           # Enter memory, default is 100M.

module add cuda/9.1
#module add cudnn/5.1-cuda-8.0

source /opt/fsl.sh

nsamples=5000;

#for i in `cat ${1}`;
#    do
# bash script_data_SC_FSL.sh "$i";
bash yeo_gen_SC.sh "${1}" "$nsamples"
#done;
