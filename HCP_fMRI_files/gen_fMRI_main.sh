# get subject id
subj_id="$1"
parc="$2"
fMRI="$3"

# collect files from aws server
bash ~/<working_dir>/script_data_fMRI.sh "$subjid"

# go to the folder
cd /scratch/`whoami`/"$subj_id"/

# generate ROIs' BOLD timeseries
bash ~/<working_dir>/gen_fMRI_command.sh "$fMRI" "$parc"

# copy files to HCP data folder in home directory
cp /scratch/`whoami`/"$subj_id"/TS_"$fMRI"/meants_"$fMRI".txt ~/<data_storage>/"$fMRI"/"$subjid"_"parc".ts

# come back!
cd ~/<working_dir>/

wait