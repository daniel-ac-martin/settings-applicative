{- Adapted from optparse-applicative -}

import Control.Monad (replicateM_)
import Data.Semigroup ((<>))
import Settings.Applicative ( Parser
                            , (<**>)
                            , auto
                            , execParser
                            , fullDesc
                            , header
                            , help
                            , helper
                            , info
                            , long
                            , metavar
                            , option
                            , progDesc
                            , short
                            , showDefault
                            , strOption
                            , switch
                            , value )

data Sample = Sample
  { hello  :: String
  , quiet  :: Bool
  , repeat :: Int }

sample :: Parser Sample
sample = Sample
      <$> strOption
          ( long "hello"
         <> metavar "TARGET"
         <> help "Target for the greeting" )
      <*> switch
          ( long "quiet"
         <> short 'q'
         <> help "Whether to be quiet" )
      <*> option auto
          ( long "repeat"
         <> help "Repeats for greeting"
         <> showDefault
         <> value 1
         <> metavar "INT" )

main :: IO ()
main = greet =<< execParser opts
  where
    opts = info (sample <**> helper)
      ( fullDesc
     <> progDesc "Print a greeting for TARGET"
     <> header "hello - a test for settings-applicative" )

greet :: Sample -> IO ()
greet (Sample h False n) = replicateM_ n . putStrLn $ "Hello, " ++ h
greet _ = return ()
