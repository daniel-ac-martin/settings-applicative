module Settings.Applicative ( module Control.Applicative
                            , Parser
                            , auto
                            , envvar
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
                            , value ) where

import Control.Applicative

import Options.Applicative ( Parser
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

import Options.Applicative.Builder.Internal ( DefaultProp(..)
                                            , HasValue
                                            , Mod(..) )

-- Just a clone of 'value' for now
-- We will need to do IO so need to think about how to orchestrate that
envvar :: HasValue f => a -> Mod f a
envvar x = Mod id (DefaultProp (Just x) Nothing) id
