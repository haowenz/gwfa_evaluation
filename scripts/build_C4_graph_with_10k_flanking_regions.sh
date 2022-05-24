eval "$(conda shell.bash hook)"
conda activate pggb

prefix_chr6_smooth=chr6.pan.fa.a2fb268.4030258.6a1ecc2.smooth

# Download and build the graph
wget https://s3-us-west-2.amazonaws.com/human-pangenomics/pangenomes/scratch/2021_11_16_pggb_wgg.88/chroms/${prefix_chr6_smooth}.gfa.gz
gunzip ${prefix_chr6_smooth}.gfa.gz
odgi build -g ${prefix_chr6_smooth}.gfa -o ${prefix_chr6_smooth}.og -t 16 -P

# Find C4 coordinates
#wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.chrom.sizes
#wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/genes/hg38.ncbiRefSeq.gtf.gz
zgrep 'gene_id "C4A"\|gene_id "C4B"' hg38.ncbiRefSeq.gtf.gz |
  awk '$1 == "chr6"' | cut -f 1,4,5 |
  bedtools sort | bedtools merge -d 15000 | bedtools slop -l 10000 -r 10000 -g hg38.chrom.sizes |
  sed 's/chr6/grch38#chr6/g' > hg38.ncbiRefSeq.C4.coordinates.10k.flanking.bed


# Extraction, explosion, optimization, and sorting
odgi extract -i ${prefix_chr6_smooth}.og -b hg38.ncbiRefSeq.C4.coordinates.10k.flanking.bed -o - --full-range -t 16 -P |
  odgi explode -i - --biggest 1 --sorting-criteria P --optimize -p ${prefix_chr6_smooth}.C4
odgi sort -i ${prefix_chr6_smooth}.C4.0.og -o ${prefix_chr6_smooth}.C4.sorted.og -p Ygs -x 100 -t 16 -P

conda deactivate
