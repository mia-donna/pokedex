module Main where

import HTTP

main :: IO ()
main = do
    let url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
    json <- download url
    print json
