#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=2:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=MYJOB
#SBATCH --output=slurm_%j.out

module load samtools/intel/1.9

cd /scratch/sl7424/class_AG/hw2/homework02/

for read in /scratch/sl7424/class_AG/hw2/homework02/*.sam
do
  	samtools view -bS $read > ${read::-3}bam


done



