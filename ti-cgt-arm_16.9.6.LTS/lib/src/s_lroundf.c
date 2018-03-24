/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * This code was taken from FreeBSD verbatim, and is clearly a derived
 * work of the FreeBSD file s_lround.c, which carries a full BSD-style
 * copyright and licensing notice.  We presume this file is intended
 * to have the same copyright and licensing.
 */

#define type		float
#define	roundit		roundf
#define dtype		long
#define	DTYPE_MIN	LONG_MIN
#define	DTYPE_MAX	LONG_MAX
#define	fn		lroundf

#include "s_lround.c"
