{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "xlstypes.h"
module Bindings.Xlstypes where
import Foreign.Ptr
#strict_import

{- typedef unsigned char BYTE; -}
#synonym_t BYTE , CUChar
{- typedef uint16_t WORD; -}
#synonym_t WORD , CUShort
{- typedef uint32_t DWORD; -}
#synonym_t DWORD , CUInt
