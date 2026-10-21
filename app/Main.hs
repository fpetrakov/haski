import Html

main :: IO ()
main = do
    putStrLn (render myhtml)
    putStrLn (show (factorial 6))
    putStrLn (show (fact_guard 6))
    putStrLn (show (fib 4))

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x - 1)

fact_guard :: Int -> Int
fact_guard x
    | x > 1 = x * fact_guard (x - 1)
    | otherwise = 1

fibTuple :: (Int, Int, Int) -> (Int, Int, Int)
fibTuple (x, y, 0) = (x, y, 0)
fibTuple (x, y, index) = fibTuple (y, x + y, index - 1)

fib :: Int -> Int
fib x = fibResult (fibTuple (0, 1, x))

fibResult :: (Int, Int, Int) -> Int
fibResult (x, _, _) = x


myhtml :: Html
myhtml =
    html_
        "My title"
        ( append_
            (h1_ "Heading")
            ( append_
                (p_ "Paragraph #1")
                (p_ "Paragraph #2")
            )
        )
