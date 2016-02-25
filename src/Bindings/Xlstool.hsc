{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "xlstool.h"
module Bindings.Xlstool where
import Foreign.Ptr
#strict_import

import Bindings.Xlsstruct
{- #globalvar colors , CUInt -}
#ccall dumpbuf , CString -> CLong -> Ptr CUChar -> IO ()
#ccall verbose , CString -> IO ()
#ccall unicode_decode , Ptr CUChar -> CInt -> Ptr CInt -> CString -> IO CString
#ccall get_string , Ptr CUChar -> CUChar -> CUChar -> CString -> IO CString
#ccall xls_getColor , CUShort -> CUShort -> IO CUInt
#ccall xls_showBookInfo , Ptr <xlsWorkBook> -> IO ()
#ccall xls_showROW , Ptr <st_row_data> -> IO ()
#ccall xls_showColinfo , Ptr <st_colinfo_data> -> IO ()
#ccall xls_showCell , Ptr <st_cell_data> -> IO ()
#ccall xls_showFont , Ptr <st_font_data> -> IO ()
#ccall xls_showXF , Ptr <XF8> -> IO ()
#ccall xls_showFormat , Ptr <st_format_data> -> IO ()
#ccall xls_getfcell , Ptr <xlsWorkBook> -> Ptr <st_cell_data> -> IO CString
#ccall xls_getCSS , Ptr <xlsWorkBook> -> IO CString
#ccall xls_showBOF , Ptr <BOF> -> IO ()
