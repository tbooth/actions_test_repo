echo "Test for episodes/files/ep01.Snakefile"

cp -vf episodes/files/ep01.Snakefile snakemake_data/yeast/Snakefile
cd snakemake_data/yeast

snakemake -j1 -p countreads countreads2

test -e ref1_1.fq.count
test -e etoh60_1_1.fq.count
