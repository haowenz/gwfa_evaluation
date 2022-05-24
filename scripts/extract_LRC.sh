eval "$(conda shell.bash hook)"
conda activate pggb

hg38=hs38.fa
hg38_ncbi_refseq=hg38.ncbiRefSeq.gtf.gz
hg38_chrom_size=hg38.chrom.sizes
hg38_LRC_region_coor=hg38.ncbiRefSeq.LRC.coordinates.10k.flanking.bed
hg38_LRC=hg38.ncbiRefSeq.LRC.fa

echo -e "chr19\t54518888\t55605686\n" > ${hg38_LRC_region_coor}
bedtools getfasta -fi ${hg38} -bed ${hg38_LRC_region_coor} > ${hg38_LRC}

hg002_1=HG002.1.f1v2g.fa
hg002_2=HG002.2.f1v2g.fa

hg002_1_paf=HG002_1_LRC.paf
hg002_2_paf=HG002_2_LRC.paf

hg005_1=HG005.1.f1v2g.fa
hg005_2=HG005.2.f1v2g.fa

hg005_1_paf=HG005_1_LRC.paf
hg005_2_paf=HG005_2_LRC.paf

na19240_1=NA19240.1.f1v2g.fa
na19240_2=NA19240.2.f1v2g.fa

na19240_1_paf=NA19240_1_LRC.paf
na19240_2_paf=NA19240_2_LRC.paf

minimap2=/project/minimap2-2.24/minimap2

${minimap2} -x asm20 -t 24 ${hg002_1} ${hg38_LRC} > ${hg002_1_paf}
${minimap2} -x asm20 -t 24 ${hg002_2} ${hg38_LRC} > ${hg002_2_paf}

${minimap2} -x asm20 -t 24 ${hg005_1} ${hg38_LRC} > ${hg005_1_paf}
${minimap2} -x asm20 -t 24 ${hg005_2} ${hg38_LRC} > ${hg005_2_paf}

${minimap2} -x asm20 -t 24 ${na19240_1} ${hg38_LRC} > ${na19240_1_paf}
${minimap2} -x asm20 -t 24 ${na19240_2} ${hg38_LRC} > ${na19240_2_paf}

hg002_1_LRC_coor=HG002.1.f1v2g.LRC.coordinates.bed
hg002_2_LRC_coor=HG002.2.f1v2g.LRC.coordinates.bed

hg005_1_LRC_coor=HG005.1.f1v2g.LRC.coordinates.bed
hg005_2_LRC_coor=HG005.2.f1v2g.LRC.coordinates.bed

na19240_1_LRC_coor=NA19240.1.f1v2g.LRC.coordinates.bed
na19240_2_LRC_coor=NA19240.2.f1v2g.LRC.coordinates.bed

head -n 1 ${hg002_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg002_1_LRC_coor}
head -n 1 ${hg002_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg002_2_LRC_coor}

head -n 1 ${hg005_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg005_1_LRC_coor}
head -n 1 ${hg005_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg005_2_LRC_coor}

head -n 1 ${na19240_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${na19240_1_LRC_coor}
head -n 1 ${na19240_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${na19240_2_LRC_coor}

hg002_1_LRC=HG002.1.f1v2g.LRC.fa
hg002_2_LRC=HG002.2.f1v2g.LRC.fa

hg005_1_LRC=HG005.1.f1v2g.LRC.fa
hg005_2_LRC=HG005.2.f1v2g.LRC.fa

na19240_1_LRC=NA19240.1.f1v2g.LRC.fa
na19240_2_LRC=NA19240.2.f1v2g.LRC.fa

bedtools getfasta -fi ${hg002_1} -bed ${hg002_1_LRC_coor} -s -name > ${hg002_1_LRC}
bedtools getfasta -fi ${hg002_2} -bed ${hg002_2_LRC_coor} -s -name > ${hg002_2_LRC}

bedtools getfasta -fi ${hg005_1} -bed ${hg005_1_LRC_coor} -s -name > ${hg005_1_LRC}
bedtools getfasta -fi ${hg005_2} -bed ${hg005_2_LRC_coor} -s -name > ${hg005_2_LRC}

bedtools getfasta -fi ${na19240_1} -bed ${na19240_1_LRC_coor} -s -name > ${na19240_1_LRC}
bedtools getfasta -fi ${na19240_2} -bed ${na19240_2_LRC_coor} -s -name > ${na19240_2_LRC}

conda deactivate
