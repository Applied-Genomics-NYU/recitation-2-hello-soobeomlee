#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=2:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=MYJOB
#SBATCH --output=slurm_%j.out

module load salmon/1.0.0

cd /scratch/sl7424/class_AG/hw2/homework02/

salmon index -t athal.fa.gz -i athal_index

for read in /scratch/sl7424/class_AG/hw2/homework02/*_1.fastq
do
  	salmon quant -i athal_index -l A -1 $read -2 ${read::-7}2.fastq -p 8 --validateMappings -o quants/${read::-8}


done
