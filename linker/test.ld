/*======================================================================*/
/* Proxy kernel linker script                                           */
/*======================================================================*/
/* This is the linker script used when building the proxy kernel. */

/*----------------------------------------------------------------------*/
/* Setup                                                                */
/*----------------------------------------------------------------------*/

/* The OUTPUT_ARCH command specifies the machine architecture where the
   argument is one of the names used in the BFD library. More
   specifically one of the entires in bfd/cpu-mips.c */

OUTPUT_ARCH( "riscv" )
ENTRY(_start)

/*----------------------------------------------------------------------*/
/* MEMORY                                                             */
/*----------------------------------------------------------------------*/
MEMORY 
{
  ram (rwxa) : ORIGIN = 0x80100000, LENGTH = 16M
  spramb (rw) : ORIGIN = 0xa0000000, LENGTH = 512K
  sprama (rw) : ORIGIN = 0xb0000000, LENGTH = 16K
}

/*----------------------------------------------------------------------*/
/* Sections                                                             */
/*----------------------------------------------------------------------*/
SECTIONS
{

  /* text: test code section */
  . = ORIGIN(ram);
  .text : { 
    *(entry)
    *(.text*) 
  } > ram
  etext = .;
  _etext = .;

  /* data segment */
  .rodata : {
    . = ALIGN(64);
    *(.rodata*) 
  } > spramb

  .data : { 
    *(.data) 
    PROVIDE(edata = .);
    PROVIDE(_data = .);
    . = ALIGN(8);
    __global_pointer$ = . + 0x800;
  } > spramb

  /* bss segment */
  .bss : { 
    *(.bss) 
    *(.sbss*)
    *(.scommon)
    . = ALIGN(4);
    PROVIDE(edata = .);
    PROVIDE(_data = .);
  } > spramb

 /* thread-local data segment */
  .tdata :
  {
    _tdata_begin = .;
    *(.tdata)
    _tdata_end = .;
  }  > spramb
  .tbss :
  {
    *(.tbss)
    _tbss_end = .;
  }  > spramb

  /* End of uninitalized data segement */
  _end = .;
  . = ALIGN(0x1000);

  .htif 0xa007ff00 : {
    *(.htif)
  } > spramb
}