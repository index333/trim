module HSox where
import System.Process
duration :: FilePath -> Bool -> IO ()
duration f True = createProcess (proc "soxi" ["-d",f]) >> return ()
duration f _ = createProcess (proc "soxi" ["-D",f]) >> return ()
deEmphasize :: FilePath -> FilePath -> IO ()
deEmphasize input output = createProcess (proc "sox" [input, output,"deemph"]) >> return ()
trim :: FilePath -> FilePath -> Double -> Double -> IO ()
trim input output startPoint duration = createProcess (proc "sox" [input, output,"trim", show startPoint, show duration]) >> return ()

