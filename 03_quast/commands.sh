conda activate quast_env
conda list -n quast_env > quast_env_packages.txt
conda env export > quast_env.yaml

ln -s ../02_genome_assemblies/*.fna .

quast.py *.fna



