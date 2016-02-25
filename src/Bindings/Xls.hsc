{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "xls.h"
module Bindings.Xls where
import Foreign.Ptr
import Bindings.Xlsstruct
#strict_import

import Bindings.Xlstool
#ccall xls_getVersion , IO CString
#globalvar xls_debug , CInt
#ccall xls , IO CInt
#ccall xls_addSST , Ptr <xlsWorkBook> -> Ptr <SST> -> CUInt -> IO ()
#ccall xls_appendSST , Ptr <xlsWorkBook> -> Ptr CUChar -> CUInt -> IO ()
#ccall xls_addFormat , Ptr <xlsWorkBook> -> Ptr <FORMAT> -> IO ()
#ccall xls_parseWorkBook , Ptr <xlsWorkBook> -> IO ()
#ccall xls_parseWorkSheet , Ptr <xlsWorkSheet> -> IO ()
#ccall xls_open , CString -> CString -> IO (Ptr <xlsWorkBook>)
#ccall xls_close_WB , Ptr <xlsWorkBook> -> IO ()
#ccall xls_getWorkSheet , Ptr <xlsWorkBook> -> CInt -> IO (Ptr <xlsWorkSheet>)
#ccall xls_close_WS , Ptr <xlsWorkSheet> -> IO ()
#ccall xls_row , Ptr <xlsWorkSheet> -> CUShort -> IO (Ptr <st_row_data>)
#ccall xls_cell , Ptr <xlsWorkSheet> -> CUShort -> CUShort -> IO (Ptr <st_cell_data>)
