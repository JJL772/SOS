/*

fs.h

Filesystem support

WARNING: THIS FILE IS PART OF THE OS SPEC, THIS SHOULD NOT BE USED AS AN ACTUAL OS HEADER
*/

#include "types.h"
#include "permissions.h"

enum EFilesystemType
{
	fs_ntfs			=   1<<0,
	fs_fat			=	1<<1,
	fs_fat8			=	1<<2,
	fs_fat16		=	1<<3,
	fs_fat32		=	1<<4,
	fs_exfat		=	1<<5,
	ext4			=	1<<6,
	unspecified 	= 	0,
};

struct filesystem_t;

#define FILE_HIDDEN 1<<0
#define FILE_SYSDIR 1<<1

struct file_t
{
	const char* path;
	void* handle;
	uint8 flags;
};

#define DIRECTORY_HIDDEN 1<<0
#define DIRECTORY_SYSDIR 1<<1

struct directory_t
{
	const char* path;
	void* handle;
	uint8 flags;
};

typedef uint8 fl_file_t;
typedef uint8 fl_directory_t;

/*

name: Name of the filesystem to mount
mount_point: Point mount the filesystem at ex. / or /mount/c/

returns: handle to new filesystem (filesystem_t*) or NULL if an error occurred

*/
filesystem_t* fs_mount(const char* name, const char* mount_point);

/*

filesystem: Handle to the filesystem to unmount

returns: 0 for success, 1 for failure. Use get_last_error() to get the last error

*/
int fs_unmount(filesystem_t* filesystem);

/*

filesystem: The mount point of the filesystem to unmount

returns: 0 for success, 1 for failure. Use get_last_error() to get the last error

*/
int fs_unmount(const char* mount_point);

/*
Creates a folder

path: Path to the folder where the folder should be created int
name: Name of the new folder

returns: 0 for success, 1 for failure. Use get_last_error() to get the last error

*/
int fs_create_folder(const char* path, const char* name);

/*
Creates a folder

path: Path to create

returns: 0 for success, 1 for failure. Use get_last_error() to get the last error

*/
int fs_mkdir(const char* path);

/*
Checks if the specified path exists. This can be a folder, file or something else.

path: Path to check for

*/
int fs_exists(const char* path);

/*
Checks if a folder exists

path: Folder to check for


*/
int fs_folder_exists(const char* path);

/*
Checks if a file exists

path: Path to file

*/
int fs_file_exists(const char* path);