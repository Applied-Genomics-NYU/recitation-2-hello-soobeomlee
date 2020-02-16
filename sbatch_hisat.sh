#!/bin/bash

#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=2:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=MYJOB
#SBATCH --output=slurm_%j.out

module load hisat2/intel/2.0.5

cd /scratch/sl7424/class_AG/hw2/homework02/
hisat2-build Arabidopsis.fa Arabidopsis_index

for read in /scratch/sl7424/class_AG/hw2/homework02/*_1.fastq
do	
	hisat2 -p 8 -x Arabidopsis_index -1 $read -2 ${read::-7}2.fastq -S ${read::-7}Arabidopsis_HiSAT.sam


done

