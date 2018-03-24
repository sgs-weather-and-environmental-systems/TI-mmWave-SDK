/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*
 *  ======== elf.h ========
 */
#ifndef ELF_
#define ELF_    1

/*
 *  ======== Elf32_Handle ========
 */
typedef struct Elf32_Object *Elf32_Handle;

typedef Bits32  Elf32_Addr;
typedef Bits16  Elf32_Half;
typedef Bits32  Elf32_Off;
typedef Bits32  Elf32_Word;
typedef Int32   Elf32_Sword;

/*
 *  ======== Elf32_Ehdr ========
 */
#define Elf32_EI_NIDENT 16
typedef struct {
    unsigned char e_ident[Elf32_EI_NIDENT];
    Elf32_Half e_type;
    Elf32_Half e_machine;
    Elf32_Word e_version;
    Elf32_Addr e_entry;
    Elf32_Off e_phoff;
    Elf32_Off e_shoff;
    Elf32_Word e_flags;
    Elf32_Half e_ehsize;
    Elf32_Half e_phentsize;
    Elf32_Half e_phnum;
    Elf32_Half e_shentsize;
    Elf32_Half e_shnum;
    Elf32_Half e_shstrndx;
} Elf32_Ehdr;

/* e_type values */
#define Elf32_ET_NONE 0         /* No file type */
#define Elf32_ET_REL 1          /* Relocatable file */
#define Elf32_ET_EXEC 2         /* Executable file */
#define Elf32_ET_DYN 3          /* Shared object file */
#define Elf32_ET_CORE 4         /* Core file */
#define Elf32_ET_LOPROC 0xff00  /* Processor-specific */
#define Elf32_ET_HIPROC 0xffff  /* Processor-specific */

/* e_machine values */
#define Elf32_ET_NONE 0         /* No machine */
#define Elf32_EM_M32 1          /* AT&T WE 32100 */
#define Elf32_EM_SPARC 2        /* SPARC */
#define Elf32_EM_386 3          /* Intel Architecture */
#define Elf32_EM_68K 4          /* Motorola 68000 */
#define Elf32_EM_88K 5          /* Motorola 88000 */
#define Elf32_EM_860 7          /* Intel 80860 */
#define Elf32_EM_MIPS 8         /* MIPS RS3000 Big-Endian */
#define Elf32_EM_MIPS_RS4_BE 10 /* MIPS RS4000 Big-Endian */

#define Elf32_EM_ARM 40         /* Advanced RISC Machines ARM */

#define Elf32_EM_MSP430   105   /* Texas Instruments msp430*/
#define Elf32_EM_TI_C6000 140   /* Texas Instruments TMS320C6000 DSP family */
#define Elf32_EM_TI_C2000 141   /* Texas Instruments TMS320C2000 DSP family */
#define Elf32_EM_TI_C5500 142   /* Texas Instruments TMS320C55x DSP family */
#define Elf32_EM_TI_T16   143   /* Texas Instruments T16 family */

/* e_version values */
#define Elf32_EV_NONE 0         /* Invalid version */
#define Elf32_EV_CURRENT 1      /* Current version */

/* elf ids (http://uw714doc.sco.com/en/SDK_cprog/OF_ELFID.html) */
#define Elf32_EI_MAG0 0         /* File identification */
#define Elf32_EI_MAG1 1         /* File identification */
#define Elf32_EI_MAG2 2         /* File identification */
#define Elf32_EI_MAG3 3         /* File identification */
#define Elf32_EI_CLASS 4        /* File class */
#define Elf32_EI_DATA 5         /* Data encoding */
#define Elf32_EI_VERSION 6      /* File version */
#define Elf32_EI_OSABI 7        /* Operating system / ABI */
#define Elf32_EI_ABIVERSION 8   /* ABI version */
#define Elf32_EI_PAD 9          /* Start of padding bytes */
#define Elf32_EI_NIDENT 16      /* Size of e_ident[] */

typedef enum {
    ELFDATANONE = 0,  /* Invalid data encoding */
    ELFDATA2LSB = 1,  /* Little-endian data    */
    ELFDATA2MSB = 2   /* Big-endian data       */
} Elf32_EI_Data;

/* EI_CLASS values */
#define Elf32_ELFCLASSNONE  0   /* Invalid class */
#define Elf32_ELFCLASS32    1   /* 32-bit objects */
#define Elf32_ELFCLASS64    2   /* 64-bit objects */

