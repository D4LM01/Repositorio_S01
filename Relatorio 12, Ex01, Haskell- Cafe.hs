data Status = Aberto | Entregue | Cancelado
    deriving Show

data Bebida = Bebida {
    nome  :: String,
    tipo  :: String,
    preco :: Float
} deriving Show

data Pedido = Pedido {
    bebidas :: [Bebida],
    estado  :: Status
} deriving Show

valorTotalPedido :: Pedido -> Float
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido lista _) =
    let soma = sum (map preco lista)
    in soma + 5.0  

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nome b

main :: IO ()
main = do
    let b1 = Bebida "Latte" "Cafe" 12.0
    let b2 = Bebida "Suco de Laranja" "Suco" 8.0

    let pedido1 = Pedido [b1, b2] Aberto
    let pedido2 = Pedido [] Cancelado

    putStrLn ("Total do pedido 1: " ++ show (valorTotalPedido pedido1))
    putStrLn ("Primeira bebida do pedido 1: " ++ primeiraBebida pedido1)

    putStrLn ("Total do pedido 2: " ++ show (valorTotalPedido pedido2))
    putStrLn ("Primeira bebida do pedido 2: " ++ primeiraBebida pedido2)
