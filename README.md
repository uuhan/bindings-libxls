### libxls可用来读取xls格式文档。

```shell
cabal configure
cabal build
cabal install
cabal repl --ghc-options=-Llib --ghc-options=-lxlsreader
```

openBook :: String -> String -> IO WorkBook
            |         |
            xls文档   解码方式(UTF-8 ASCII)

openSheet :: WorkBook -> Int -> IO WorkSheet
                         |
                         sheet号码

getCell :: WorkSheet -> Int -> Int -> IO CellData
                        |      |
                        x      y

showCellInfo :: CellData -> IO ()

更多用法请参考 Bindings.Libxls 和 src/Data/Libxls

**绑定自libxls c语言库**
