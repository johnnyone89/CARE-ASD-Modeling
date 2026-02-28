# CARE: Comprehensive Artificial Intelligence Techniques for Reliable Autism Evaluation in Pediatric Care

Welcome to the official repository for **"CARE: Comprehensive Artificial Intelligence Techniques for Reliable Autism Evaluation in Pediatric Care," published in the *Computers, Materials & Continua*.** This repository provides the datasets and code implementations used in our research, which aims to enhance the diagnostic process for Autism Spectrum Disorder (ASD) in pediatric care using advanced machine learning techniques.

**This repository is intended to support transparency, reproducibility, and further research in AI-based pediatric ASD evaluation.**

---

## Table of Contents

- [Dataset](#dataset)
- [Notebooks](#notebooks)
  - [Exploratory Data Analysis](#exploratory-data-analysis)
  - [Ablation Studies](#ablation-studies)
  - [SHAP Analysis](#shap-analysis)
  - [Imbalance Handling](#imbalance-handling)
  - [Comparison with State-of-the-Art Models](#comparison-with-state-of-the-art-models)
- [Training and Testing Sets](#training-and-testing-sets)
- [Environment and Dependencies](#environment-and-dependencies)
- [Important Notes](#important-notes)
- [References](#references)
- [Contact](#contact)

---

## Dataset

### ASD_Traits_Study_Data.csv

- **Description:** This is the preprocessed dataset used in our study, corresponding to the dataset after preprocessing as detailed in **Section 3.1** of the paper.

---

## Notebooks

### Exploratory Data Analysis

#### EDA_ASD_Traits.ipynb

- **Purpose:** This notebook presents an exploratory data analysis (EDA) of the ASD Traits dataset.
- **Corresponds to:** **Section 3.2** of the paper.
- **Implementation:** Developed using **Google Colab**.

### Ablation Studies

#### Ablation Study_CatBoost.ipynb

- **Purpose:** This notebook contains the code for the ablation study using the **CatBoost** algorithm.
- **Corresponds to:** **Section 3.3.1** of the paper.
- **Note:** Performs ablation studies on different feature subsets as described in the paper.

#### Ablation Study_PyCaret.ipynb

- **Purpose:** This notebook contains the code for the ablation study using **PyCaret**.
- **Corresponds to:** **Section 3.3.2** of the paper.
- **Note:** Performs ablation studies on different feature subsets as described in the paper.

### SHAP Analysis

#### SHAP Analysis_CatBoost.ipynb

- **Purpose:** This notebook implements SHAP (SHapley Additive exPlanations) analysis using **CatBoost**.
- **Corresponds to:** **Section 3.3.3** and the results in **Section 4.4** of the paper.
- **Note:** It can reproduce the figures presented in the paper.

### Imbalance Handling

#### Imbalance Handling_CatBoost.ipynb

- **Purpose:** This notebook contains code related to handling imbalanced data.
- **Techniques Implemented:**
  - Original Dataset
  - Oversampling
  - Undersampling
  - SMOTE
  - Borderline-SMOTE
  - ADASYN
  - NearMiss
  - Tomek Links
  - SMOTE-ENN
  - SMOTE-Tomek

### Comparison with State-of-the-Art Models

#### Zheng's Study.ipynb

- **Purpose:** Implements the comparison study with Zheng et al.'s model.
- **Reference:** Reference 46 in the paper.
- **Corresponds to:** **Section 4.3** of the paper.
- **Note:** Implemented in Python.

#### Leeon's Study.ipynb

- **Purpose:** Implements the comparison study with Leeon et al.'s model.
- **Reference:** Reference 47 in the paper.
- **Corresponds to:** **Section 4.3** of the paper.
- **Note:** Implemented in Python.

#### Jeon's Study.r

- **Purpose:** Implements the comparison study with Jeon et al.'s model.
- **Reference:** Reference 31 in the paper.
- **Corresponds to:** **Section 4.3** of the paper.
- **Note:** Implemented in R, as the original study focuses on R.

---

## Training and Testing Sets

### training_set.csv & testing_set.csv

- **Purpose:** These datasets are extracted from the Python environment to match the training and testing sets used in the study.
- **Note:** Provided to ensure consistency, as random sampling in R may differ from Python.

---

## Environment and Dependencies

- **EDA and PyCaret Notebooks:**
  - Implemented in **Google Colab**.
- **Other Python Notebooks:**
  - Implemented using **Jupyter Notebook**.
  - **Note:** Due to potential version differences, minor modifications may be required for the code to run successfully.
- **Jeon's Study.r:**
  - Implemented in **R**.
  - **Note:** As R handles random sampling differently from Python, the training and testing sets are provided to ensure consistency.

---

## Important Notes

- **Version Compatibility:**
  - Due to potential differences in library versions or computational environments, some code may require minor adjustments to run successfully.
  - These modifications should not significantly affect the results.
- **Execution:**
  - If you encounter any issues, please consider adjusting minor aspects of the code to ensure compatibility.
  - We encourage users to verify that all dependencies are correctly installed and to consult the documentation for the respective libraries if needed.

---

## References

[46] Zheng, A.; Zhu, H.; Hu, X.; Yang, L. Using Feature Selection Techniques to Investigate the Myth of Autism Spectrum Disorder. *Int. J. Future Comput. Commun.* **2023**, 12, 93–99.

[47] Leeon, S.I.; Sunaira, F.H.; Nehlin, S.; Abdal, S.A.M.Z.; Momen, S. A Machine Learning Approach for Early Detection of Learning Disorders in Pediatrics. In *Proceedings of the 2024 International Conference on Advances in Computing, Communication, Electrical, and Smart Systems (iCACCESS)*, Dhaka, Bangladesh, 2024; pp. 1–6.

[31] Jeon, I.; Kim, M.; So, D.; Kim, E.Y.; Nam, Y.; Kim, S.; Shim, S.; Kim, J.; Moon, J. Reliable Autism Spectrum Disorder Diagnosis for Pediatrics Using Machine Learning and Explainable AI. *Diagnostics* **2024**, 14, 2504.

Moon, J.; Woo, J. "CARE: Comprehensive Artificial Intelligence Techniques for Reliable Autism Evaluation in Pediatric Care." Computers, Materials & Continua, 2025, 85(1), 1383–1425. https://doi.org/10.32604/cmc.2025.067784
---

## Contact

For any inquiries, please feel free to contact:

- **Jihoon Moon, Ph.D.**
- **Email:** johnnyone89@gmail.com
- **Affiliation:** Duksung Women's University

---

**Note:** While we have made every effort to ensure that the code runs smoothly, differences in library versions or computational environments may require minor adjustments. These modifications should not significantly affect the results.

---
