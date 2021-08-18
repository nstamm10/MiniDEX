# Added Files
I added two files to this project, uniswap-v2-core and uniswap-v2-periphery. These are git clones of the uniswap v2 github project.
From my understanding, the core contracts are responsible for executing the logic of providing liquidity and making swaps,
while the periphery is responsible for calculating/verifying what inputs are to be given to the core contracts. For this reason, 
the periphery contracts (particularly UniswapV2Router02), are a safe way of calling the core contracts.

I have heavily commented swap methods in UniswapV2Router02 (found in periphery) and mint and swap methods in 
UniswapV2Pair (found in core).

# Moving Forward
At this point, I see this project moving in three potential directions...

1. We try to write our own smart contracts from scratch and make our best efforts to implement everything
without copying uniswap's contracts. This would likely result in a functioning exchange, but not a safe one 
by any means because we wouldn't have copied uniswap and neither of us have a BA in Economics-Mathematics 
from Columbia (like the founder of uniswap lol). We would definitely be able to implement the constant 
product formula, fees, and liquidity tokens on our own, but the end result would be unsafe on the mainnet. 
For this option, we could create two ERC20 tokens, deploy them to a test network along with our other contracts, 
and then make stakes and swaps within the test network. We would definitely learn a lot doing this just because we 
would implement everything from scratch.

2. We use uniswap's existing periphery contracts and SDK to create an exchange. Building a front end using these 
tools would be pretty involved in itself and would require us to understand fully how uniswap works 
(because we'll be calling functions within its contracts). This would result in an exchange that can actually be used on 
the mainnet because would use uniswap's tools. I feel like it would also be possible to integrate the exchange in a 
creative way.

3. We copy uniswap's contracts and try to add some type of functionality. This would be worth it if we have a cool idea that's 
feasible to implement. The result would be a copied version of uniswap plus whatever features we add.

