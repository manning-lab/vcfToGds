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
}