## PHYLOGENETIC TREE INFERENCE

# create tree from alignment file
# trimAI path : /home/joaquin/Downloads/trimAl/source (-phylip to get .phy format)
./trimal -in /media/joaquin/Work1/JOAQUIN/MhyoTFG/3.Pangenome/1.Roary/roary/core_gene_alignment.fasta -out /media/joaquin/Work1/JOAQUIN/MhyoTFG/3.Pangenome/1.Roary/roary/core_gene_alignment.phy -philip
# infer the tree using IQ-TREE or PhyML software (with .phy)
iqtree2 -s ../1.Roary/roary/core_gene_alignment.fa -B 1000 -m TEST 
