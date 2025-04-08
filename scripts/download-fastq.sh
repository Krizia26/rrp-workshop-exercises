#!/bin/bash

#Set Options
set -euo pipefail

#Run from the directory where this file live

cd "$(dirname "${BASH_SOURCE[0]}")"

#Set up variable
STUDY_ID="SRP255885"
RUN_ID=SRR11518889
FASTQ_R1="${RUN_ID}_1.fastq.gz"
FASTQ_R2="${RUN_ID}_2.fastq.gz"
FASTQ_URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/${RUN_ID}"
FASTQ_DEST="../data/raw/fastq/${STUDY_ID}"

#create directory to hold the FASTQ files from this project 
mkdir -p $FASTQ_DEST

# Download the R1 file

curl -O $FASTQ_URL/$FASTQ_R1
#Move file to destination directory
mv $FASTQ_R1 $FASTQ_DEST

#Count the lines in the R2 file


# Print an indicator:
echo "the numnber of lines in the $FASTQ_R1 is:"

# Curl the file (using one of several approaches)
curl -O $FASTQ_URL/$FASTQ_R2 # this approach preserves the original internet file name

# Move the file to its destination directory
mv $FASTQ_R2 $FASTQ_DEST

# Explore: how many lines are in the file?
echo "The number of lines in $FASTQ_R2 is:"
gunzip -c $FASTQ_DEST/$FASTQ_R2 | wc -l