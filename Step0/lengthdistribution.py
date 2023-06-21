### Mycoplasma Hyorhinis strains bioinformatics analysis 

## Code to know the length distribution of the sequences of a given fasta file. 
# Objective: find significant sequence ids from a fasta file containing sequencing reads
# Includes:
# sorted dictionary with each sequence id and its length
# updated dictionary with only sequences that have a length higher than 1k bp (significant sequences)
# plot showing the length distribution of the sequences

# introduce the fasta file of interest
x = input('Enter your file:')

# create a dictionary containing the sequence id as key and the sequence itself as value
# open the fasta file
with open('{}.fasta'.format(x)) as f:
    # create the dictionary
    d = {}
    # iterate over the file's lines
    for l in f:
        # getting rid of the newline ending
        line = l.rstrip('\n')
        # if the line starts with '>' means we found a sequence, and it will contain its id among other information
        if line.startswith(">"):
            # we erase '>' symbol from that line in order to store the id as a key of the dictionary
            k = line.lstrip('>')
            # storing the id as key in string format
            d[k] = str() 
        else:
            # the rest of the lines then will belong to the sequence itself so we store those lines as a value of its corresponding id
            d[k] += line

# iterate over the items of the dictionary (key: id, value: sequence)
for key,values in d.items():
    # compute the length of each sequence 
    lengths = len(values)
    # set the length of the sequences as the new values associated with the keys
    d[key] = lengths

# now the dictionary contains --> key: id, value: length of the sequence

# create sorted dictionary with ids as keys and seq lengths as values (from higher to lower lengths)
sorted_sequences_by_lengths = sorted(d.items(), key=lambda x:x[1], reverse=True)
# the final dictionary is now sorted from higher to lower sequence length
final_dict = dict(sorted_sequences_by_lengths)

# we will create a txt file to store the contents of this dictionary in an appropiate format for reading
with open('{}_dictionary.txt'.format(x), 'w') as w:
    for key, value in final_dict.items():
        w.write('%s:%s\n' % (key, value))
        
# now we are interested in getting the sequences which have a length equal or bigger than 1000 bp, so we update the dictionary to store those sequences only
final_dict = dict((k, v) for k, v in final_dict.items() if v >= 1000)
# we get the list of all the ids of the sequences which have a length equal or higher than 1000 bp
keys_list = list(final_dict.keys())

# store the ids of the seqs with length >= 1000 in a txt file 
with open('{}_list.txt'.format(x), 'w') as file:
    for row in keys_list:
        # store them in a list manner (new line after each sequence id)
        s = "".join(map(str, row))
        file.write(s+'\n')
        
# create plot distributions of lengths capped to 100 frequency x length

# import needed module
import matplotlib.pyplot as plt

# get the list of lengths from the dictionary
lengths = list(final_dict.values())
# histogram plot with 1000 bins and cian color filled (sequence length distribution)
plt.hist(lengths, bins=1000, color = "c")
# put a vertical dashed line where the mean is located 
plt.axvline(sum(lengths)/len(lengths), color='k', linestyle='dashed', linewidth=1)
# put the limit in the y axis at 100 if u want to observe better the histogram (optional)
#plt.ylim(0, 100)
# length is the x axis
plt.xlabel('length')
# and the number of sequences is the y axis
plt.ylabel('number of contigs')

# save the plot as an image in png format
plt.savefig('{}_plot.png'.format(x))
# save the plot as an image in pdf format
plt.savefig('{}_plot.pdf'.format(x))
