echo "Test for episodes/files/assembly_script.sh"

# Test the shell script that should do just one assembly

cp -vf episodes/files/assembly_script.sh snakemake_data/yeast/
cp -vf episodes/files/assembly_conda_env.yaml snakemake_data/yeast/

cd snakemake_data/yeast

# The Snakefile assumes renames are applied
( cd reads ; rename -v -s ref ref_ ref?_?.fq )

# This time we need to install the conda env manually
conda env create --quiet --force --file assembly_conda_env.yaml -n assembly_env
conda activate assembly_env

# We should have max_contig.txt with one line
res1=$( wc -l <max_contig.txt )
[[ "$res1" == 1 ]]
