eval "$(conda shell.bash hook)"
conda activate pggb

grch38_graph_prefix=GRCh38-90c.r518

wget https://zenodo.org/record/6499594/files/GRCh38-90c.r518.gfa.gz?download=1 -O ${grch38_graph_prefix}.gfa.gz

gunzip ${grch38_graph_prefix}.gfa.gz

# Extraction and optimization of the MHC locus
gfatools view -R chr6:29000000-34000000 ${grch38_graph_prefix}.gfa > ${grch38_graph_prefix}.MHC.gfa
