eval "$(conda shell.bash hook)"

LRC_graph=chr19.hprc-v1.0-pggb.LRC.sorted.gfa

hg38_LRC=hg38.ncbiRefSeq.LRC.fa

hg002_1_LRC=HG002.1.f1v2g.LRC.fa
hg002_2_LRC=HG002.2.f1v2g.LRC.fa

hg005_1_LRC=HG005.1.f1v2g.LRC.fa
hg005_2_LRC=HG005.2.f1v2g.LRC.fa

na19240_1_LRC=NA19240.1.f1v2g.LRC.fa
na19240_2_LRC=NA19240.2.f1v2g.LRC.fa

gwfa=/project/gwfa/gwf-test
navarro=/project/sgat/build/apps/navarro_extend
dijkstra=/project/sgat/build/apps/dijkstra_extend
graphaligner_bitvector=/project/GraphAligner/bin/Aligner
astarix=/project/astarix/release/astarix

profiling="/usr/bin/time -v"

#gwfa

l_max=20000

${profiling} ${gwfa} -s 1 ${LRC_graph} ${hg002_1_LRC}
${profiling} ${gwfa} -s 1 ${LRC_graph} ${hg002_1_LRC}
${profiling} ${gwfa} -l ${l_max} -s 1 ${LRC_graph} ${hg002_1_LRC}

${profiling} ${gwfa} -s 1 ${LRC_graph} ${hg005_1_LRC}
${profiling} ${gwfa} -s 1 ${LRC_graph} ${hg005_1_LRC}
${profiling} ${gwfa} -l ${l_max} -s 1 ${LRC_graph} ${hg005_1_LRC}
${profiling} ${gwfa} -s 1 ${LRC_graph} ${hg005_2_LRC}
${profiling} ${gwfa} -s 1 ${LRC_graph} ${hg005_2_LRC}
${profiling} ${gwfa} -l ${l_max} -s 1 ${LRC_graph} ${hg005_2_LRC}

${profiling} ${gwfa} -s 1 ${LRC_graph} ${na19240_1_LRC}
${profiling} ${gwfa} -s 1 ${LRC_graph} ${na19240_1_LRC}
${profiling} ${gwfa} -l ${l_max} -s 1 ${LRC_graph} ${na19240_1_LRC}
${profiling} ${gwfa} -s 1 ${LRC_graph} ${na19240_2_LRC}
${profiling} ${gwfa} -s 1 ${LRC_graph} ${na19240_2_LRC}
${profiling} ${gwfa} -l ${l_max} -s 1 ${LRC_graph} ${na19240_2_LRC}

#navarro

${profiling} ${navarro} 1 ${LRC_graph} ${hg002_1_LRC}
${profiling} ${navarro} 1 ${LRC_graph} ${hg002_2_LRC}

${profiling} ${navarro} 1 ${LRC_graph} ${hg005_1_LRC}
${profiling} ${navarro} 1 ${LRC_graph} ${hg005_2_LRC}

${profiling} ${navarro} 1 ${LRC_graph} ${na19240_1_LRC}
${profiling} ${navarro} 1 ${LRC_graph} ${na19240_2_LRC}

#dijkstra

${profiling} ${dijkstra} 1 ${LRC_graph} ${hg002_1_LRC}
${profiling} ${dijkstra} 1 ${LRC_graph} ${hg002_2_LRC}

${profiling} ${dijkstra} 1 ${LRC_graph} ${hg005_1_LRC}
${profiling} ${dijkstra} 1 ${LRC_graph} ${hg005_2_LRC}

${profiling} ${dijkstra} 1 ${LRC_graph} ${na19240_1_LRC}
${profiling} ${dijkstra} 1 ${LRC_graph} ${na19240_2_LRC}

#bitvector

${profiling} ${graphaligner_bitvector} -g ${LRC_graph} -f ${hg002_1_LRC}
${profiling} ${graphaligner_bitvector} -g ${LRC_graph} -f ${hg002_2_LRC}

${profiling} ${graphaligner_bitvector} -g ${LRC_graph} -f ${hg005_1_LRC}
${profiling} ${graphaligner_bitvector} -g ${LRC_graph} -f ${hg005_2_LRC}

${profiling} ${graphaligner_bitvector} -g ${LRC_graph} -f ${na19240_1_LRC}
${profiling} ${graphaligner_bitvector} -g ${LRC_graph} -f ${na19240_2_LRC}

# Installed by conda
graphaligner_heuristics=GraphAligner
conda activate graphaligner

${profiling} ${graphaligner_heuristics} -x vg -g ${LRC_graph} -f ${hg002_1_LRC} -a HG002.1.LRC.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${LRC_graph} -f ${hg002_2_LRC} -a HG002.2.LRC.graphaligner.gaf

${profiling} ${graphaligner_heuristics} -x vg -g ${LRC_graph} -f ${hg005_1_LRC} -a HG005.1.LRC.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${LRC_graph} -f ${hg005_2_LRC} -a HG005.2.LRC.graphaligner.gaf

${profiling} ${graphaligner_heuristics} -x vg -g ${LRC_graph} -f ${na19240_1_LRC} -a NA19240.1.LRC.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${LRC_graph} -f ${na19240_2_LRC} -a NA19240.2.LRC.graphaligner.gaf

conda deactivate

#astarix
${profiling} ${astarix} align-optimal -G 1 -g ${LRC_graph} -q ${hg002_1_LRC} -o HG002.1.LRC.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${LRC_graph} -q ${hg002_2_LRC} -o HG002.2.LRC.astarix.gaf

${profiling} ${astarix} align-optimal -G 1 -g ${LRC_graph} -q ${hg005_1_LRC} -o HG005.1.LRC.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${LRC_graph} -q ${hg005_2_LRC} -o HG005.2.LRC.astarix.gaf

${profiling} ${astarix} align-optimal -G 1 -g ${LRC_graph} -q ${na19240_1_LRC} -o NA19240.1.LRC.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${LRC_graph} -q ${na19240_2_LRC} -o NA19240.2.LRC.astarix.gaf
