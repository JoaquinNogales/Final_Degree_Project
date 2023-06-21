## Protein threshold

samples="61-2 62-1 74-2 82-1 82-2 82-3 82-6 83-1 83-4 101-8 104-2 RM5-5 HUB1"

for i in $samples
do
    # use seqkit to pick up proteins of size 150 aa min and remove gaps from the fasta file
    seqkit seq -m 150 --remove-gaps ${i}_proteins.fa > ${i}_proteins_clean.fasta
    # use sed to remove the last character of each protein sequence (not aa, the end of protein marker)
    sed 's/\_$//' ${i}_proteins_clean.fasta > ${i}_proteins_clean_def.fasta
done
