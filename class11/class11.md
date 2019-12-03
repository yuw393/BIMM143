Class 11: Structural Bioinformatics 1
================

## The PDB database for biomolecular structure data

> Q1: Determine the percentage of structures solved by X-Ray and
> Electron Microscopy.

> Determine what proportion of structures are protein?

Download CSV file from PDB website (“Analyze \>”PDB Statistics" \> “by
Experimental Method and Molecular Type”)

``` r
# Read CVS
data <- read.csv("Data Export Summary.csv",row.names = 1)
data
```

    ##                     Proteins Nucleic.Acids Protein.NA.Complex Other  Total
    ## X-Ray                 131278          2059               6759     8 140104
    ## NMR                    11235          1303                261     8  12807
    ## Electron Microscopy     2899            32                999     0   3930
    ## Other                    280             4                  6    13    303
    ## Multi Method             144             5                  2     1    152

Total number of entries

``` r
sum(data$Total)
```

    ## [1] 157296

Proportion of entries from each method

``` r
#Percentages of structures solved by X-Ray and Electron Microscopy
data$Total / sum(data$Total)* 100
```

    ## [1] 89.0702879  8.1419744  2.4984742  0.1926305  0.0966331

``` r
#Proportion of structures are protein
round((sum(data$Proteins)/sum(data$Total))*100,2)
```

    ## [1] 92.71

``` r
#use round to restrain the number of significant figures to 2 figures 
```

## HIV-Pr structure analysis

Here we will read the 1HSG PDB structure and select the protein
component and write out a new

``` r
library(bio3d)

pdb <- read.pdb("1hsg.pdb")
pdb
```

    ## 
    ##  Call:  read.pdb(file = "1hsg.pdb")
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 1686,  XYZs#: 5058  Chains#: 2  (values: A B)
    ## 
    ##      Protein Atoms#: 1514  (residues/Calpha atoms#: 198)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 172  (residues: 128)
    ##      Non-protein/nucleic resid values: [ HOH (127), MK1 (1) ]
    ## 
    ##    Protein sequence:
    ##       PQITLWQRPLVTIKIGGQLKEALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYD
    ##       QILIEICGHKAIGTVLVGPTPVNIIGRNLLTQIGCTLNFPQITLWQRPLVTIKIGGQLKE
    ##       ALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYDQILIEICGHKAIGTVLVGPTP
    ##       VNIIGRNLLTQIGCTLNF
    ## 
    ## + attr: atom, xyz, seqres, helix, sheet,
    ##         calpha, remark, call

``` r
#read.pdb()
#atom.select()
#write.pdb()
#trim.pdb()
```

``` r
ligand <- atom.select(pdb, "ligand", value = TRUE)
write.pdb(ligand, file ="1hsg_ligand.pdb")
```
