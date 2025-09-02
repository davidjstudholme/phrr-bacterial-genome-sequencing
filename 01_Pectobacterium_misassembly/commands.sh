### Download NCBI's datasets utility:
curl -o datasets 'https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/linux-amd64/datasets'
chmod u+x datasets

### Use NCBI's datasets utility to download the genome sequences, unzip them and make symlinks in current directory:
./datasets download genome accession --inputfile assm_accs.txt --include genome --filename genome_assemblies.zip
unzip genome_assemblies.zip
ln -s ncbi_dataset/data/GCA_*/GCA_*.fna .

### Download genomic sequence reads from Sequence Read Archive (SRA)
fasterq-dump SRR30018442 # Oxford Nanopore data
fasterq-dump SRR29500177 # Illumina data

### Rename the FASTQ files
mv SRR29500177_1.fastq NCPPB929-illumina.1.fq
mv SRR29500177_2.fastq NCPPB929-illumina.2.fq
mv SRR30018442.fastq NCPPB929-ont.fq

### Compress the files
gzip NCPPB929-illumina.1.fq NCPPB929-illumina.2.fq NCPPB929-ont.fq

### QC the Illumina data
trim_galore -q 30 --paired NCPPB929-illumina.1.fq.gz NCPPB929-illumina.2.fq.gz




