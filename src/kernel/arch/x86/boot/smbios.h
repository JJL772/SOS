/*

smbios.h

SMBios structure/procedure definitions

*/
#ifndef _SMBIOS_H_
#define _SMBIOS_H_

#include "../common.h"

#define SMBIOS_BIOS_INFO_STRUCT_TYPE 0
#define SMBIOS_SYS_INFO_STRUCT_TYPE 1
#define SMBIOS_MOD_INFO_STRUCT_TYPE 2

typedef struct smbios_uuid
{
	DWORD time_low;
	WORD time_mid;
	WORD time_hi_version;
	BYTE clock_seq_hi_res;
	BYTE clock_seq_low;
	BYTE node[6];
} smbios_uuid_t;

typedef struct smbios_entrypoint
{
	const BYTE anchor[4] = {0x5F, 0x53, 0x4D, 0x5F}; //_SM_
	BYTE checksum;
	BYTE entrypoint_length;
	BYTE major_version;
	BYTE minor_version;
	WORD max_struct_size;
	BYTE entrypoint_revision;
	BYTE formatted_area[5];
	BYTE intermediate_anchor[5] = {0x5F, 0x44, 0x4D, 0x49, 0x5F}; //_DMI_
	BYTE intermediate_checksum;
	WORD struct_tbl_length;
	DWORD struct_tbl_addr;
	WORD num_structs;
	BYTE bcd_revision;
} smbios_entrypoint_t;

typedef struct smbios_bios_info
{
	const BYTE type = SMBIOS_BIOS_INFO_STRUCT_TYPE;
	BYTE length;
	WORD handle;
	BYTE vendor_string;
	BYTE bios_version;
	WORD bios_start_addr;
	BYTE bios_release_date;
	BYTE bios_rom_size;
	QWORD bios_character;
	WORD bios_character_ext;
	BYTE bios_major_release;
	BYTE bios_minor_release;
	BYTE controller_firmare_major_release;
	BYTE controller_firmare_minor_release;
	WORD ext_bios_rom_size;
} smbios_bios_info_t;

typedef struct smbios_system_info
{
	const BYTE type = SMBIOS_SYS_INFO_STRUCT_TYPE;
	BYTE length;
	WORD handle;
	BYTE manufacturer;
	BYTE product_name;
	BYTE version;
	BYTE serial_num;
	smbios_uuid_t uuid;
	BYTE wakeup_type;
	BYTE sku_number;
	BYTE family;
} smbios_system_info_t;


typedef struct smbios_module_info
{
	const BYTE type = SMBIOS_MOD_INFO_STRUCT_TYPE;
	BYTE length;
	WORD handle;
	BYTE manufacturer;
	BYTE product;
	BYTE version;
	BYTE serial_num;
	BYTE ass_tag;
	BYTE feature_flags;
	BYTE loc_in_chasis;
	WORD chasis_handle;
	BYTE board_type;
	BYTE contained_handles;
	WORD handles; //Offset of first handle
} smbios_module_info_t;

typedef struct smbios_enclosure_info
{
	
} smbios_enclosure_info_t;


#endif