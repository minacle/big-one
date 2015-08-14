import Control.Exception (handle, SomeException)
main = handle ((\_ -> return ()) :: SomeException -> IO ()) . writeFile "big" $ repeat '\NUL'
