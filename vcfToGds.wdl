version 1.0

task runGds {
	input {
		File vcf
		Int disk
		Float memory
	}
	
	command {
		set -eux -o pipefail

		echo "Calling R script"

		R --vanilla --args ~{vcf} < /vcfToGds/vcfToGds.R
	}

	runtime {
		docker: "manninglab/vcftogds:latest"
		disks: "local-disk ${disk} SSD"
		bootDiskSizeGb: 6
		memory: "${memory} GB"
	}

	output {
		Array[File] out_file = glob("*.gds")
	}
}

workflow vcfToGds_wf {
	input {
		Array[File] vcf_files
		Int this_disk
		Float this_memory
	}

	scatter(vcf_file in vcf_files) {
		call runGds {
			input:
				vcf = vcf_file,
				disk = this_disk,
				memory = this_memory
		}
	}

	meta {
		author: "Tim Majarian"
		email: "tmajaria@broadinstitute.org"
	}
}