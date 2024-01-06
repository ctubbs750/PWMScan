from snakemake.utils import min_version


# Configuration
configfile: "config/config.yaml"


# Parameters
MATRIX_PROB = config["matrix_prob"]
MATRIX_SCAN = config["matrix_scan"]

# Settings
min_version("7.32.4")


rule all:
    input:
        "resources/software/PWMScan/matrix_prob",
        "resources/software/PWMScan/matrix_scan",
    default_target: True


rule compile_pwmscan:
    message:
        """
        Compiles PWMScan. Note c99 flag.
        Installs into resources/software by default.
        """
    input:
        prob=workflow.source_path(f"../../{MATRIX_PROB}"),
        scan=workflow.source_path(f"../../{MATRIX_SCAN}"),
    output:
        compiled_prob="resources/software/PWMScan/matrix_prob",
        compiled_scan="resources/software/PWMScan/matrix_scan",
    log:
        stdout="workflow/logs/compile_pwmscan.stdout",
        stderr="workflow/logs/compile_pwmscan.stderr",
    conda:
        "../envs/pwmscan.yaml"
    threads: 1
    shell:
        """
        gcc -std=c99 -o {output.compiled_prob} {input.prob}
        gcc -std=c99 -o {output.compiled_scan} {input.scan}
        """
