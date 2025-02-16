# m6ADEinfer
This software is based on a generalized random forest model that predicts the expected benefit of anti-m6A treatment for cancer patients, utilizing both clinical features and bulk transcriptomic characteristics. The prediction is calculated using the five-year restricted mean survival time. You are required to prepare a data frame containing clinical features such as age, gender, stage, grade, and gene features represented by Entrez IDs. Missing values are allowed. Use the predict_m6a_benifit() function provided in this package to make predictions. The output is a relative value, which allows you to identify patients who are most likely to benefit from anti-m6A treatment within a group of cancer patients.

### Installation

The latest release of the package can be installed:

```R
devtools::install_github('maodongdong37/m6ADEinfer')
remotes::install_github('maodongdong37/m6ADEinfer')
```

### Usage Examples

```R
# Data is the data frame for characteristic profiles, and cancer is the cancer type string, like "KIRC".Test data "test. RDS" was also put in depository.
predict_m6a_benifit(data,cacner)
```

### References
This page
