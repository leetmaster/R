# Yertle's Turtle Tower - Bootstrap Resampling

# Observed turtle tower heights
turtle_heights <- c(48, 24, 32, 61, 51, 12, 32, 18, 19, 24,
21, 41, 29, 21, 25, 23, 42, 18, 23, 13)
# Original sample statistics
original_mean <- mean(turtle_heights)
original_se <- sd(turtle_heights) / sqrt(length(turtle_heights))
print(paste("Original mean:", round(original_mean, 1)))
print(paste("Original SE:", round(original_se, 1)))

# Bootstrap resampling
n_bootstrap <- 10000
bootstrap_means <- numeric(n_bootstrap)

for (i in 1:n_bootstrap) {
  # Sample with replacement
  bootstrap_sample <- sample(turtle_heights, length(turtle_heights), replace = TRUE)
  bootstrap_means[i] <- mean(bootstrap_sample)
}

# Bootstrap statistics
bootstrap_mean <- mean(bootstrap_means)
bootstrap_se <- sd(bootstrap_means)

print(paste("Bootstrap mean:", round(bootstrap_mean, 1)))
print(paste("Bootstrap SE:", round(bootstrap_se, 1)))

# Create histogram
hist(bootstrap_means, breaks = 50, main ="Bootstrap Distribution of Sample Means",
     xlab ="Sample Mean", col ="lightgreen")
abline(v = original_mean, col ="red", lwd = 2)

# Example data: wind speed vs turtle tower height
set.seed(42)
wind_speed <- runif(20, 0, 20)
tower_height <- turtle_heights

# Bootstrap linear regression
n_bootstrap <- 10000
bootstrap_slopes <- numeric(n_bootstrap)
bootstrap_intercepts <- numeric(n_bootstrap)
for (i in 1:n_bootstrap) {
  # Sample indices with replacement
  indices <- sample(1:length(wind_speed), replace = TRUE)
  # Fit linear model on bootstrap sample
  lm_fit <- lm(tower_height[indices] ~ wind_speed[indices])
  bootstrap_slopes[i] <- coef(lm_fit)[2]
  bootstrap_intercepts[i] <- coef(lm_fit)[1]
}

# Results
print(paste("Slope: mean =", round(mean(bootstrap_slopes), 3),
  "± SE =", round(sd(bootstrap_slopes), 3)))
print(paste("Intercept: mean =", round(mean(bootstrap_intercepts), 3),
  "± SE =", round(sd(bootstrap_intercepts), 3)))

# Create histogram
hist(bootstrap_means, breaks = 50, main ="Bootstrap Distribution of Sample Means",
     xlab ="Sample Mean", col ="lightgreen")
abline(v = original_mean, col ="red", lwd = 2)
