eval "$(conda shell.bash hook)"

linear_C4_graph=linear_hg38_C4_minigraph_no_edit.gfa

hg38_C4=hg38.ncbiRefSeq.C4.fa

hg002_1_C4=HG002.1.f1v2g.C4.fa
hg002_2_C4=HG002.2.f1v2g.C4.fa

hg005_1_C4=HG005.1.f1v2g.C4.fa
hg005_2_C4=HG005.2.f1v2g.C4.fa

na19240_1_C4=NA19240.1.f1v2g.C4.fa
na19240_2_C4=NA19240.2.f1v2g.C4.fa

edlib=/project/edlib-1.2.7/build/bin/edlib-aligner
wfa=/project/WFA2-lib/examples/bin/wfa_basic
gwfa=/project/gwfa/gwf-test
navarro=/project/sgat/build/apps/navarro_extend
dijkstra=/project/sgat/build/apps/dijkstra_extend
graphaligner_bitvector=/project/GraphAligner/bin/Aligner
astarix=/project/astarix/release/astarix

profiling="/usr/bin/time -v" 
#edlib

${profiling} ${edlib} -m SHW ${hg002_1_C4} ${hg38_C4}
${profiling} ${edlib} -m SHW ${hg002_2_C4} ${hg38_C4}

${profiling} ${edlib} -m SHW ${hg005_1_C4} ${hg38_C4}
${profiling} ${edlib} -m SHW ${hg005_2_C4} ${hg38_C4}

${profiling} ${edlib} -m SHW ${na19240_1_C4} ${hg38_C4}
${profiling} ${edlib} -m SHW ${na19240_2_C4} ${hg38_C4}

wfa

${profiling} ${wfa} ${hg38_C4} ${hg002_1_C4}
${profiling} ${wfa} ${hg38_C4} ${hg002_1_C4}
${profiling} ${wfa} ${hg38_C4} ${hg002_2_C4}
${profiling} ${wfa} ${hg38_C4} ${hg002_2_C4}

${profiling} ${wfa} ${hg38_C4} ${hg005_1_C4}
${profiling} ${wfa} ${hg38_C4} ${hg005_1_C4}
${profiling} ${wfa} ${hg38_C4} ${hg005_2_C4}
${profiling} ${wfa} ${hg38_C4} ${hg005_2_C4}

${profiling} ${wfa} ${hg38_C4} ${na19240_1_C4}
${profiling} ${wfa} ${hg38_C4} ${na19240_1_C4}
${profiling} ${wfa} ${hg38_C4} ${na19240_2_C4}
${profiling} ${wfa} ${hg38_C4} ${na19240_2_C4}

#gwfa
l_max=20000
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${hg002_1_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${hg002_1_C4}
${profiling} ${gwfa} -l ${l_max} -s s1 ${linear_C4_graph} ${hg002_1_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${hg002_2_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${hg002_2_C4}
${profiling} ${gwfa} -l ${l_max} -s s1 ${linear_C4_graph} ${hg002_2_C4}

${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${hg005_1_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${hg005_1_C4}
${profiling} ${gwfa} -l ${l_max} -s s1 ${linear_C4_graph} ${hg005_1_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${hg005_2_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${hg005_2_C4}
${profiling} ${gwfa} -l ${l_max} -s s1 ${linear_C4_graph} ${hg005_2_C4}

${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${na19240_1_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${na19240_1_C4}
${profiling} ${gwfa} -l ${l_max} -s s1 ${linear_C4_graph} ${na19240_1_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${na19240_2_C4}
${profiling} ${gwfa} -s s1 ${linear_C4_graph} ${na19240_2_C4}
${profiling} ${gwfa} -l ${l_max} -s s1 ${linear_C4_graph} ${na19240_2_C4}

#navarro

${profiling} ${navarro} 1 ${linear_C4_graph} ${hg002_1_C4}
${profiling} ${navarro} 1 ${linear_C4_graph} ${hg002_2_C4}

${profiling} ${navarro} 1 ${linear_C4_graph} ${hg005_1_C4}
${profiling} ${navarro} 1 ${linear_C4_graph} ${hg005_2_C4}

${profiling} ${navarro} 1 ${linear_C4_graph} ${na19240_1_C4}
${profiling} ${navarro} 1 ${linear_C4_graph} ${na19240_2_C4}

#dijkstra

${profiling} ${dijkstra} 1 ${linear_C4_graph} ${hg002_1_C4}
${profiling} ${dijkstra} 1 ${linear_C4_graph} ${hg002_2_C4}

${profiling} ${dijkstra} 1 ${linear_C4_graph} ${hg005_1_C4}
${profiling} ${dijkstra} 1 ${linear_C4_graph} ${hg005_2_C4}

${profiling} ${dijkstra} 1 ${linear_C4_graph} ${na19240_1_C4}
${profiling} ${dijkstra} 1 ${linear_C4_graph} ${na19240_2_C4}

bitvector

${profiling} ${graphaligner_bitvector} -g ${linear_C4_char_graph} -f ${hg002_1_C4}
${profiling} ${graphaligner_bitvector} -g ${linear_C4_char_graph} -f ${hg002_2_C4}

${profiling} ${graphaligner_bitvector} -g ${linear_C4_char_graph} -f ${hg005_1_C4}
${profiling} ${graphaligner_bitvector} -g ${linear_C4_char_graph} -f ${hg005_2_C4}

${profiling} ${graphaligner_bitvector} -g ${linear_C4_char_graph} -f ${na19240_1_C4}
${profiling} ${graphaligner_bitvector} -g ${linear_C4_char_graph} -f ${na19240_2_C4}

# Installed by conda
graphaligner_heuristics=GraphAligner
conda activate graphaligner

${profiling} ${graphaligner_heuristics} -x vg -g ${linear_C4_graph} -f ${hg002_1_C4} -a HG002.1.linear.C4.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${linear_C4_graph} -f ${hg002_2_C4} -a HG002.2.linear.C4.graphaligner.gaf

${profiling} ${graphaligner_heuristics} -x vg -g ${linear_C4_graph} -f ${hg005_1_C4} -a HG005.1.linear.C4.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${linear_C4_graph} -f ${hg005_2_C4} -a HG005.2.linear.C4.graphaligner.gaf

${profiling} ${graphaligner_heuristics} -x vg -g ${linear_C4_graph} -f ${na19240_1_C4} -a NA19240.1.linear.C4.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${linear_C4_graph} -f ${na19240_2_C4} -a NA19240.2.linear.C4.graphaligner.gaf

conda deactivate

astarix
${profiling} ${astarix} align-optimal -G 1 -g ${linear_C4_graph} -q ${hg002_1_C4} -o HG002.1.C4.linear.astarix
${profiling} ${astarix} align-optimal -G 1 -g ${linear_C4_graph} -q ${hg002_2_C4} -o HG002.2.C4.linear.astarix

${profiling} ${astarix} align-optimal -G 1 -g ${linear_C4_graph} -q ${hg005_1_C4} -o HG005.1.C4.linear.astarix
${profiling} ${astarix} align-optimal -G 1 -g ${linear_C4_graph} -q ${hg005_2_C4} -o HG005.2.C4.linear.astarix

${profiling} ${astarix} align-optimal -G 1 -g ${linear_C4_graph} -q ${na19240_1_C4} -o NA19240.1.C4.linear.astarix
${profiling} ${astarix} align-optimal -G 1 -g ${linear_C4_graph} -q ${na19240_2_C4} -o NA19240.2.C4.linear.astarix
