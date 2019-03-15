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
#define SMBIOS_ENCLOSURE_INFO_STRUCT_TYPE 3
#define SMBIOS_PROCESSOR_INFO_STRUCT_TYPE 4
#define SMBIOS_CACHE_INFO_STRUCT_TYPE 7
#define SMBIOS_PORT_CONN_INFO_STRUCT_TYPE 8
#define SMBIOS_SYS_SLOTS_STRUCT_TYPE 9
#define SMBIOS_OEM_STRINGS_STRUCT_TYPE 11
#define SMBIOS_SYS_CONFIG_OPTS_STRUCT_TYPE 12
#define SMBIOS_BIOS_LANG_INFO_STRUCT_TYPE 13
#define SMBIOS_GRP_ASSOCIATIONS_INFO_STRUCT_TYPE 14
#define SMBIOS_SYS_EVNT_LOG_INFO_STRUCT_TYPE 15
#define SMBIOS_PHS_MEM_ARR_STRUCT_TYPE 16
#define SMBIOS_MEM_DEVICE_STRUCT_TYPE 17

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
	BYTE anchor[4]; //_SM_
	BYTE checksum;
	BYTE entrypoint_length;
	BYTE major_version;
	BYTE minor_version;
	WORD max_struct_size;
	BYTE entrypoint_revision;
	BYTE formatted_area[5];
	BYTE intermediate_anchor[5]; //_DMI_
	BYTE intermediate_checksum;
	WORD struct_tbl_length;
	DWORD struct_tbl_addr;
	WORD num_structs;
	BYTE bcd_revision;
} smbios_entrypoint_t;

typedef struct smbios_bios_info
{
	BYTE type;
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
	BYTE type;
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
	BYTE type;
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
	BYTE type;
	BYTE length;
	WORD handle;
	BYTE manufacturer;
	BYTE enclosure_type;
	BYTE version;
	BYTE serial_num;
	BYTE asset_tag_num;
	BYTE boot_state;
	BYTE power_state;
	BYTE thermal_state;
	BYTE security_status;
	DWORD oem_defined;
	BYTE height;
	BYTE num_cords;
	BYTE contained_elem_count;
	BYTE contained_elem_length;
	BYTE* contained_elems;
	BYTE sku_num;
} smbios_enclosure_info_t;

typedef struct smbios_processor_info
{
	BYTE type;
	BYTE length;
	WORD handle;
	BYTE socket_designation;
	BYTE processor_type;
	BYTE processor_family;
	BYTE processor_manufacturer;
	QWORD processor_id;
	BYTE processor_version;
	BYTE voltage;
	WORD ext_clock;
	WORD max_speed;
	WORD current_speed;
	BYTE status;
	BYTE processor_upgrade;
	WORD l1_cache_handle;
	WORD l2_cache_handle;
	WORD l3_cache_handle;
	BYTE serial_num;
	BYTE asset_tag;
	BYTE part_num;
	BYTE core_count;
	BYTE core_enabled;
	BYTE thread_count;
	WORD processor_chars;
	WORD processor_family2;
	WORD core_count2;
	WORD core_enabled_2;
	WORD thread_count_2;
} smbios_processor_info_t;

typedef struct smbios_cache_info
{
	BYTE type;
	BYTE length;
	WORD handle;
	BYTE socket_designation;
	WORD cache_config;
	WORD max_cache_size;
	WORD installed_size;
	WORD supported_sram_type;
	WORD current_sram_type;
	BYTE cache_speed;
	BYTE err_correction_type;
	BYTE sys_cache_type;
	BYTE associativity;
	DWORD max_cache_size2;
	DWORD installed_cache_size2;
} smbios_cache_info_t;

typedef struct smbios_port_conn_info
{
	BYTE type;
	BYTE length;
	WORD handle;
	BYTE int_ref_designator;
	BYTE int_conn_type;
	BYTE ext_ref_designator;
	BYTE ext_conn_type;
	BYTE port_type;
} smbios_port_conn_info;

typedef struct smbios_sys_slots
{
	BYTE type;
	BYTE length;
	WORD handle;
	BYTE slot_designation;
	BYTE slot_type;
	BYTE slot_db_width;
	BYTE current_usage;
	BYTE slot_len;
	WORD slot_id;
	BYTE slot_chars;
	BYTE slot_chars2;
	WORD seg_grp_num;
	BYTE bus_num;
	BYTE base_dev_fun_num;
	BYTE base_db_width;
	BYTE peer_grp_count;
	BYTE* peer_grps;
} smbios_sys_slots_t;

typedef struct smbios_oem_strings
{
	BYTE type;
	BYTE length;
	WORD handle;
	BYTE count;
} smbios_oem_strings_t;

typedef struct smbios_sys_config_opts
{
	BYTE type;
	BYTE length;
	WORD handle;
	BYTE count;
} smbios_sys_config_opts_t;

typedef struct smbios_bios_lang_info
{
	BYTE type;
	BYTE length;
	WORD handle;
	BYTE installable_langs;
	BYTE flags;
	BYTE reserved[15];
	BYTE current_lang;
} smbios_bios_lang_info_t;

/*
Ptr to SMBIOS data
*/
struct smbios_entrypoint* os_smbios_entry SECTION_KERNEL_DATA = 0;


/*
Finds the SMBIOS data entries and whatnot
*/
void os_smbios_init();


#endif