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
            c'xls_open c'name c'decode
                >>= \p -> if p == nullPtr 
                              then do
                                  throwErrno ("Open " ++ name ++ " Failed!")
                              else do
                                  c'xls_parseWorkBook p
                                  return p

openSheet :: WorkBook -> Int -> IO WorkSheet
openSheet book no = do
    c'xls_getWorkSheet book (fromIntegral no)
        >>= \p -> if p == nullPtr 
                      then do
                          throwErrno ("No Such Sheet")
                      else do
                        c'xls_parseWorkSheet p
                        return p

getCell :: WorkSheet -> Int -> Int -> IO CellData
getCell sheet x y = do
    throwErrnoIfNull "No Such Cell" $ 
        c'xls_cell sheet (fromIntegral x) (fromIntegral y)

showCellInfo :: CellData -> IO ()
showCellInfo c = c'xls_showCell c
