echo "Test for episodes/files/assembly_with_conda.Snakefile"

cp -vf episodes/files/assembly_with_conda.Snakefile snakemake_data/yeast/
cp -vf episodes/files/assembly_conda_env.yaml snakemake_data/yeast/

cd snakemake_data/yeast

# The Snakefile assumes renames are applied
( cd reads ; rename -v -s ref ref_ ref?_?.fq )

snakemake -s assembly_with_conda.Snakefile -j1 -p --sdm conda

# We should have 12 assemblies
conda env list | grep .snakemake
ls assem
[[ wc -w <<<(ls -f assem/*_max_contig.txt) == 12 ]]