/* EI_DATA values */
#define Elf32_ELFDATANONE 0     /* Invalid data encoding */
#define Elf32_ELFDATA2LSB 1     /* LSB occupies the lowest address */
#define Elf32_ELFDATA2MSB 2     /* MSB occupies the lowest address */

/* elf magic numbers */
#define Elf32_ELFMAG0 0x7f      /* e_ident[EI_MAG0] */
#define Elf32_ELFMAG1 'E'       /* e_ident[EI_MAG1] */
#define Elf32_ELFMAG2 'L'       /* e_ident[EI_MAG2] */
#define Elf32_ELFMAG3 'F'       /* e_ident[EI_MAG3] */

#define Elf32_SHN_UNDEF 0
#define Elf32_SHN_LORESERVE 0xff00
#define Elf32_SHN_LOPROC 0xff00
#define Elf32_SHN_HIPROC 0xff1f
#define Elf32_SHN_ABS 0xfff1
#define Elf32_SHN_COMMON 0xfff2
#define Elf32_SHN_HIRESERVE 0xffff

/*
 *  ======== Elf32_Shdr ========
 */
typedef struct {
    Elf32_Word sh_name;
    Elf32_Word sh_type;
    Elf32_Word sh_flags;
    Elf32_Addr sh_addr;
    Elf32_Off sh_offset;
    Elf32_Word sh_size;
    Elf32_Word sh_link;
    Elf32_Word sh_info;
    Elf32_Word sh_addralign;
    Elf32_Word sh_entsize;
} Elf32_Shdr;

/* section types */
#define Elf32_SHT_NULL 0
#define Elf32_SHT_PROGBITS 1
#define Elf32_SHT_SYMTAB 2
#define Elf32_SHT_STRTAB 3
#define Elf32_SHT_RELA 4
#define Elf32_SHT_HASH 5
#define Elf32_SHT_DYNAMIC 6
#define Elf32_SHT_NOTE 7
#define Elf32_SHT_NOBITS 8
#define Elf32_SHT_REL 9
#define Elf32_SHT_SHLIB 10
#define Elf32_SHT_DYNSYM 11
#define Elf32_SHT_LOPROC 0x70000000
#define Elf32_SHT_HIPROC 0x7fffffff
#define Elf32_SHT_LOUSER 0x80000000
#define Elf32_SHT_HIUSER 0xffffffff

/* section flags */
#define Elf32_SHF_WRITE     (1 << 0)    /* Writable */
#define Elf32_SHF_ALLOC     (1 << 1)    /* Occupies memory during execution */
#define Elf32_SHF_EXECINSTR (1 << 2)    /* Executable */
#define Elf32_SHF_MASKPROC  0xf0000000  /* Processor-specific */

/*
 *  ======== Elf32_create ========
 */
extern Elf32_Handle Elf32_create(String fileName, String *status);

/*
 *  ======== Elf32_delete ========
 */
extern Void Elf32_delete(Elf32_Handle elf);

/*
 *  ======== Elf32_getEhdr ========
 */
extern String Elf32_getEhdr(Elf32_Handle elf, Elf32_Ehdr *ehdr);

/*
 *  ======== Elf32_getShdr ========
 */
extern String Elf32_getShdr(Elf32_Handle elf, Int sNum, Elf32_Shdr *sHdr);

/*
 *  ======== Elf32_getShdrByName ========
 */
extern String Elf32_getShdrByName(Elf32_Handle elf, String name,
    Elf32_Shdr *sHdr, Int *sNum);

/*
 *  ======== Elf32_getSName ========
 */
extern String Elf32_getSName(Elf32_Handle elf, Elf32_Shdr *shdr);

/*
 *  ======== Elf32_getSize ========
 */
extern String Elf32_getSize(Elf32_Handle elf, Long *size);

/*
 *  ======== Elf32_read ========
 */
extern Bool Elf32_read(Elf32_Handle elf, Elf32_Off off, Char *buf, SizeT n);

/*
 *  ======== Elf32_readSect ========
 */
extern Char *Elf32_readSect(Elf32_Handle elf, Int sNum);

/*
 *  ======== Elf32_redefineSect ========
 */
extern String Elf32_redefineSect(Elf32_Handle elf, Int sNum, String fileName);

/*
 *  ======== Elf32_writeSect ========
 */
extern Int Elf32_writeSect(Elf32_Handle elf, Int sNum, Char *buf, Int len);

#endif
/*
 *  @(#) ti.targets.omf.elf; 1,0,0,0; 11-8-2017 18:02:11; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

