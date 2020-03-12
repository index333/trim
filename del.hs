import System.Directory
import System.FilePath.Posix
import System.Process
main = do
    print ()
    f <- readFile "fn"
    let (dir, fn)  = splitFileName f
    setCurrentDirectory dir
    fs <- listDirectory "."
    let fss = filter (\x -> takeExtension x == ".flac") fs
    mapM_ print fss
    print ()
    putStrLn "元のファイル"
    print fn
    putStrLn "を消去しますか？ (y/n)"
    t <- getLine
    if t == "y" 
        then removeFile f
        else return ()
    
