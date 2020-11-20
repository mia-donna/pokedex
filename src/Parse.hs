{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}


module Parse where

import Data.Aeson (eitherDecode)
import qualified Data.ByteString.Lazy.Char8 as L8
import GHC.Generics ( Generic )
import Data.Aeson.Types

data Weakness = Weakness [String] deriving (Show, Generic)

data Pokeinfo = Pokeinfo {
    id :: Int,
    name :: String,
    img :: String,
    weaknesses :: Weakness,
    height :: String,
    weight :: String,
    candy :: String
} deriving (Show, Generic)


instance FromJSON Pokeinfo
instance ToJSON Pokeinfo

data Pokemon = Pokemon {
    pokemon :: [Pokeinfo]
} deriving (Show, Generic)

instance FromJSON Pokemon
instance ToJSON Pokemon

instance FromJSON Weakness 
instance ToJSON Weakness


parse :: L8.ByteString -> Either String Pokemon
parse json = eitherDecode json :: Either String Pokemon


