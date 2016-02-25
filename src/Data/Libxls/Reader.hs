module Data.Libxls.Reader where

import Bindings.Xls
import Bindings.Xlsstruct
import Bindings.Xlstool

import Foreign.Ptr
import Foreign.C.String
import Foreign.C.Types
import Foreign.C.Error

type WorkBook = Ptr C'xlsWorkBook
type WorkSheet = Ptr C'xlsWorkSheet
type Cells = Ptr C'st_cell
type CellData = Ptr C'st_cell_data

openBook :: String -> String -> IO WorkBook
openBook name e = do
    withCString name $ \c'name -> do
        withCString e $ \c'decode -> do
            throwErrnoIfNull ("Open " ++ name ++ "Failed!")
                (do 
                    wb <- c'xls_open c'name c'decode
                    c'xls_parseWorkBook wb
                    return wb
                    )

openSheet :: WorkBook -> Int -> IO WorkSheet
openSheet book no = do
    throwErrnoIfNull "No Such Sheet" $ 
        (do 
            st <- c'xls_getWorkSheet book (fromIntegral no)
            c'xls_parseWorkSheet st
            return st
            )

getCell :: WorkSheet -> Int -> Int -> IO CellData
getCell sheet x y = do
    throwErrnoIfNull "No Such Cell" $ 
        c'xls_cell sheet (fromIntegral x) (fromIntegral y)

showCellInfo :: CellData -> IO ()
showCellInfo c = c'xls_showCell c
