eval "$(conda shell.bash hook)"

C4_graph=chr6.pan.fa.a2fb268.4030258.6a1ecc2.smooth.C4.sorted.gfa

hg38_C4=hg38.ncbiRefSeq.C4.fa

hg002_1_C4=HG002.1.f1v2g.C4.fa
hg002_2_C4=HG002.2.f1v2g.C4.fa

hg005_1_C4=HG005.1.f1v2g.C4.fa
hg005_2_C4=HG005.2.f1v2g.C4.fa

na19240_1_C4=NA19240.1.f1v2g.C4.fa
na19240_2_C4=NA19240.2.f1v2g.C4.fa

gwfa=/project/gwfa/gwf-test
navarro=/project/sgat/build/apps/navarro_extend
dijkstra=/project/sgat/build/apps/dijkstra_extend
graphaligner_bitvector=/project/GraphAligner/bin/Aligner
astarix=/project/astarix/release/astarix

profiling="/usr/bin/time -v"

#gwfa

l_max=20000

${profiling} ${gwfa} -t -s 1 ${C4_graph} ${hg002_1_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${hg002_1_C4}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${C4_graph} ${hg002_1_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${hg002_2_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${hg002_2_C4}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${C4_graph} ${hg002_2_C4}

${profiling} ${gwfa} -t -s 1 ${C4_graph} ${hg005_1_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${hg005_1_C4}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${C4_graph} ${hg005_1_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${hg005_2_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${hg005_2_C4}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${C4_graph} ${hg005_2_C4}

${profiling} ${gwfa} -t -s 1 ${C4_graph} ${na19240_1_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${na19240_1_C4}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${C4_graph} ${na19240_1_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${na19240_2_C4}
${profiling} ${gwfa} -t -s 1 ${C4_graph} ${na19240_2_C4}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${C4_graph} ${na19240_2_C4}

#navarro

${profiling} ${navarro} 1 ${C4_graph} ${hg002_1_C4}
${profiling} ${navarro} 1 ${C4_graph} ${hg002_2_C4}

${profiling} ${navarro} 1 ${C4_graph} ${hg005_1_C4}
${profiling} ${navarro} 1 ${C4_graph} ${hg005_2_C4}

${profiling} ${navarro} 1 ${C4_graph} ${na19240_1_C4}
${profiling} ${navarro} 1 ${C4_graph} ${na19240_2_C4}

#dijkstra

${profiling} ${dijkstra} 1 ${C4_graph} ${hg002_1_C4}
${profiling} ${dijkstra} 1 ${C4_graph} ${hg002_2_C4}

${profiling} ${dijkstra} 1 ${C4_graph} ${hg005_1_C4}
${profiling} ${dijkstra} 1 ${C4_graph} ${hg005_2_C4}

${profiling} ${dijkstra} 1 ${C4_graph} ${na19240_1_C4}
${profiling} ${dijkstra} 1 ${C4_graph} ${na19240_2_C4}

#bitvector

${profiling} ${graphaligner_bitvector} -g ${C4_graph} -f ${hg002_1_C4}
${profiling} ${graphaligner_bitvector} -g ${C4_graph} -f ${hg002_2_C4}

${profiling} ${graphaligner_bitvector} -g ${C4_graph} -f ${hg005_1_C4}
${profiling} ${graphaligner_bitvector} -g ${C4_graph} -f ${hg005_2_C4}

${profiling} ${graphaligner_bitvector} -g ${C4_graph} -f ${na19240_1_C4}
${profiling} ${graphaligner_bitvector} -g ${C4_graph} -f ${na19240_2_C4}

# Installed by conda
graphaligner_heuristics=GraphAligner
conda activate graphaligner

${profiling} ${graphaligner_heuristics} -x vg -g ${C4_graph} -f ${hg002_1_C4} -a HG002.1.C4.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${C4_graph} -f ${hg002_2_C4} -a HG002.2.C4.graphaligner.gaf

${profiling} ${graphaligner_heuristics} -x vg -g ${C4_graph} -f ${hg005_1_C4} -a HG005.1.C4.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${C4_graph} -f ${hg005_2_C4} -a HG005.2.C4.graphaligner.gaf

${profiling} ${graphaligner_heuristics} -x vg -g ${C4_graph} -f ${na19240_1_C4} -a NA19240.1.C4.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${C4_graph} -f ${na19240_2_C4} -a NA19240.2.C4.graphaligner.gaf

conda deactivate

astarix
${profiling} ${astarix} align-optimal -G 1 -g ${C4_graph} -q ${hg002_1_C4} -o HG002.1.C4.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${C4_graph} -q ${hg002_2_C4} -o HG002.2.C4.astarix.gaf

${profiling} ${astarix} align-optimal -G 1 -g ${C4_graph} -q ${hg005_1_C4} -o HG005.1.C4.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${C4_graph} -q ${hg005_2_C4} -o HG005.2.C4.astarix.gaf

${profiling} ${astarix} align-optimal -G 1 -g ${C4_graph} -q ${na19240_1_C4} -o NA19240.1.C4.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${C4_graph} -q ${na19240_2_C4} -o NA19240.2.C4.astarix.gaf
