data Item = Item {
    nomeItem     :: String,
    categoria    :: String,
    precoItem    :: Double
} deriving Show

data CompraZelda = CompraZelda {
    itens :: [Item]
} deriving Show

calculaDesconto :: [Item] -> Double
calculaDesconto lista =
    let total = sum (map precoItem lista)
    in if total > 200
        then total * 0.10  
        else 0

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda lista)
    | total > 200 = total - desconto     
    | otherwise   = total + 15.0          
    where
        total    = sum (map precoItem lista)
        desconto = calculaDesconto lista


main :: IO ()
main = do
    let espada   = Item "Espada de Aco"    "Arma"       150.0
    let pocao    = Item "Pocao de Vida"    "Pocao"       30.0
    let escudo   = Item "Escudo de Ferro"  "Equipamento" 90.0
    let flechas  = Item "Flechas Elficas"  "Arma"        40.0

    let compra1 = CompraZelda [espada, pocao]
    let compra2 = CompraZelda [espada, escudo, flechas] 

    putStrLn " Compra 1 "
    print compra1
    putStrLn ("Valor final: " ++ show (valorFinal compra1))

    putStrLn "\n Compra 2 "
    print compra2
    putStrLn ("Valor final: " ++ show (valorFinal compra2))
