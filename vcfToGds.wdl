task runGds {
	File vcf
	Int disk
	Float memory

	String out_base = basename(vcf, ".vcf")
	

	command {
		R --vanilla --args ${vcf} ${out_base} < /vcfToGds/vcfToGds.R
	}

	runtime {
		docker: "manninglab/vcftogds:latest"
		disks: "local-disk ${disk} SSD"
		bootDiskSizeGb: 6
		memory: "${memory} GB"
	}

	output {
		File out_file = "${out_base}.gds"
	}
}

workflow w {
	Array[File] vcf_files
	Int this_disk
	Float this_memory

	scatter(this_file in vcf_files) {
		call runGds { 
			input: vcf = this_file, disk = this_disk, memory = this_memory
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