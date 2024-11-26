setwd("C:\\Users\\user\\Desktop")

# Load necessary libraries
library(caret)
library(xgboost)
library(nnet)
library(gbm)
library(pROC)
library(MLmetrics)
library(dplyr)

# Load training and testing datasets
training_set <- read.csv("training_set.csv")
testing_set <- read.csv("testing_set.csv")

# Convert the target variable into a factor
training_set$ASD_traits <- as.factor(training_set$ASD_traits)
testing_set$ASD_traits <- as.factor(testing_set$ASD_traits)

# Ensure factor levels are valid R variable names
levels(training_set$ASD_traits) <- make.names(levels(training_set$ASD_traits))
levels(testing_set$ASD_traits) <- make.names(levels(testing_set$ASD_traits))

# Verify the changes
print(levels(training_set$ASD_traits))
print(levels(testing_set$ASD_traits))

# Define cross-validation settings
train_control <- trainControl(
  method = "cv",       # Cross-validation
  number = 5,          # 5-fold cross-validation
  classProbs = TRUE,   # Enable class probabilities
  summaryFunction = multiClassSummary # Multi-class summary metrics
)

# Define the hyperparameter grid and train the XGBoost model
xgb_grid <- expand.grid(
  nrounds = c(100, 200, 300),         # Number of boosting rounds
  max_depth = c(3, 6, 9),            # Maximum tree depth
  eta = c(0.01, 0.1, 0.3),           # Learning rate
  gamma = c(0, 0.1, 0.2),            # Minimum loss reduction
  colsample_bytree = c(0.5, 0.7, 1.0), # Subsample ratio of columns
  min_child_weight = c(1, 5, 10),    # Minimum child weight
  subsample = c(0.5, 0.7, 1.0)       # Subsample ratio of instances
)

xgb_model <- caret::train(
  ASD_traits ~ .,
  data = training_set,
  method = "xgbTree",
  trControl = train_control,
  tuneGrid = xgb_grid,
  metric = "Accuracy"
)

# Define the hyperparameter grid and train the nnet (neural network) model
nnet_grid <- expand.grid(
  size = c(5, 7, 10, 15, 20),     # Number of neurons in the hidden layer
  decay = c(0.01, 0.1) # Weight decay
)

nnet_model <- caret::train(
  ASD_traits ~ .,
  data = training_set,
  method = "nnet",
  trControl = train_control,
  tuneGrid = nnet_grid,
  metric = "Accuracy",
  trace = FALSE
)

# Define the hyperparameter grid and train the GBM model
gbm_grid <- expand.grid(
  n.trees = c(50, 100, 200),         # Number of trees
  interaction.depth = c(1, 3, 5),    # Maximum depth of each tree
  shrinkage = c(0.01, 0.1),          # Learning rate
  n.minobsinnode = c(10, 20)         # Minimum number of observations in terminal nodes
)

gbm_model <- caret::train(
  ASD_traits ~ .,
  data = training_set,
  method = "gbm",
  trControl = train_control,
  tuneGrid = gbm_grid,
  metric = "Accuracy",
  verbose = FALSE
)

# Store the models in a list
models <- list(
  xgb = xgb_model,
  nnet = nnet_model,
  gbm = gbm_model
)

# Evaluate the models on the testing set
test_performance <- data.frame(
  Model = character(),
  Accuracy = numeric(),
  Precision = numeric(),
  Recall = numeric(),
  F1_Score = numeric(),
  ROC_AUC = numeric(),
  MCC = numeric(),
  Cohens_Kappa = numeric()
)

# Define a custom function to calculate Matthews Correlation Coefficient (MCC)
calculate_mcc <- function(actual, predicted) {
  # Create confusion matrix
  cm <- table(actual, predicted)
  
  # Extract TP, TN, FP, FN for binary classification
  TP <- cm[1, 1]
  TN <- cm[2, 2]
  FP <- cm[2, 1]
  FN <- cm[1, 2]
  
  # Compute MCC
  numerator <- (TP * TN) - (FP * FN)
  denominator <- sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN))
  
  if (denominator == 0) {
    return(NA)  # Return NA to handle edge cases
  } else {
    return(numerator / denominator)
  }
}

# Define a custom function to calculate Cohen's Kappa
calculate_kappa <- function(actual, predicted) {
  # Create confusion matrix
  cm <- table(actual, predicted)
  
  # Total observations
  total <- sum(cm)
  
  # Observed accuracy
  Po <- sum(diag(cm)) / total
  
  # Expected accuracy
  row_totals <- rowSums(cm)
  col_totals <- colSums(cm)
  Pe <- sum((row_totals * col_totals) / (total^2))
  
  # Calculate Kappa
  if (1 - Pe == 0) {
    return(NA)  # Handle edge case where denominator is zero
  } else {
    return((Po - Pe) / (1 - Pe))
  }
}

# Main loop for model evaluation
for (model_name in names(models)) {
  model <- models[[model_name]]
  
  # Predict class labels and probabilities
  pred_class <- predict(model, testing_set)
  pred_prob <- predict(model, testing_set, type = "prob")
  
  # Ensure response levels and predictor column names match
  levels(testing_set$ASD_traits) <- make.names(levels(testing_set$ASD_traits))
  colnames(pred_prob) <- make.names(colnames(pred_prob))
  
  # Calculate evaluation metrics
  accuracy <- Accuracy(testing_set$ASD_traits, pred_class)
  precision <- Precision(testing_set$ASD_traits, pred_class, positive = levels(testing_set$ASD_traits)[1])
  recall <- Recall(testing_set$ASD_traits, pred_class, positive = levels(testing_set$ASD_traits)[1])
  f1_score <- F1_Score(testing_set$ASD_traits, pred_class, positive = levels(testing_set$ASD_traits)[1])
  
  # ROC-AUC calculation
  roc_auc <- NA
  if (nlevels(testing_set$ASD_traits) == 2) {
    # Binary classification: Compute ROC-AUC directly
    roc_obj <- roc(as.numeric(testing_set$ASD_traits), pred_prob[, levels(testing_set$ASD_traits)[1]])
    roc_auc <- auc(roc_obj)
  } else if (nlevels(testing_set$ASD_traits) > 2) {
    # Multiclass classification: Use multiclass.roc
    roc_obj <- multiclass.roc(testing_set$ASD_traits, pred_prob)
    roc_auc <- auc(roc_obj)
  }
  
  # Calculate MCC using custom function
  mcc <- calculate_mcc(testing_set$ASD_traits, pred_class)
  
  # Calculate Cohen's Kappa using custom function
  cohens_kappa <- calculate_kappa(testing_set$ASD_traits, pred_class)
  
  # Save the results to the data frame
  test_performance <- rbind(test_performance, data.frame(
    Model = model_name,
    Accuracy = accuracy,
    Precision = precision,
    Recall = recall,
    F1_Score = f1_score,
    ROC_AUC = ifelse(is.na(roc_auc), "Not Applicable", roc_auc),
    MCC = mcc,
    Cohens_Kappa = cohens_kappa
  ))
}

# Display test performance results
print(test_performance)