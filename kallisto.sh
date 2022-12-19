#!/bin/sh
#Data for quantification was downloaded from:
#https://useast.ensembl.org/info/data/ftp/index.html

# sbatch --mem=60GB --time=30:0:0  --nodes=1  kallisto.sh ../UC21-730/RNA/UC21_730_L001_L002_R1.fastq.gz ../UC21-730/RNA/UC21_730_L001_L002_R2.fastq.gz UC21-730 
#to run 
#module load kallisto/0.46.2 
#kallisto index -i transcripts.idx Homo_sapiens.GRCh38.cdna.all.fa.gz
kallisto quant -i transcripts.idx  -b 100   --plaintext  -o $3  $1 $2

