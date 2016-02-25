{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "ole.h"
module Bindings.Ole where
import Foreign.Ptr
#strict_import

import Bindings.Xlstypes
{- typedef struct TIME_T {
            DWORD LowDate; DWORD HighDate;
        } TIME_T; -}
#starttype struct TIME_T
#field LowDate , CUInt
#field HighDate , CUInt
#stoptype
{- typedef struct OLE2Header {
            DWORD id[2];
            DWORD clid[4];
            WORD verminor;
            WORD verdll;
            WORD byteorder;
            WORD lsectorB;
            WORD lssectorB;
            WORD reserved1;
            DWORD reserved2;
            DWORD reserved3;
            DWORD cfat;
            DWORD dirstart;
            DWORD reserved4;
            DWORD sectorcutoff;
            DWORD sfatstart;
            DWORD csfat;
            DWORD difstart;
            DWORD cdif;
            DWORD MSAT[109];
        } OLE2Header; -}
#starttype struct OLE2Header
#array_field id , CUInt
#array_field clid , CUInt
#field verminor , CUShort
#field verdll , CUShort
#field byteorder , CUShort
#field lsectorB , CUShort
#field lssectorB , CUShort
#field reserved1 , CUShort
#field reserved2 , CUInt
#field reserved3 , CUInt
#field cfat , CUInt
#field dirstart , CUInt
#field reserved4 , CUInt
#field sectorcutoff , CUInt
#field sfatstart , CUInt
#field csfat , CUInt
#field difstart , CUInt
#field cdif , CUInt
#array_field MSAT , CUInt
#stoptype
{- typedef struct {
            char * name; DWORD start; DWORD size;
        } st_olefiles_data; -}
#starttype st_olefiles_data
#field name , CString
#field start , CUInt
#field size , CUInt
#stoptype
{- typedef struct st_olefiles {
            long count; st_olefiles_data * file;
        } st_olefiles; -}
#starttype struct st_olefiles
#field count , CLong
#field file , Ptr <st_olefiles_data>
#stoptype
{- typedef struct OLE2 {
            FILE * file;
            WORD lsector;
            WORD lssector;
            DWORD cfat;
            DWORD dirstart;
            DWORD sectorcutoff;
            DWORD sfatstart;
            DWORD csfat;
            DWORD difstart;
            DWORD cdif;
            DWORD * SecID;
            DWORD * SSecID;
            BYTE * SSAT;
            st_olefiles files;
        } OLE2; -}
#opaque_t _IO_FILE
#starttype struct OLE2
#field file , Ptr <struct _IO_FILE>
#field lsector , CUShort
#field lssector , CUShort
#field cfat , CUInt
#field dirstart , CUInt
#field sectorcutoff , CUInt
#field sfatstart , CUInt
#field csfat , CUInt
#field difstart , CUInt
#field cdif , CUInt
#field SecID , Ptr CUInt
#field SSecID , Ptr CUInt
#field SSAT , Ptr CUChar
#field files , <struct st_olefiles>
#stoptype
{- typedef struct OLE2Stream {
            OLE2 * ole;
            DWORD start;
            DWORD pos;
            int cfat;
            int size;
            DWORD fatpos;
            BYTE * buf;
            DWORD bufsize;
            BYTE eof;
            BYTE sfat;
        } OLE2Stream; -}
#starttype struct OLE2Stream
#field ole , Ptr <struct OLE2>
#field start , CUInt
#field pos , CUInt
#field cfat , CInt
#field size , CInt
#field fatpos , CUInt
#field buf , Ptr CUChar
#field bufsize , CUInt
#field eof , CUChar
#field sfat , CUChar
#stoptype
{- typedef struct PSS {
            BYTE name[64];
            WORD bsize;
            BYTE type;
            BYTE flag;
            DWORD left;
            DWORD right;
            DWORD child;
            WORD guid[8];
            DWORD userflags;
            TIME_T time[2];
            DWORD sstart;
            DWORD size;
            DWORD proptype;
        } PSS; -}
#starttype struct PSS
#array_field name , CUChar
#field bsize , CUShort
#field type , CUChar
#field flag , CUChar
#field left , CUInt
#field right , CUInt
#field child , CUInt
#array_field guid , CUShort
#field userflags , CUInt
#array_field time , <struct TIME_T>
#field sstart , CUInt
#field size , CUInt
#field proptype , CUInt
#stoptype
#ccall ole2_read , Ptr () -> CLong -> CLong -> Ptr <struct OLE2Stream> -> IO CInt
#ccall ole2_sopen , Ptr <struct OLE2> -> CUInt -> CInt -> IO (Ptr <struct OLE2Stream>)
#ccall ole2_seek , Ptr <struct OLE2Stream> -> CUInt -> IO ()
#ccall ole2_fopen , Ptr <struct OLE2> -> CString -> IO (Ptr <struct OLE2Stream>)
#ccall ole2_fclose , Ptr <struct OLE2Stream> -> IO ()
#ccall ole2_open , CString -> CString -> IO (Ptr <struct OLE2>)
#ccall ole2_close , Ptr <struct OLE2> -> IO ()
#ccall ole2_bufread , Ptr <struct OLE2Stream> -> IO ()
