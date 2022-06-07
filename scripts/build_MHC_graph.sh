eval "$(conda shell.bash hook)"
conda activate pggb

prefix_chr6_smooth=chr6.pan.fa.a2fb268.4030258.6a1ecc2.smooth

# Download and build the graph
wget https://s3-us-west-2.amazonaws.com/human-pangenomics/pangenomes/scratch/2021_11_16_pggb_wgg.88/chroms/${prefix_chr6_smooth}.gfa.gz
gunzip ${prefix_chr6_smooth}.gfa.gz
odgi build -g ${prefix_chr6_smooth}.gfa -o ${prefix_chr6_smooth}.og -t 16 -P

# Extraction and optimization of the MHC locus
odgi extract -i ${prefix_chr6_smooth}.og -r grch38#chr6:29000000-34000000 -o - --full-range -t 16 -P | odgi sort -i - -o ${prefix_chr6_smooth}.mhc.og --optimize

# Extraction, explosion, optimization, and sorting
odgi explode -i ${prefix_chr6_smooth}.mhc.og --biggest 1 --sorting-criteria P --optimize -p ${prefix_chr6_smooth}.mhc
odgi sort -i ${prefix_chr6_smooth}.mhc.0.og -o ${prefix_chr6_smooth}.mhc.sorted.og -p Ygs -x 100 -t 16 -P

# Convert to GFA for Bandage
odgi view -i ${prefix_chr6_smooth}.mhc.sorted.og -g > ${prefix_chr6_smooth}.mhc.sorted.gfa

conda deactivate
