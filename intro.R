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

# Plot the distribution
hist(simulation_results, breaks = 0:30,
  main = "Distribution of Heads in 30 Coin Tosses (Fair Coin)",
  xlab = "Number of Heads", ylab = "Frequency",
  col ="lightblue", border ="white")

abline(v = 22, col ="red", lwd = 3, lty = 2)
abline(v = 15, col ="blue", lwd = 2, lty = 1) # Expected value

text(22, max(hist(simulation_results, plot = FALSE)$counts) * 0.8,
  "Observed: 22 heads", pos = 4, col ="red")
text(15, max(hist(simulation_results, plot = FALSE)$counts) * 0.9,
  "Expected: 15 heads", pos = 4, col ="blue")
# → reject fair coin at p = 0.008
