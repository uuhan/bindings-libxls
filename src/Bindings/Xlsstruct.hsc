{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "xlsstruct.h"
module Bindings.Xlsstruct where
import Foreign.Ptr
import Bindings.Ole
#strict_import

#starttype BOF
#field id , CUShort
#field size , CUShort
#stoptype
#starttype BIFF
#field ver , CUShort
#field type , CUShort
#field id_make , CUShort
#field year , CUShort
#field flags , CUInt
#field min_ver , CUInt
#array_field buf , CUChar
#stoptype
#starttype WIND1
#field xWn , CUShort
#field yWn , CUShort
#field dxWn , CUShort
#field dyWn , CUShort
#field grbit , CUShort
#field itabCur , CUShort
#field itabFirst , CUShort
#field ctabSel , CUShort
#field wTabRatio , CUShort
#stoptype
{- #starttype BOUNDSHEET -}
{- #field filepos , CUInt -}
{- #field type , CUChar -}
{- #field visible , CUChar -}
{- #array_field name , CUChar -}
{- #stoptype -}
#starttype ROW
#field index , CUShort
#field fcell , CUShort
#field lcell , CUShort
#field height , CUShort
#field notused , CUShort
#field notused2 , CUShort
#field flags , CUShort
#field xf , CUShort
#stoptype

#starttype COL
#field row , CUShort
#field col , CUShort
#field xf , CUShort
#stoptype

{- #starttype FORMULA -}
{- #field row , CUShort -}
{- #field col , CUShort -}
{- #field xf , CUShort -}
{- #field resid , CUChar -}
{- #array_field resdata , CUChar -}
{- #field res , CUShort -}
{- #field flags , CUShort -}
{- #array_field chn , CUChar -}
{- #field len , CUShort -}
{- #array_field value , CUChar -}
{- #stoptype -}

{- #starttype RK -}
{- #field row , CUShort -}
{- #field col , CUShort -}
{- #field xf , CUShort -}
{- #array_field value , CUChar -}
{- #stoptype -}

{- #starttype LABELSST -}
{- #field row , CUShort -}
{- #field col , CUShort -}
{- #field xf , CUShort -}
{- #array_field value , CUChar -}
{- #stoptype -}

#starttype BLANK
#field row , CUShort
#field col , CUShort
#field xf , CUShort
#stoptype

{- #starttype LABEL -}
{- #field row , CUShort -}
{- #field col , CUShort -}
{- #field xf , CUShort -}
{- #array_field value , CUChar -}
{- #stoptype -}

#starttype SST
#field num , CUInt
#field numofstr , CUInt
#field strings , CUChar
#stoptype
{- #starttype XF5 -}
{- #field font , CUShort -}
{- #field format , CUShort -}
{- #field type , CUShort -}
{- #field align , CUShort -}
{- #field color , CUShort -}
{- #field fill , CUShort -}
{- #field border , CUShort -}
{- #field linestyle , CUShort -}
{- #stoptype -}
#starttype XF8
#field font , CUShort
#field format , CUShort
#field type , CUShort
#field align , CUChar
#field rotation , CUChar
#field ident , CUChar
#field usedattr , CUChar
#field linestyle , CUInt
#field linecolor , CUInt
#field groundcolor , CUShort
#stoptype
{- #starttype BR_NUMBER -}
{- #field row , CUShort -}
{- #field col , CUShort -}
{- #field xf , CUShort -}
{- #field value , CDouble -}
{- #stoptype -}
{- #starttype COLINFO -}
{- #field first , CUShort -}
{- #field last , CUShort -}
{- #field width , CUShort -}
{- #field xf , CUShort -}
{- #field flags , CUShort -}
{- #field notused , CUShort -}
{- #stoptype -}
{- #starttype MERGEDCELLS -}
{- #field rowf , CUShort -}
{- #field rowl , CUShort -}
{- #field colf , CUShort -}
{- #field coll , CUShort -}
{- #stoptype -}
{- #starttype FONT -}
{- #field height , CUShort -}
{- #field flag , CUShort -}
{- #field color , CUShort -}
{- #field bold , CUShort -}
{- #field escapement , CUShort -}
{- #field underline , CUChar -}
{- #field family , CUChar -}
{- #field charset , CUChar -}
{- #field notused , CUChar -}
{- #field name , CUChar -}
{- #stoptype -}
#starttype FORMAT
#field index , CUShort
#array_field value , CUChar
#stoptype
#starttype st_sheet_data
#field filepos , CUInt
#field visibility , CUChar
#field type , CUChar
#field name , CString
#stoptype
#starttype st_sheet
#field count , CUInt
#field sheet , Ptr <st_sheet_data>
#stoptype
#starttype st_font_data
#field height , CUShort
#field flag , CUShort
#field color , CUShort
#field bold , CUShort
#field escapement , CUShort
#field underline , CUChar
#field family , CUChar
#field charset , CUChar
#field name , CString
#stoptype
#starttype st_font
#field count , CUInt
#field font , Ptr <st_font_data>
#stoptype
#starttype st_format_data
#field index , CUShort
#field value , CString
#stoptype
#starttype st_format
#field count , CUInt
#field format , Ptr <st_format_data>
#stoptype

#starttype st_xf_data
#field font , CUShort
#field format , CUShort
#field type , CUShort
#field align , CUChar
#field rotation , CUChar
#field ident , CUChar
#field usedattr , CUChar
#field linestyle , CUInt
#field linecolor , CUInt
#field groundcolor , CUShort
#stoptype

#starttype st_xf
#field count , CUInt
#field xf , <st_xf_data>
#stoptype

#starttype str_sst_string
#field str , CString
#stoptype

#starttype st_sst
#field count , CUInt
#field lastid , CUInt
#field continued , CUInt
#field lastln , CUInt
#field lastrt , CUInt
#field lastsz , CUInt
#field string , Ptr <str_sst_string>
#stoptype

#starttype st_cell_data
#field id , CUShort
#field row , CUShort
#field col , CUShort
#field xf , CUShort
#field d , CDouble
#field l , CLong
#field str , CString
#field ishiden , CUChar
#field width , CUShort
#field colspan , CUShort
#field rowspan , CUShort
#stoptype

#starttype st_cell
#field count , CUInt
#field cell , Ptr <st_cell_data>
#stoptype

#starttype st_row_data
#field index , CUShort
#field fcell , CUShort
#field lcell , CUShort
#field height , CUShort
#field flags , CUShort
#field xf , CUShort
#field xfflags , CUChar
#field cells , <st_cell>
#stoptype

#starttype st_row
#field lastcol , CUShort
#field lastrow , CUShort
#field row , Ptr <st_row_data>
#stoptype

#starttype st_colinfo_data
#field first , CUShort
#field last , CUShort
#field width , CUShort
#field xf , CUShort
#field flags , CUShort
#stoptype

#starttype st_colinfo
#field count , CUInt
#field col , Ptr <st_colinfo_data>
#stoptype

#starttype xlsWorkBook
#field olestr , Ptr <struct OLE2Stream>
#field filepos , CLong
#field is5ver , CUChar
#field type , CUShort
#field codepage , CUShort
#field charset , CString
#field sheets , <st_sheet>
#field sst , <st_sst>
#field xfs , <st_xf>
#field fonts , <st_font>
#field formats , <st_format>
#field summary , CString
#field docSummary , CString
#stoptype

#starttype xlsWorkSheet
#field filepos , CUInt
#field defcolwidth , CUShort
#field rows , <st_row>
#field workbook , Ptr <xlsWorkBook>
#field colinfo , <st_colinfo>
#field maxcol , CUShort
#stoptype

#synonym_t xlsCell , <st_cell_data>

#synonym_t xlsRow , <st_row_data>

#starttype xlsSummaryInfo
#field title , CString
#field subject , CString
#field author , CString
#field keywords , CString
#field comment , CString
#field lastAuthor , CString
#field appName , CString
#field category , CString
#field manager , CString
#field company , CString
#stoptype
