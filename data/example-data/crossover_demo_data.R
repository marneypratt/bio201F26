library(dplyr)

# Set seed for reproducibility
set.seed(123)

# Define parameters
num_subjects <- 20
num_periods <- 2
treatments <- c("A", "B") # Two treatments
sequence_types <- c("AB", "BA") # Two sequences

# Create subject IDs
subject <- 1:num_subjects

# Assign sequences to subjects
# Half subjects get AB, half get BA
sequences <- rep(sequence_types, each = num_subjects / 2)

# Create a data frame structure
crossover_data <- expand.grid(
  subject = subject,
  period = 1:num_periods
) %>%
  arrange(subject, period)

# Assign sequences and treatments based on sequence and period
crossover_data <- crossover_data %>%
  mutate(
    sequence = rep(sequences, each = num_periods),
    treatment = case_when(
      sequence == "AB" & period == 1 ~ "A",
      sequence == "AB" & period == 2 ~ "B",
      sequence == "BA" & period == 1 ~ "B",
      sequence == "BA" & period == 2 ~ "A"
    )
  )

# Simulate individual effects (random intercepts)
# Each subject has a baseline effect
subject_effects <- data.frame(
  subject = subject,
  subject_effect = rnorm(num_subjects, mean = 50, sd = 5)
)

# Simulate treatment effects
treatment_effect_A <- 5
treatment_effect_B <- 15

# Simulate period effect (e.g., a carryover effect or learning effect)
period_effect_2 <- 2 # Effect in period 2 compared to period 1

# Simulate error term
error_sd <- 3

# Add response variable
crossover_data <- crossover_data %>%
  left_join(subject_effects, by = "subject") %>%
  mutate(
    response = subject_effect +
      ifelse(treatment == "A", treatment_effect_A, treatment_effect_B) +
      ifelse(period == 2, period_effect_2, 0) +
      rnorm(n(), mean = 0, sd = error_sd)
  )

crossover_data$sequence <- factor(crossover_data$sequence, 
                          levels = c("AB", "BA"))

# Rename levels
levels(crossover_data$sequence) <- c("Scolling First", "Nature First")


crossover_data$treatment <- factor(crossover_data$treatment, 
                                  levels = c("A", "B"))

# Rename levels
levels(crossover_data$treatment) <- c("Scrolling", "Nature")


crossover_data <- crossover_data |> 
  dplyr::select(-subject_effect) |> 
  mutate(SDNN = response, response = NULL)


write.csv(crossover_data, file = "data/example-data/nature/crossover_data.csv", row.names = FALSE)