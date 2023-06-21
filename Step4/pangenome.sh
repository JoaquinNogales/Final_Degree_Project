## PANGENOME ANALYSIS

# put all .gff files from prokka together in a directory
roary -f ./roary -e -n -v ./gff/*.gff
# visual represntation of the results (once the tree is defined)
python roary_plots.py core_gene_alignment.nwk gene_presence_absence.csv
# gene differences between sets of isolates (disease vs healhty)
query_pan_genome -a difference --input_set_one 61-2.gff,62-1.gff,74-2.gff,82-6.gff,83-1.gff,83-4.gff,101-8.gff,104-2.gff,RM5-5.gff --input_set_two 82-1.gff,82-2.gff,82-3.gff
