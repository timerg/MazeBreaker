module Paths_MazeBreaker (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/TimerPro/GitHub/MazeBreaker/.stack-work/install/x86_64-osx/lts-3.6/7.10.2/bin"
libdir     = "/Users/TimerPro/GitHub/MazeBreaker/.stack-work/install/x86_64-osx/lts-3.6/7.10.2/lib/x86_64-osx-ghc-7.10.2/MazeBreaker-0.1.0.0-5lhur3lvRKDGUg2voa6Dh7"
datadir    = "/Users/TimerPro/GitHub/MazeBreaker/.stack-work/install/x86_64-osx/lts-3.6/7.10.2/share/x86_64-osx-ghc-7.10.2/MazeBreaker-0.1.0.0"
libexecdir = "/Users/TimerPro/GitHub/MazeBreaker/.stack-work/install/x86_64-osx/lts-3.6/7.10.2/libexec"
sysconfdir = "/Users/TimerPro/GitHub/MazeBreaker/.stack-work/install/x86_64-osx/lts-3.6/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "MazeBreaker_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "MazeBreaker_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "MazeBreaker_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "MazeBreaker_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "MazeBreaker_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
