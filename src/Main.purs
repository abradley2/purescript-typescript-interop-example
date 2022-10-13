module Main (main) where

import Prelude
import Control.Monad.Except.Trans (ExceptT, runExceptT)
import Data.Either (either)
import Data.Foldable (intercalate)
import Data.List.Types (NonEmptyList)
import Data.Traversable (sequence)
import Foreign (Foreign, ForeignError, readArray, readString)

foreign import faces :: Foreign

parseArray :: forall m a. Monad m => (Foreign -> ExceptT (NonEmptyList ForeignError) m a) -> Foreign -> ExceptT (NonEmptyList ForeignError) m (Array a)
parseArray parseFn = readArray >=> (map parseFn >>> sequence)

decodeFaces ∷ forall m. Monad m => Foreign → ExceptT (NonEmptyList ForeignError) m (Array String)
decodeFaces = parseArray readString

main :: String
main = either show (intercalate "\n") <<< join <<< runExceptT $ (decodeFaces faces)
