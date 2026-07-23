# Onceler Industries: Thneed Sales - Cross Validation
# Example temperature and sales data
set.seed(123)
temperature <- seq(0, 20, length.out = 30)
# Simulate thneed sales with some noise
thneed_sales <- 100 + 5 * temperature + 0.3 * temperature^2 + rnorm(30, 0, 10)
# Define model functions
fit_linear <- function(x, y) {
  lm(y ~ x)
}
fit_quadratic <- function(x, y) {
  lm(y ~ x + I(x^2))
}
# Calculate RMS error
rms_error <- function(actual, predicted) {
  sqrt(mean((actual - predicted)^2))
}

# Cross-validation function
cross_validate <- function(x, y, model_func, k_folds = 2) {
  n <- length(y)
  indices <- sample(1:n) # Randomize data order
  fold_size <- floor(n / k_folds)

  cv_errors <- numeric(k_folds)

  for (fold in 1:k_folds) {
    # Define test indices for this fold
    if (fold == k_folds) {
      test_indices <- indices[((fold-1) * fold_size + 1):n]
    } else {
      test_indices <- indices[((fold-1) * fold_size + 1):(fold * fold_size)]
    }
  }

  train_indices <- setdiff(indices, test_indices)

  # Train model on training data
  model <- model_func(x[train_indices], y[train_indices])

  # Predict on test data
  predictions <- predict(model, newdata = data.frame(x = x[test_indices]))

  # Calculate RMS error
  cv_errors[fold] <- rms_error(y[test_indices], predictions)

  return(cv_errors)
}

# Perform cross-validation for both models
set.seed(42)
cv_linear <- cross_validate(temperature, thneed_sales, fit_linear, k_folds = 2)
cv_quadratic <- cross_validate(temperature, thneed_sales, fit_quadratic, k_folds = 2)

# Repeat cross-validation multiple times
n_repeats <- 100
cv_linear_results <- numeric(n_repeats)
cv_quadratic_results <- numeric(n_repeats)

for (i in 1:n_repeats) {
  cv_linear_results[i] <- mean(cross_validate(temperature, thneed_sales, fit_linear))
  cv_quadratic_results[i] <- mean(cross_validate(temperature, thneed_sales, fit_quadratic))
}

# Compare models
print(paste("Linear model CV RMS:", round(mean(cv_linear_results), 1)))
print(paste("Quadratic model CV RMS:", round(mean(cv_quadratic_results), 1)))

# Simple 2-fold example as shown in slides
n <- length(temperature)
split_point <- floor(n / 2)

# First split
set.seed(123)
indices <- sample(1:n)
train1 <- indices[1:split_point]
test1 <- indices[(split_point + 1):n]

# Fit models on first training set
model1_linear <- fit_linear(temperature[train1], thneed_sales[train1])
model1_quad <- fit_quadratic(temperature[train1], thneed_sales[train1])

# Test on first test set
pred1_linear <- predict(model1_linear, newdata = data.frame(x = temperature[test1]))
pred1_quad <- predict(model1_quad, newdata = data.frame(x = temperature[test1]))

rms1_linear <- rms_error(thneed_sales[test1], pred1_linear)
rms1_quad <- rms_error(thneed_sales[test1], pred1_quad)

print(paste("Fold 1 - Linear RMS:", round(rms1_linear, 1)))
print(paste("Fold 1 - Quadratic RMS:", round(rms1_quad, 1)))

# Second split (swap train and test)
train2 <- indices[(split_point + 1):n]
test2 <- indices[1:split_point]

# Fit models on second training set
model2_linear <- fit_linear(temperature[train2], thneed_sales[train2])
model2_quad <- fit_quadratic(temperature[train2], thneed_sales[train2])

# Test on second test set
pred2_linear <- predict(model2_linear, newdata = data.frame(x = temperature[test2]))
pred2_quad <- predict(model2_quad, newdata = data.frame(x = temperature[test2]))

rms2_linear <- rms_error(thneed_sales[test2], pred2_linear)
rms2_quad <- rms_error(thneed_sales[test2], pred2_quad)

print(paste("Fold 2 - Linear RMS:", round(rms2_linear, 1)))
print(paste("Fold 2 - Quadratic RMS:", round(rms2_quad, 1)))

# Average CV error
cv_linear_avg <- mean(c(rms1_linear, rms2_linear))
cv_quad_avg <- mean(c(rms1_quad, rms2_quad))

print(paste("Average CV RMS - Linear:", round(cv_linear_avg, 1)))
print(paste("Average CV RMS - Quadratic:", round(cv_quad_avg, 1)))

