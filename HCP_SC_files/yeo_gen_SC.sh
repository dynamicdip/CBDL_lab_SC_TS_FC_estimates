# probabilistic tractography function
probtrack_func ()
{
probtrackx2_gpu --samples=Diffusion.bedpostX/merged \
--mask=Diffusion.bedpostX/nodif_brain_mask --seed=/home/govinda_s/hcp_data_codes/yeo_seeds_100.txt \
--xfm=xfms/standard2acpc_dc --invxfm=xfms/acpc_dc2standard \
--seedref=T1w_restore.2.nii.gz --loopcheck --forcedir --network --omatrix1 \
--nsamples="$1" -V 1 --dir=Network
}

###### main code begins ######
nsmpl="$2"
cd ~/hcp_data_codes

for i in `cat ~/hcp_data_codes/batch_100_unrelated/batch"$1".txt`;
do
# download the files
bash script_data_SC_FSL.sh "$i"
# go to the directory
cd /scratch/`whoami`/"$i"
# probability tractography
probtrack_func "$nsmpl"
cp ./Network/fdt_network_matrix ~/HCP/SC_yeo_100/"$i"_"$nsmpl".sc
# go back 
cd ~/hcp_data_codes
done
