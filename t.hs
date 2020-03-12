import System.Directory
import System.FilePath.Posix
import System.Process
duration :: FilePath -> Bool -> IO ()
duration f True = createProcess (proc "soxi" ["-d",f]) >> return ()
duration f _ = createProcess (proc "soxi" ["-D",f]) >> return ()

main = do
    r <- readFile "fn"
    let (d,f) = splitFileName r
    setCurrentDirectory d
    duration f False
