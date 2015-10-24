SECTIONS {
	. = 0x00000000;
	.text : {
	      * (.text);
	}
	flash_data = .;
	
	. = 0xA0000000;
	ram_sdata = .;
	.data : AT (flash_data) {
	      * (.data);
	}
	ram_edata = .;
	data_size = ram_edata - ram_sdata;
}
