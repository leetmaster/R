# Warm-up: Coin Toss - Easier Method
# Just simulate it!

M <- 0
simulation_results <- numeric(10000)

for (i in 1:10000) {
  trials <- sample(0:1, 30, replace = TRUE) # 0 = tails, 1 = heads
  heads_count <- sum(trials)
  simulation_results[i] <- heads_count
  if (heads_count >= 22) {
    M <- M + 1
  }
}

p <- M / 10000 # approximately 0.008149
print(paste("p =", p))
