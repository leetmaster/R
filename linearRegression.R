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
