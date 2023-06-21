# Code to merge tsv reports in order to have all quality assessments together in a single table.

# Import pandas library
import pandas as pd

path_to_directory = "/media/joaquin/Work1/JOAQUIN/Mhyo/table/"

t1 = pd.read_csv(path_to_directory+"report_61-2.tsv", sep='\t')
t2 = pd.read_csv(path_to_directory+"report_62-1.tsv", sep='\t')

out = pd.merge(t1, t2, on='Assembly', how='inner')

# storing remaining file names in a list
ts = ["report_74-2.tsv", "report_82-1.tsv", "report_82-2.tsv", "report_82-6.tsv", "report_83-1.tsv"]

 
# One by one read tsv files and merge with
# 'out' dataframe and again store
# the final result in 'out' dataframe
for i in ts:
    path = path_to_directory+i
    t = pd.read_csv(path, sep='\t')
    out = pd.merge(out, t, on='Assembly', how='inner')
 
# Now store the 'Output_df'
# in tsv file 'Output.tsv'
out.to_csv(path_to_directory+"report_full.tsv", sep="\t", header=True, index=False)
