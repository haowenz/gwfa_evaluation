eval "$(conda shell.bash hook)"

MHC_graph=GRCh38-90c.r518.MHC.gfa

hg38_MHC=hg38.ncbiRefSeq.MHC.fa

hg002_1_MHC=HG002.1.f1v2g.MHC.fa
hg002_2_MHC=HG002.2.f1v2g.MHC.fa

hg005_1_MHC=HG005.1.f1v2g.MHC.fa
hg005_2_MHC=HG005.2.f1v2g.MHC.fa

na19240_1_MHC=NA19240.1.f1v2g.MHC.fa
na19240_2_MHC=NA19240.2.f1v2g.MHC.fa

gwfa=/project/gwfa/gwf-test
navarro=/project/sgat/build/apps/navarro_extend
dijkstra=/project/sgat/build/apps/dijkstra_extend
graphaligner_bitvector=/project/GraphAligner/bin/Aligner
astarix=/project/astarix/release/astarix

profiling="/usr/bin/time -v"

#gwfa

l_max=30000

${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${hg002_1_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${hg002_1_MHC}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${MHC_graph} ${hg002_1_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${hg002_2_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${hg002_2_MHC}
${profiling} ${gwfa} -t -l $[l_max] -s 1 ${MHC_graph} ${hg002_2_MHC}

${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${hg005_1_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${hg005_1_MHC}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${MHC_graph} ${hg005_1_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${hg005_2_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${hg005_2_MHC}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${MHC_graph} ${hg005_2_MHC}

${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${na19240_1_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${na19240_1_MHC}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${MHC_graph} ${na19240_1_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${na19240_2_MHC}
${profiling} ${gwfa} -t -s 1 ${MHC_graph} ${na19240_2_MHC}
${profiling} ${gwfa} -t -l ${l_max} -s 1 ${MHC_graph} ${na19240_2_MHC}

#navarro

${profiling} ${navarro} 1 ${MHC_graph} ${hg002_1_MHC}
${profiling} ${navarro} 1 ${MHC_graph} ${hg002_2_MHC}

${profiling} ${navarro} 1 ${MHC_graph} ${hg005_1_MHC}
${profiling} ${navarro} 1 ${MHC_graph} ${hg005_2_MHC}

${profiling} ${navarro} 1 ${MHC_graph} ${na19240_1_MHC}
${profiling} ${navarro} 1 ${MHC_graph} ${na19240_2_MHC}

#dijkstra

${profiling} ${dijkstra} 1 ${MHC_graph} ${hg002_1_MHC}
${profiling} ${dijkstra} 1 ${MHC_graph} ${hg002_2_MHC}

${profiling} ${dijkstra} 1 ${MHC_graph} ${hg005_1_MHC}
${profiling} ${dijkstra} 1 ${MHC_graph} ${hg005_2_MHC}

${profiling} ${dijkstra} 1 ${MHC_graph} ${na19240_1_MHC}
${profiling} ${dijkstra} 1 ${MHC_graph} ${na19240_2_MHC}

#bitvector

${profiling} ${graphaligner_bitvector} -g ${MHC_graph} -f ${hg002_1_MHC}
${profiling} ${graphaligner_bitvector} -g ${MHC_graph} -f ${hg002_2_MHC}

${profiling} ${graphaligner_bitvector} -g ${MHC_graph} -f ${hg005_1_MHC}
${profiling} ${graphaligner_bitvector} -g ${MHC_graph} -f ${hg005_2_MHC}

${profiling} ${graphaligner_bitvector} -g ${MHC_graph} -f ${na19240_1_MHC}
${profiling} ${graphaligner_bitvector} -g ${MHC_graph} -f ${na19240_2_MHC}

# Installed by conda
graphaligner_heuristics=GraphAligner
conda activate graphaligner

${profiling} ${graphaligner_heuristics} -x vg -g ${MHC_graph} -f ${hg002_1_MHC} -a HG002.1.MHC.minigraph.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${MHC_graph} -f ${hg002_2_MHC} -a HG002.2.MHC.minigraph.graphaligner.gaf

${profiling} ${graphaligner_heuristics} -x vg -g ${MHC_graph} -f ${hg005_1_MHC} -a HG005.1.MHC.minigraph.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${MHC_graph} -f ${hg005_2_MHC} -a HG005.2.MHC.minigraph.graphaligner.gaf

${profiling} ${graphaligner_heuristics} -x vg -g ${MHC_graph} -f ${na19240_1_MHC} -a NA19240.1.MHC.minigraph.graphaligner.gaf
${profiling} ${graphaligner_heuristics} -x vg -g ${MHC_graph} -f ${na19240_2_MHC} -a NA19240.2.MHC.minigraph.graphaligner.gaf

conda deactivate

#astarix
${profiling} ${astarix} align-optimal -G 1 -g ${MHC_graph} -q ${hg002_1_MHC} -o HG002.1.MHC.minigraph.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${MHC_graph} -q ${hg002_2_MHC} -o HG002.2.MHC.minigraph.astarix.gaf

${profiling} ${astarix} align-optimal -G 1 -g ${MHC_graph} -q ${hg005_1_MHC} -o HG005.1.MHC.minigraph.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${MHC_graph} -q ${hg005_2_MHC} -o HG005.2.MHC.minigraph.astarix.gaf

${profiling} ${astarix} align-optimal -G 1 -g ${MHC_graph} -q ${na19240_1_MHC} -o NA19240.1.MHC.minigraph.astarix.gaf
${profiling} ${astarix} align-optimal -G 1 -g ${MHC_graph} -q ${na19240_2_MHC} -o NA19240.2.MHC.minigraph.astarix.gaf
