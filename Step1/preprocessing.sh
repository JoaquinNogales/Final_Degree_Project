## Data Preprocessing

samples="61-2 62-1 74-2 82-1 82-2 82-3 82-6 83-1 83-4 101-8 104-2 RM5-5"

for i in $samples
do
    # (if needed) merge demultiplexed files
    #gunzip -c *.gz | cat *.fastq > ${i}_nanopore.fastq
    # trim adapters/barcodes
    porechop -i ${i}_nanopore.fastq > ${i}_trimmed.fastq
    # filter by quality and min read length
    NanoFilt -q 10 -l 1000 ${i}_trimmed.fastq > ${i}_trimmed_filtered.fastq
done
