#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "config.h"
#include<sys/statfs.h>
#ifdef __cplusplus
}
#endif

typedef struct statfs Statfs;

MODULE = Filesys::Statfs	PACKAGE = Filesys::Statfs

void
statfs(dir)
	char *dir
	PREINIT:
	Statfs st;
	Statfs *st_ptr;
	PPCODE:
	if(statfs(dir, &st) == 0) {
		st_ptr = &st;
		EXTEND(sp, 15);
		PUSHs(sv_2mortal(newSViv(st_ptr->f_type)));
		PUSHs(sv_2mortal(newSViv(st_ptr->f_bsize)));
		PUSHs(sv_2mortal(newSViv(st_ptr->f_blocks)));
		PUSHs(sv_2mortal(newSViv(st_ptr->f_bfree)));
		PUSHs(sv_2mortal(newSViv(st_ptr->f_bavail)));
		PUSHs(sv_2mortal(newSViv(st_ptr->f_files)));
		PUSHs(sv_2mortal(newSViv(st_ptr->f_ffree)));
	}
