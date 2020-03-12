import System.Directory
import System.FilePath.Posix
import System.Process
getC :: IO Double
getC = do
    c <- getContents 
    return $ read c
main = do
    d <- getC 
    r <- readFile "fn"
    let (dir,f) = splitFileName r
    setCurrentDirectory dir
    n <- f1 d 2
    print n
    let t = d / n
    print t
    let l = f2 t n
    print l
    doComs f t l    
f1 d n = do
    let t = d / n
    if t < 300 
        then return n
        else f1 d (n + 1)  
f2 d n = map (\x -> x*d) [0..(n - 1)]

doComs f d l = do
    mapM_ (\x -> do
        putStr f 
        putStr " -> " 
        putStrLn $ nf f x) l
    mapM_ (\x -> do
                    trim f (nf f x) x (d + 10)) (init l)
    let x = last l
    trim f (nf f x) x d
trim :: FilePath -> FilePath -> Double -> Double -> IO ()
trim input output startPoint duration = createProcess (proc "sox" [input, output,"trim", show startPoint, show duration]) >> return ()
    
nf f x = "trimed" ++ show (round x) ++ takeBaseName f ++ ".flac"
