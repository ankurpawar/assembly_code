SECTIONS {
	. = 0x00000000;
	.text : {
	      *	(vectors);
	      * (.text);
	}
	.rodata : {
	      * (.rodata);
	}
	flash_data = .;
	
	. = 0xA0000000;
	ram_sdata = .;
	.data : AT (flash_data) {
	      * (.data);
	}
	ram_edata = .;
	data_size = ram_edata - ram_sdata;

	sbss = .;
	.bss : {
	     * (.bss);
	}
	ebss = .;
	bss_size = ebss - sbss;
}
