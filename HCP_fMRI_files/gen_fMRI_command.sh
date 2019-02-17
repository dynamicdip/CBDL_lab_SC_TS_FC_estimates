fMRI="$1" # WM_LR, REST1_LR, etc.
parc="$2" # Yeo_100, Yeo_200, Desikan-Kiliany, etc.

# make folders
mkdir -p TS_"$fMRI"

# get ts for yeo rois
fslmeants -i tfMRI_"$1".nii.gz -o TS_"$fMRI"/meants_"$fMRI".txt --label ~/<path_to_parcellation>/"$parc".nii 

wait