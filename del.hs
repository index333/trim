import System.Directory
import System.FilePath.Posix
main = do
    print ()
    f <- readFile "fn"
    let (dir, fn)  = splitFileName f
    fs <- listDirectory dir
    mapM_ print fs
    print ()
    print fn
    print "delete? y/n"
    t <- getLine
    if t == "y" 
        then removeFile f
        else return ()
    
