function checkfile {
    command=`aws s3 ls s3://"$1" | wc -l`
    echo "$command"
}

function download {
    ret=$(checkfile "$2")
    if [ $ret -gt 0 ]
    then 
        aws s3 cp s3://"$2" "$DIR"/"$1"/
        #aws s3 cp s3://"$2" "$DIR"/"$1".txt
    else
        echo "not found"    
    fi
}

subject="$1"
echo "$subject"
DIR="/scratch/`whoami`" # change the directory
mkdir -p "$DIR"/"$subjid"

#DIR="/scratch/`whoami`/movement_regressors_RL" # change the directory
#mkdir -p "$DIR"/

# Desikan Killiany Atlas
#download "$subject" hcp-openaccess-temp/HCP_1200/"$subject"/MNINonLinear/aparc+aseg.nii.gz

# HCP REST
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/rfMRI_REST1_LR/rfMRI_REST1_LR_hp2000_clean.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/rfMRI_REST1_RL/rfMRI_REST1_RL_hp2000_clean.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/rfMRI_REST2_LR/rfMRI_REST2_LR_hp2000_clean.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/rfMRI_REST2_RL/rfMRI_REST2_RL_hp2000_clean.nii.gz

# HCP EMOTION
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_LR/tfMRI_EMOTION_LR.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_RL/tfMRI_EMOTION_RL.nii.gz

# HCP GAMBLING
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_LR/tfMRI_GAMBLING_LR.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_RL/tfMRI_GAMBLING_RL.nii.gz

# HCP LANGUAGE
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_LR/tfMRI_LANGUAGE_LR.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_RL/tfMRI_LANGUAGE_RL.nii.gz

# HCP MOTOR
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_LR/tfMRI_MOTOR_LR.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_RL/tfMRI_MOTOR_RL.nii.gz

# HCP RELATIONAL
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_LR/tfMRI_RELATIONAL_LR.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_RL/tfMRI_RELATIONAL_RL.nii.gz

# HCP SOCIAL
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_LR/tfMRI_SOCIAL_LR.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_EMOTION_RL/tfMRI_SOCIAL_RL.nii.gz 

# HCP WM
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_WM_LR/tfMRI_WM_LR.nii.gz
#download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/Results/tfMRI_WM_RL/tfMRI_WM_RL.nii.gz