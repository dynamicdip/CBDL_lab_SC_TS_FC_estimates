function checkfile {
    command=`aws s3 ls s3://"$1" | wc -l`
    echo "$command"
}

function download {
    ret=$(checkfile "$2")
    if [ $ret -gt 0 ]
    then
        if [ -z "$3" ]
        then
            aws s3 cp s3://"$2" /scratch/`whoami`/"$1"/ 
        else
            aws s3 cp s3://"$2" /scratch/`whoami`/"$1"/ "$3"
        fi
    else
        echo "not found"    
    fi
}

subject="$1"
echo "$subject"

pth="/scratch/`whoami`"
mkdir -p "$pth"/"$subject"
recur="--recursive"
q=""
mkdir -p "$pth"/"$subject"/Diffusion.bedpostX
mkdir -p "$pth"/"$subject"/xfms

download "$subject"/Diffusion.bedpostX hcp-openaccess/HCP_1200/"$subject"/T1w/Diffusion.bedpostX/ "$recur"
download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/aparc+aseg.nii.gz ""
download "$subject"/xfms hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/xfms/ "$recur"
download "$subject" hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/T1w_restore.2.nii.gz ""
# /scratch/`whoami`/"$subject"/
