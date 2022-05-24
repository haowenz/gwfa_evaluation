eval "$(conda shell.bash hook)"
conda activate pggb


hg38=hs38.fa
hg38_ncbi_refseq=hg38.ncbiRefSeq.gtf.gz
hg38_chrom_size=hg38.chrom.sizes
hg38_MHC_region_coor=hg38.ncbiRefSeq.MHC.coordinates.10k.flanking.bed
hg38_MHC=hg38.ncbiRefSeq.MHC.fa

echo -e "chr6\t29000000\t34000000\n" > ${hg38_MHC_region_coor}

bedtools getfasta -fi ${hg38} -bed ${hg38_MHC_region_coor} > ${hg38_MHC}

hg002_1=HG002.1.f1v2g.fa
hg002_2=HG002.2.f1v2g.fa

hg002_1_paf=HG002_1_MHC.paf
hg002_2_paf=HG002_2_MHC.paf

hg005_1=HG005.1.f1v2g.fa
hg005_2=HG005.2.f1v2g.fa

hg005_1_paf=HG005_1_MHC.paf
hg005_2_paf=HG005_2_MHC.paf

na19240_1=NA19240.1.f1v2g.fa
na19240_2=NA19240.2.f1v2g.fa

na19240_1_paf=NA19240_1_MHC.paf
na19240_2_paf=NA19240_2_MHC.paf

minimap2=/storage/coda1/p-saluru8/0/hzhang639/rich_project_cse-aluru/project/minimap2-2.24/minimap2

${minimap2} -x asm20 -t 24 ${hg002_1} ${hg38_MHC} > ${hg002_1_paf}
${minimap2} -x asm20 -t 24 ${hg002_2} ${hg38_MHC} > ${hg002_2_paf}

${minimap2} -x asm20 -t 24 ${hg005_1} ${hg38_MHC} > ${hg005_1_paf}
${minimap2} -x asm20 -t 24 ${hg005_2} ${hg38_MHC} > ${hg005_2_paf}

${minimap2} -x asm20 -t 24 ${na19240_1} ${hg38_MHC} > ${na19240_1_paf}
${minimap2} -x asm20 -t 24 ${na19240_2} ${hg38_MHC} > ${na19240_2_paf}

hg002_1_MHC_coor=HG002.1.f1v2g.MHC.coordinates.bed
hg002_2_MHC_coor=HG002.2.f1v2g.MHC.coordinates.bed

hg005_1_MHC_coor=HG005.1.f1v2g.MHC.coordinates.bed
hg005_2_MHC_coor=HG005.2.f1v2g.MHC.coordinates.bed

na19240_1_MHC_coor=NA19240.1.f1v2g.MHC.coordinates.bed
na19240_2_MHC_coor=NA19240.2.f1v2g.MHC.coordinates.bed

head -n 1 ${hg002_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg002_1_MHC_coor}
head -n 1 ${hg002_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg002_2_MHC_coor}

head -n 1 ${hg005_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg005_1_MHC_coor}
head -n 1 ${hg005_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${hg005_2_MHC_coor}

head -n 1 ${na19240_1_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${na19240_1_MHC_coor}
head -n 1 ${na19240_2_paf} | awk '{ print $6 "\t" $8 "\t" $9 "\t" $6 ":" $8 "-" $9 "\t1\t" $5 }' > ${na19240_2_MHC_coor}

hg002_1_MHC=HG002.1.f1v2g.MHC.fa
hg002_2_MHC=HG002.2.f1v2g.MHC.fa

hg005_1_MHC=HG005.1.f1v2g.MHC.fa
hg005_2_MHC=HG005.2.f1v2g.MHC.fa

na19240_1_MHC=NA19240.1.f1v2g.MHC.fa
na19240_2_MHC=NA19240.2.f1v2g.MHC.fa

bedtools getfasta -fi ${hg002_1} -bed ${hg002_1_MHC_coor} -s -name > ${hg002_1_MHC}
bedtools getfasta -fi ${hg002_2} -bed ${hg002_2_MHC_coor} -s -name > ${hg002_2_MHC}

bedtools getfasta -fi ${hg005_1} -bed ${hg005_1_MHC_coor} -s -name > ${hg005_1_MHC}
bedtools getfasta -fi ${hg005_2} -bed ${hg005_2_MHC_coor} -s -name > ${hg005_2_MHC}

bedtools getfasta -fi ${na19240_1} -bed ${na19240_1_MHC_coor} -s -name > ${na19240_1_MHC}
bedtools getfasta -fi ${na19240_2} -bed ${na19240_2_MHC_coor} -s -name > ${na19240_2_MHC}

conda deactivate
