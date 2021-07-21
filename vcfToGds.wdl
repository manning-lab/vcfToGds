version 1.0
task runGds {
	input {
		File vcf
		Int? disk
		Float? memory
		Int? preemptible
	}
	
	command {
		R --vanilla --args ~{vcf} < /vcfToGds/vcfToGds.R
	}

	runtime {
		docker: "quay.io/manninglab/vcftogds:latest"
		disks: "local-disk ~{disk} HDD"
		bootDiskSizeGb: 6
		memory: "~{memory} GB"
		preemptible: "~{preemptible}"
	}

	output {
		File out_file = select_first(glob("*.gds"))
	}
}

workflow vcfToGds_wf {
	input {
		Array[File] vcf_files
		Int? disk = 100
		Float? memory = 20
		Int? preemptible = 0
	}
	
	scatter(this_file in vcf_files) {
		call runGds { 
			input: vcf = this_file, disk = disk, memory = memory, preemptible = preemptible
		}
	}

	output {
		Array[File] gds_files = runGds.out_file
	}

	meta {
        author: "Tim Majarian"
        email: "tmajaria@broadinstitute.org"
        description: "Convert a VCF file to a GDS file using the Seq Array package."
    }

    parameter_meta {
    	vcf_files: "Array of files, with extensions: .vcf, .vcf.gz, or .vcf.bgz"
    	disk: "Runtime parameter; amount of disk space to provision in gigabytes. Default: 100GB."
    	memory: "Runtime parameter; amount of memory to provision in gigabytes. Default: 20GB."
    	preemptible: "Runtime parameter; whether to use preemptible machines. Default: 0 (no)."
    }
}
