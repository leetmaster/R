# Star-Belly Sneetches scores
star_belly <- c(84, 72, 57, 46, 63, 76, 99, 91)
# Plain-Belly Sneetches scores
plain_belly <- c(81, 69, 74, 61, 56, 87, 69, 65, 66, 44, 62, 69)
# Calculate original difference
star_mean <- mean(star_belly)
plain_mean <- mean(plain_belly)
original_diff <- star_mean-plain_mean

print(paste("★ mean:", round(star_mean, 1)))
print(paste("❌ mean:", round(plain_mean, 1)))
print(paste("difference:", round(original_diff, 1)))

# Combine all scores
all_scores <- c(star_belly, plain_belly)
n_star <- length(star_belly)
n_plain <- length(plain_belly)

# Shuffling simulation
n_simulations <- 10000
differences <- numeric(n_simulations)

for (i in 1:n_simulations) {
  # Shuffle all scores
  shuffled_scores <- sample(all_scores)

  # Reassign to groups (first n_star to star group, rest to plain group)
  shuffled_star <- shuffled_scores[1:n_star]
  shuffled_plain <- shuffled_scores[(n_star + 1):(n_star + n_plain)]

  # Calculate difference
  differences[i] <- mean(shuffled_star) - mean(shuffled_plain)
}

# Calculate p-value (proportion of differences >= observed difference)
p_value <- sum(abs(differences) >= abs(original_diff)) / n_simulations
print(paste("p-value:", p_value))

# One tailed version (like in the presentation)
p_value_one <- sum((differences) >= original_diff) / n_simulations
print(paste("p-value (one tail):", p_value_one))

# Combine all scores
all_scores <- c(star_belly, plain_belly)
n_star <- length(star_belly)
n_plain <- length(plain_belly)

# Shuffling simulation
n_simulations <- 10000
differences <- numeric(n_simulations)

for (i in 1:n_simulations) {
  # Shuffle all scores
  shuffled_scores <- sample(all_scores)

  # Reassign to groups (first n_star to star group, rest to plain group)
  shuffled_star <- shuffled_scores[1:n_star]
  shuffled_plain <- shuffled_scores[(n_star + 1):(n_star + n_plain)]

  # Calculate difference
  differences[i] <- mean(shuffled_star) - mean(shuffled_plain)
}

# Calculate p-value (proportion of differences >= observed difference)
p_value <- sum(abs(differences) >= abs(original_diff)) / n_simulations
print(paste("p-value:", p_value))

# One tailed version (like in the presentation)
p_value_one <- sum((differences) >= original_diff) / n_simulations
print(paste("p-value (one tail):", p_value_one))

# Create histogram with better visualization
hist(differences, breaks = 50,
  main = "Distribution of Score Differences Under Null Hypothesis",
  xlab = "Score Difference (Star - Plain)", ylab ="Frequency",
  col = "lightblue", border = "white")
abline(v = original_diff, col = "red", lwd = 3, lty = 2, label = "Observed")
abline(v = -original_diff, col = "red", lwd = 3, lty = 2)
abline(v = 0, col = "black", lwd = 2, lty = 1)
text(original_diff, max(hist(differences, plot = FALSE)$counts) * 0.8,
  paste("Observed difference:", round(original_diff, 1)),
  pos = 4, col ="red", cex = 0.9)
text(0, max(hist(differences, plot = FALSE)$counts) * 0.9,
  "No difference", pos = 3, col = "black", cex = 0.9)

# Add percentage annotation
percentage_extreme <- round(p_value * 100, 1)
text(max(differences) * 0.7, max(hist(differences, plot = FALSE)$counts) * 0.6,
  paste(percentage_extreme, "% of differences\nare this extreme or more"),
  col = "darkred", cex = 1.1, font = 2)



# Classical t-test for comparison
t_test_result <- t.test(star_belly, plain_belly, alternative ="greater", var.equal = FALSE)
print(paste("Classical t-test p-value:", round(t_test_result$p.value, 3)))
