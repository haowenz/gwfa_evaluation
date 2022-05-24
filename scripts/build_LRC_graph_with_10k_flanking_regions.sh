eval "$(conda shell.bash hook)"
conda activate pggb

cd /storage/home/hcoda1/0/hzhang639/p-saluru8-0/rich_project_cse-aluru/project/pggb/data/HPRC/odgi-paper
prefix_chr19_smooth=chr19.hprc-v1.0-pggb

# Download and build the graph
wget https://s3-us-west-2.amazonaws.com/human-pangenomics/pangenomes/scratch/2021_11_16_pggb_wgg.88/chroms/${prefix_chr19_smooth}.gfa.gz
gunzip ${prefix_chr19_smooth}.gfa.gz
odgi build -g ${prefix_chr19_smooth}.gfa -o ${prefix_chr19_smooth}.og -t 16 -P

# Extraction and optimization of the LRC locus
odgi extract -i ${prefix_chr19_smooth}.og -r grch38#chr19:54518888-55605686 -o - --full-range -t 16 -P | odgi sort -i - -o ${prefix_chr19_smooth}.LRC.og --optimize

# Extraction, explosion, optimization, and sorting
odgi explode -i ${prefix_chr19_smooth}.LRC.og --biggest 1 --sorting-criteria P --optimize -p ${prefix_chr19_smooth}.LRC
odgi sort -i ${prefix_chr19_smooth}.LRC.0.og -o ${prefix_chr19_smooth}.LRC.sorted.og -p Ygs -x 100 -t 16 -P

# Convert to GFA for Bandage
odgi view -i ${prefix_chr19_smooth}.LRC.sorted.og -g > ${prefix_chr19_smooth}.LRC.sorted.gfa

conda deactivate
