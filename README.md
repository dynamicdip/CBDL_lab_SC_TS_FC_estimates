# HCP_SC_TS_FC
The scripts download the necessary files from AWS buckets of human connectome project and generate Structural Connectivity (SC), Time Series (TS) and Functional Connectivity (FC) files.

## Structural connectivity generation
The 100 unrelated subject ID's have been divided into 17 batches each consisting of 6 subject ID's.
Running the following command in the terminal will process first batch of subjects:
`sbatch RUN_SC.sh 1`.
The above command needs to be run 17 times. 

Please note that the user has to use his/her own parcellation files, these are not included in the repository.
