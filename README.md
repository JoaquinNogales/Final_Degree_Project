# Final_Degree_Project
Pipeline for the genome analysis of *Mycoplasma hyorhinis* strains isolated from healthy or diseased piglets

This repository has the scripts that were used and created for the Final Degree Project at CReSA in the Endemic respiratory diseases of swine and antimicrobial resistances group.

Several strains of M. hyorhinis were isolated from different farms and animals in order to have a representation of isolates from different origins. Swabs either from nasal swabs from healthy animals (N=4, healthy group) or from lesions coming from necropsied animals diagnosed with M. hyorhinis associated disease (N=8, diseased group) were sequenced using ONT and Illumina.

The complete pipeline for the genome analysis of these strains has the following steps:

Step 1. Data preprocessing ; tools used: FastQC, Porechop, NanoFilt
- Merge demultiplexed files
- Barcodes trimming
- Quality and length filtering

Step 2. Genome assembly ; tools used: Canu, Circlator, BWA-MEM, samtools, Pilon, QUAST
- Draft assembly
- Circularization
- Polishing
- Quality assessment
  
Step 3. Annotation ; tools used: Prokka

Step 4. Pangenome analysis ; tools used: Roary

Step 5. Phylogenetic inference ; tools used: MAFFT, trimAI, IQ-TREE, itol
- MSA
- MSA correction
- Tree reconstruction
- Tree visualization

Step 6. Proteome comparison (no source codes implied) ; tools used: BV-BRC bidirectional BLASTP and Galaxy BLAST Best Reciprocal Hit

Step 7. Network interactions and enrichment analysis (no source codes implied) ; tools used: STRING database and Cytoscape

