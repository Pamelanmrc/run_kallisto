#/gpfs/share/apps/R/4.1.2/bin/R is where biomart exists
library(dplyr)
#installed in a different location
library(sleuth, lib="/gpfs/data/abl/home/mishrp03")

library(biomaRt)
x=read.table("kallisto_paths_old", sep="\t", header=FALSE, stringsAsFactors=FALSE)
colnames(x) = c("sample", "condition", "path")
so <- sleuth_prep(x, extra_bootstrap_summary = TRUE)
so <- sleuth_fit(so, ~condition, 'full')
so <- sleuth_fit(so, ~1, 'reduced')
so <- sleuth_lrt(so, 'reduced', 'full')
sleuth_table <- sleuth_results(so, 'reduced:full', 'lrt', show_all = FALSE)
sleuth_significant <- dplyr::filter(sleuth_table, qval <= 0.05)
head(sleuth_significant, 20) 


#nAMING THE transcripts according to the gene names
#mart <- biomaRt::useMart(biomart = "ENSEMBL_MART_ENSEMBL", dataset = "hsapiens_gene_ensembl", host = 'ensembl.org')
#t2g <- biomaRt::getBM(attributes = c("ensembl_transcript_id", "ensembl_gene_id","external_gene_name"), mart = mart)
#t2g <- dplyr::rename(t2g, target_id = ensembl_transcript_id,ens_gene = ensembl_gene_id, ext_gene = external_gene_name)
y$target = stringr::str_split_fixed(y$target_id, "\\.", 2)[,1]
#so <- sleuth_prep(s2c, target_mapping = t2g)
#so <- sleuth_fit(so, ~condition, 'full')
#so <- sleuth_fit(so, ~1, 'reduced')
#so <- sleuth_lrt(so, 'reduced', 'full')
#sleuth_live(so)

