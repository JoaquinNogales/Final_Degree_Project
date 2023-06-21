## ANNOTATION

# Prokka to annotate (conda env)

samples="61-2 62-1 74-2 82-1 82-2 82-3 82-6 83-1 83-4 101-8 104-2 RM5-5"

for i in $samples
do
    #conda activate prokka
    prokka --cpus 16 --prefix ${i} --kingdom Bacteria --genus Mycoplasma --locustag ${i} ../1.Assembly/5.Assemblies/${i}_assembly.fasta 
done
