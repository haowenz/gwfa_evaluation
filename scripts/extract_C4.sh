eval "$(conda shell.bash hook)"
conda activate pggb

hg38=hs38.fa
hg38_ncbi_refseq=hg38.ncbiRefSeq.gtf.gz
hg38_chrom_size=hg38.chrom.sizes
hg38_C4_region_coor=hg38.ncbiRefSeq.C4.coordinates.10k.flanking.bed
hg38_C4=hg38.ncbiRefSeq.C4.fa

zgrep 'gene_id "C4A"\|gene_id "C4B"' ${hg38_ncbi_refseq} |
  awk '$1 == "chr6"' | cut -f 1,4,5 |
  bedtools sort | bedtools merge -d 15000 | bedtools slop -l 10000 -r 10000 -g ${hg38_chrom_size} > ${hg38_C4_region_coor}

bedtools getfasta -fi ${hg38} -bed ${hg38_C4_region_coor} > ${hg38_C4}

hg002_1=HG002.1.f1v2g.fa
hg002_2=HG002.2.f1v2g.fa

hg002_1_paf=HG002_1_C4.paf
hg002_2_paf=HG002_2_C4.paf

hg005_1=HG005.1.f1v2g.fa
hg005_2=HG005.2.f1v2g.fa

hg005_1_paf=HG005_1_C4.paf
hg005_2_paf=HG005_2_C4.paf

na19240_1=NA19240.1.f1v2g.fa
na19240_2=NA19240.2.f1v2g.fa

na19240_1_paf=NA19240_1_C4.paf
na19240_2_paf=NA19240_2_C4.paf

minimap2=/project/minimap2-2.24/minimap2

${minimap2} -x asm20 -t 24 ${hg002_1} ${hg38_C4} > ${hg002_1_paf}
${minimap2} -x asm20 -t 24 ${hg002_2} ${hg38_C4} > ${hg002_2_paf}

${minimap2} -x asm20 -t 24 ${hg005_1} ${hg38_C4} > ${hg005_1_paf}
${minimap2} -x asm20 -t 24 ${hg005_2} ${hg38_C4} > ${hg005_2_paf}

${minimap2} -x asm20 -t 24 ${na19240_1} ${hg38_C4} > ${na19240_1_paf}
${minimap2} -x asm20 -t 24 ${na19240_2} ${hg38_C4} > ${na19240_2_paf}

hg002_1_C4_coor=HG002.1.f1v2g.C4.coordinates.bed
hg002_2_C4_coor=HG002.2.f1v2g.C4.coordinates.bed

hg005_1_C4_coor=HG005.1.f1v2g.C4.coordinates.bed
hg005_2_C4_coor=HG005.2.f1v2g.C4.coordinates.bed

na19240_1_C4_coor=NA19240.1.f1v2g.C4.coordinates.bed
na19240_2_C4_coor=NA19240.2.f1v2g.C4.coordinates.bed

head -n 1 ${hg002_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg002_1_C4_coor}
head -n 1 ${hg002_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg002_2_C4_coor}

head -n 1 ${hg005_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg005_1_C4_coor}
head -n 1 ${hg005_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg005_2_C4_coor}

head -n 1 ${na19240_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${na19240_1_C4_coor}
head -n 1 ${na19240_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${na19240_2_C4_coor}

hg002_1_C4=HG002.1.f1v2g.C4.fa
hg002_2_C4=HG002.2.f1v2g.C4.fa

hg005_1_C4=HG005.1.f1v2g.C4.fa
hg005_2_C4=HG005.2.f1v2g.C4.fa

na19240_1_C4=NA19240.1.f1v2g.C4.fa
na19240_2_C4=NA19240.2.f1v2g.C4.fa

bedtools getfasta -fi ${hg002_1} -bed ${hg002_1_C4_coor} -s -name > ${hg002_1_C4}
bedtools getfasta -fi ${hg002_2} -bed ${hg002_2_C4_coor} -s -name > ${hg002_2_C4}

bedtools getfasta -fi ${hg005_1} -bed ${hg005_1_C4_coor} -s -name > ${hg005_1_C4}
bedtools getfasta -fi ${hg005_2} -bed ${hg005_2_C4_coor} -s -name > ${hg005_2_C4}

bedtools getfasta -fi ${na19240_1} -bed ${na19240_1_C4_coor} -s -name > ${na19240_1_C4}
bedtools getfasta -fi ${na19240_2} -bed ${na19240_2_C4_coor} -s -name > ${na19240_2_C4}

conda deactivate
