module Main where

import HTTP
import Parse

main :: IO ()
main = do
    let url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
    json <- download url
    case (parse json) of 
        Left err -> print err
        Right poke-> print . head $ (pokemon poke)
