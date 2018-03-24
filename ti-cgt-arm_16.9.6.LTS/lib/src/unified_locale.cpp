/*****************************************************************************/
/* unified_locale.cpp v16.9.6                                                */
/*                                                                           */
/* Copyright (c) 2014-2017 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/

/*****************************************************************************/
/* Forward inclusions to ensure that headers are parsed as expected when     */
/* C++ style C headers and C headers conflict.                               */
/*****************************************************************************/
#include <wchar.h>

/*****************************************************************************/
/* Locale Core                                                               */
/*****************************************************************************/
#include "locale.cpp"
#include "locale_catalog.cpp"
#include "locale_impl.cpp"
#include "c_locale.cpp"

/*****************************************************************************/
/* Locale Components                                                         */
/*****************************************************************************/
#include "codecvt.cpp"
#include "collate.cpp"
#include "facets_byname.cpp"
#include "messages.cpp"
#include "monetary.cpp"
#include "num_get.cpp"
#include "num_put.cpp"
#include "num_get_float.cpp"
#include "num_put_float.cpp"
#include "numpunct.cpp"
#include "time_facets.cpp"

/*****************************************************************************/
/* Intertwined IOStream Components                                           */
/*****************************************************************************/
#include "ios.cpp"
#include "iostream.cpp"
#include "fstream.cpp"
#include "stdio_streambuf.cpp"
#include "strstream.cpp"
