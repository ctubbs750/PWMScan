# PWMScan

A Snakemake module for installing core programs from the PWMScan software suite. 

# Notes

This module is designed to be incorporated into an existing Snakemake pipeline for integrative analysis. To use it, you can point towards its Snakefile raw url during module import:

`https://raw.githubusercontent.com/ctubbs750/PWMScan/main/workflow/Snakefile`

 By default, it will compile the matrix_prob and matrix_scan scripts into the existing project directory under:

 `resources/software/PWMScan`

 For this module to function, it will look for paramters under the `PWMScan` tag in config file.  Copy and paste the config parameters found in `/config/config.yaml` into the desired project's config file.