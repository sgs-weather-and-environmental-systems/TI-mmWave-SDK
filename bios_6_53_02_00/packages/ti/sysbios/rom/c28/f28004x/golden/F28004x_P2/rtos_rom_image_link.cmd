
MEMORY
{
    RTOS_FLASH  : origin = 0x00081010, length = 0x000003df
    RTOS_ROM    : origin = 0x003f7200, length = 0x00001f10
    RTOS_SRAM   : origin = 0x00000780, length = 0x0000006a
}

SECTIONS
{
    sysbios_1: = 0x3f7200
    sysbios_2: = 0x3f90be
    sysbios_3: = 0x3f9110
}
