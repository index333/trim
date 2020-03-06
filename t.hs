import System.Directory
import System.FilePath.Posix
import System.Process
import HSox
main = do
    r <- readFile "fn"
    let (d,f) = splitFileName r
    setCurrentDirectory d
    duration f False
