task runGds {
	File vcf
	Int disk
	Float memory
	Int preemptible
	

	command {
		R --vanilla --args ${vcf} < /vcfToGds/vcfToGds.R
	}

	runtime {
		docker: "manninglab/vcftogds:latest"
		disks: "local-disk ${disk} SSD"
		bootDiskSizeGb: 6
		memory: "${memory} GB"
		preemptible: "${preemptible}"
	}

	output {
		File out_file = select_first(glob("*.gds"))
	}
}

workflow vcfToGds_wf {
	Array[File] vcf_files
	Int this_disk
	Float this_memory
	Int? preemptible = 0

	scatter(this_file in vcf_files) {
		call runGds { 
			input: vcf = this_file, disk = this_disk, memory = this_memory, preemptible = preemptible
		}
	}

	output {
		Array[File] gds_files = runGds.out_file
	}

	meta {
        author: "Tim Majarian"
        email: "tmajaria@broadinstitute.org"
        description: "Convert a VCF file to a GDS file."
    }
}
