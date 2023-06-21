## DRAFT ASSEMBLY

samples="61-2 62-1 74-2 82-1 82-2 82-3 82-6 83-1 83-4 101-8 104-2 RM5-5"

for i in $samples
do
  # canu draft assembly with nanopore reads only 
  genomesize="840000"
  canu \
  -p ${i} -d ${i}-canu \
  genomeSize=$genomesize maxInputCoverage=100 \
  -nanopore ${i}_merged_chopped_filtered.fastq

  ## CIRCULARIZATION additional step

  # circularize contigs from canu draft assembly long reads only
  circlator all --merge_min_id 85 --merge_breaklen 1000 --b2r_length_cutoff 30000 assemblies/${i}/assembly/assembly_contigs.fasta ${i}_merged_chopped_filtered.fastq circlator/${i}_circlator

  ## POLISHING

  # illumina polishing
  # indexing the draft nanopore assembly
  bwa index circlator/${i}_circlator/06.fixstart.fasta
  # bwa mem algorithm for mapping illumina reads vs the draft nanopore assembly
  bwa mem circlator/${i}_circlator/06.fixstart.fasta ${i}_1_illumina.fq ${i}_2_illumina.fq > ${i}_aln.sam
  # samtools view to convert sam to bam format
  samtools view -S -b ${i}_aln.sam > ${i}_aln.bam
  # samtools sort to sort the bam file
  samtools sort ${i}_aln.bam -o ${i}_aln-sorted.bam
  # samtools index to index the sorted bam file
  samtools index ${i}_aln-sorted.bam
  # pilon to polish the draft assembly from nanopore with illumina reads (--genome arg used for the draft nanopore assembly;
  # --fragss arg used for paired--end illumina reads <1000bp)
  pilon --genome circlator/${i}_circlator/06.fixstart.fasta --frags ${i}_aln-sorted.bam --output ${i}-pilon --outdir pilon

  ## GENOME QUALITY ASSESSMENT
  # Tools : Quast or BUSCO
  quast="/home/joaquin/quast-5.2.0"
  $quast/./quast.py pilon/${i}-pilon.fasta -r refgen/mycoplasmahub1.fasta -o results/${i}_quast
done
