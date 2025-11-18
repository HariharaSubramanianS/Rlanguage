# Load libraries
library(survival)
library(survminer)

# Load Data
data <- read.csv("dataset/employee_supervised_dataset.csv")

#convert attrition to event (1= yes, 0=no)
data$Attrition_event <- ifelse(data$Attrition == "Yes", 1, 0)

# Create survival object
surv_obj <- Surv(time = data$YearsAtCompany, event = data$Attrition_event)

# Fit Keplan-Meier survival curve
km_fit <- survfit(surv_obj ~ 1, data = data)

# Summary
summary(km_fit)

# Plot survival curve
ggsurvplot(km_fit,
           conf.int = TRUE,
           xlab = "Years at Company",
           ylab = "Survival Probability",
           title = "Employee Retention (Keplan-Meier Curve)",
           surv.median.line = "hv",
           palette = "blue")