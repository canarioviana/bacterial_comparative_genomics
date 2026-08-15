# Install required packages
install.packages("tidyverse")

# Set as Working Directory the one containing the PPanGGOLiN output directory 7_ppanggolin (Session -> Set Working Directory -> Choose Directory)
# From 7_ppanggolin you will only need the files "matrix.csv" and the directory "annotation" generated using the script "A_comparative_analysis.sh"

# Load Library 
library(tidyverse)

# Create R Studio output directory
dir.create("7_ppanggolin_R")

###########################################################
# PPanGGOLiN
ppanggolin_matrix <- read.delim(file = "7_ppanggolin/matrix.csv", header = T, sep = ",", check.names = F)
write.table(ppanggolin_matrix, "7_ppanggolin_R/ppanggolin_matrix.tsv", row.names=FALSE, col.names=TRUE, quote=TRUE, sep="\t")

###########################################################
# EggNOG-mapper
eggnog_mapper <- read.delim(file = "7_ppanggolin/annotation/eggnogmapper/all_protein_families.emapper.annotations.tsv", header = T, sep = "\t", check.names = F)
colnames(eggnog_mapper)[colnames(eggnog_mapper) != "#query"] <- paste0("eggnog_", colnames(eggnog_mapper)[colnames(eggnog_mapper) != "#query"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=eggnog_mapper, by.x="Gene", by.y="#query", all.x=T, sort=F)

###########################################################
# COGclassifier
cogclassifier <- read.delim(file = "7_ppanggolin/annotation/cogclassifier/cog_classify.tsv", header = T, sep = "\t", check.names = F)
colnames(cogclassifier)[colnames(cogclassifier) != "QUERY_ID"] <- paste0("cog_", colnames(cogclassifier)[colnames(cogclassifier) != "QUERY_ID"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=cogclassifier, by.x="Gene", by.y="QUERY_ID", all.x=T, sort=F)

###########################################################
# dbCAN
dbcan <- read.delim(file = "7_ppanggolin/annotation/dbcan/overview.tsv", header = T, sep = "\t", check.names = F)
colnames(dbcan)[colnames(dbcan) != "Gene ID"] <- paste0("dbcan_", colnames(dbcan)[colnames(dbcan) != "Gene ID"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=dbcan, by.x="Gene", by.y="Gene ID", all.x=T, sort=F)

###########################################################
# VFDB
vfdb <- read.delim(file = "7_ppanggolin/annotation/vfdb/vfdb_header.tsv", header = T, sep = "\t", check.names = F)
colnames(vfdb)[colnames(vfdb) != "qseqid"] <- paste0("vfdb_", colnames(vfdb)[colnames(vfdb) != "qseqid"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=vfdb, by.x="Gene", by.y="qseqid", all.x=T, sort=F)

###########################################################
# AMRFinder
amrfinder <- read.delim(file = "7_ppanggolin/annotation/amrfinder/amrfinder.tsv", header = T, sep = "\t", check.names = F)
colnames(amrfinder)[colnames(amrfinder) != "Protein id"] <- paste0("amr_", colnames(amrfinder)[colnames(amrfinder) != "Protein id"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=amrfinder, by.x="Gene", by.y="Protein id", all.x=T, sort=F)

###########################################################
# RGI
rgi <- read.delim(file = "7_ppanggolin/annotation/rgi/rgi.txt", header = T, sep = "\t", check.names = F)
colnames(rgi)[colnames(rgi) != "ORF_ID"] <- paste0("rgi_", colnames(rgi)[colnames(rgi) != "ORF_ID"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=rgi, by.x="Gene", by.y="ORF_ID", all.x=T, sort=F)

###########################################################
# Save table
ppanggolin_matrix[is.na(ppanggolin_matrix)] <- ""
ppanggolin_matrix[ppanggolin_matrix=="NA"] <- ""
write.table(ppanggolin_matrix, "7_ppanggolin_R/ppanggolin_matrix_annotated.tsv", row.names=FALSE, col.names=TRUE, quote=TRUE, sep="\t")


# Install required packages
install.packages("tidyverse")

# Set as Working Directory the one containing the PPanGGOLiN output directory 7_ppanggolin (Session -> Set Working Directory -> Choose Directory)
# From 7_ppanggolin you will only need the files "matrix.csv" and the directory "annotation" generated using the script "A_comparative_analysis.sh"

# Load Library 
library(tidyverse)

###########################################################
# PPanGGOLiN
ppanggolin_matrix <- read.delim(file = "7_ppanggolin/matrix.csv", header = T, sep = ",", check.names = F)
write.table(ppanggolin_matrix, "7_ppanggolin/matrix.tsv", row.names=FALSE, col.names=TRUE, quote=TRUE, sep="\t")
write.table(ppanggolin_matrix, "7_ppanggolin_matrix.tsv", row.names=FALSE, col.names=TRUE, quote=TRUE, sep="\t")

###########################################################
# EggNOG-mapper
eggnog_mapper <- read.delim(file = "7_ppanggolin/annotation/eggnogmapper/all_protein_families.emapper.annotations.tsv", header = T, sep = "\t", check.names = F)
colnames(eggnog_mapper)[colnames(eggnog_mapper) != "#query"] <- paste0("eggnog_", colnames(eggnog_mapper)[colnames(eggnog_mapper) != "#query"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=eggnog_mapper, by.x="Gene", by.y="#query", all.x=T, sort=F)

###########################################################
# COGclassifier
cogclassifier <- read.delim(file = "7_ppanggolin/annotation/cogclassifier/cog_classify.tsv", header = T, sep = "\t", check.names = F)
colnames(cogclassifier)[colnames(cogclassifier) != "QUERY_ID"] <- paste0("cog_", colnames(cogclassifier)[colnames(cogclassifier) != "QUERY_ID"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=cogclassifier, by.x="Gene", by.y="QUERY_ID", all.x=T, sort=F)

###########################################################
# dbCAN
dbcan <- read.delim(file = "7_ppanggolin/annotation/dbcan/overview.tsv", header = T, sep = "\t", check.names = F)
colnames(dbcan)[colnames(dbcan) != "Gene ID"] <- paste0("dbcan_", colnames(dbcan)[colnames(dbcan) != "Gene ID"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=dbcan, by.x="Gene", by.y="Gene ID", all.x=T, sort=F)

###########################################################
# VFDB
vfdb <- read.delim(file = "7_ppanggolin/annotation/vfdb/vfdb_header.tsv", header = T, sep = "\t", check.names = F)
colnames(vfdb)[colnames(vfdb) != "qseqid"] <- paste0("vfdb_", colnames(vfdb)[colnames(vfdb) != "qseqid"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=vfdb, by.x="Gene", by.y="qseqid", all.x=T, sort=F)

###########################################################
# AMRFinder
amrfinder <- read.delim(file = "7_ppanggolin/annotation/amrfinder/amrfinder.tsv", header = T, sep = "\t", check.names = F)
colnames(amrfinder)[colnames(amrfinder) != "Protein id"] <- paste0("amr_", colnames(amrfinder)[colnames(amrfinder) != "Protein id"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=amrfinder, by.x="Gene", by.y="Protein id", all.x=T, sort=F)

###########################################################
# RGI
rgi <- read.delim(file = "7_ppanggolin/annotation/rgi/rgi.txt", header = T, sep = "\t", check.names = F)
colnames(rgi)[colnames(rgi) != "ORF_ID"] <- paste0("rgi_", colnames(rgi)[colnames(rgi) != "ORF_ID"])
ppanggolin_matrix <- merge(x=ppanggolin_matrix, y=rgi, by.x="Gene", by.y="ORF_ID", all.x=T, sort=F)

###########################################################
# Save table
ppanggolin_matrix[is.na(ppanggolin_matrix)] <- ""
ppanggolin_matrix[ppanggolin_matrix=="NA"] <- ""
write.table(ppanggolin_matrix, "7_ppanggolin/matrix_annotated.tsv", row.names=FALSE, col.names=TRUE, quote=TRUE, sep="\t")
write.table(ppanggolin_matrix, "7_ppanggolin_matrix_annotated.tsv", row.names=FALSE, col.names=TRUE, quote=TRUE, sep="\t")


