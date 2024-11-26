{
  "title": "CARE: Comprehensive Artificial Intelligence Techniques for Reliable Autism Evaluation in Pediatric Care",
  "description": "Welcome to the official repository for \"CARE: Comprehensive Artificial Intelligence Techniques for Reliable Autism Evaluation in Pediatric Care\", currently under review at the Journal of Personalized Medicine. This repository contains the datasets and code implementations used in our research, aiming to enhance the diagnostic process for Autism Spectrum Disorder (ASD) using advanced machine learning techniques.",
  "table_of_contents": [
    "Dataset",
    "Notebooks",
    "Training and Testing Sets",
    "Environment and Dependencies",
    "Important Notes",
    "References",
    "Contact"
  ],
  "dataset": {
    "ASD_Traits_Study_Data.csv": {
      "description": "This is the preprocessed dataset used in our study, corresponding to the data after preprocessing as detailed in Section 3.1 of the paper."
    }
  },
  "notebooks": {
    "EDA_ASD_Traits.ipynb": {
      "purpose": "Provides an exploratory data analysis of the ASD Traits dataset.",
      "corresponds_to": "Section 3.2 of the paper.",
      "implementation": "Developed using Google Colab."
    },
    "Ablation Study_CatBoost.ipynb": {
      "purpose": "Contains code for the ablation study using CatBoost.",
      "corresponds_to": "Sections 3.3.1 and 3.3.2 of the paper.",
      "note": "Performs ablation studies across different feature subsets as described in the paper."
    },
    "Ablation Study_PyCaret.ipynb": {
      "purpose": "Contains code for the ablation study using PyCaret.",
      "corresponds_to": "Sections 3.3.1 and 3.3.2 of the paper.",
      "note": "Performs ablation studies across different feature subsets as described in the paper."
    },
    "SHAP Analysis_CatBoost.ipynb": {
      "purpose": "Implements SHAP analysis using CatBoost.",
      "corresponds_to": "Section 3.3.3 and results in Section 4.4 of the paper.",
      "note": "Can reproduce the figures presented in the paper."
    },
    "Imbalance Handling_CatBoost.ipynb": {
      "purpose": "Contains code related to handling imbalanced data.",
      "techniques_implemented": [
        "Original Dataset",
        "Oversampling",
        "Undersampling",
        "SMOTE",
        "Borderline-SMOTE",
        "ADASYN",
        "NearMiss",
        "Tomek Links",
        "SMOTE-ENN",
        "SMOTE-Tomek"
      ]
    },
    "Zheng's Study.ipynb": {
      "purpose": "Implements the comparison study with Zheng et al.'s model.",
      "reference": "Reference 41 in the paper.",
      "corresponds_to": "Section 4.3 of the paper.",
      "note": "Implemented in Python."
    },
    "Leeon's Study.ipynb": {
      "purpose": "Implements the comparison study with Leeon et al.'s model.",
      "reference": "Reference 42 in the paper.",
      "corresponds_to": "Section 4.3 of the paper.",
      "note": "Implemented in Python."
    },
    "Jeon's Study.r": {
      "purpose": "Implements the comparison study with Jeon et al.'s model.",
      "reference": "Reference 43 in the paper.",
      "corresponds_to": "Section 4.3 of the paper.",
      "note": "Implemented in R, as the original study focuses on R."
    }
  },
  "training_and_testing_sets": {
    "training_set.csv": {
      "purpose": "Training dataset extracted from the Python environment to match the training set used in the study."
    },
    "testing_set.csv": {
      "purpose": "Testing dataset extracted from the Python environment to match the testing set used in the study."
    }
  },
  "environment_and_dependencies": {
    "python_notebooks": {
      "implementation": "Jupyter Notebook",
      "note": "Due to potential version differences, minor modifications may be required for the code to run."
    },
    "eda_and_pycaret_notebooks": {
      "implementation": "Google Colab"
    },
    "jeon's_study": {
      "implementation": "R",
      "note": "As R handles random sampling differently from Python, the training and testing sets are provided to ensure consistency."
    }
  },
  "important_notes": [
    "Due to potential differences in library versions or environments, some code may require minor adjustments to run successfully.",
    "These adjustments should not significantly affect the results.",
    "If any issues arise, please consider adjusting minor code aspects to ensure compatibility."
  ],
  "references": [
    {
      "number": 41,
      "citation": "Zheng, A.; Zhu, H.; Hu, X.; Yang, L. Using Feature Selection Techniques to Investigate the Myth of Autism Spectrum Disorder. Int. J. Future Comput. Commun. 2023, 12, 93–99."
    },
    {
      "number": 42,
      "citation": "Leeon, S.I.; Sunaira, F.H.; Nehlin, S.; Abdal, S.A.M.Z.; Momen, S. A Machine Learning Approach for Early Detection of Learning Disorders in Pediatrics. In Proceedings of the 2024 International Conference on Advances in Computing, Communication, Electrical, and Smart Systems (iCACCESS), Dhaka, Bangladesh, 2024; pp. 1–6."
    },
    {
      "number": 43,
      "citation": "Jeon, I.; Kim, M.; So, D.; Kim, E.Y.; Nam, Y.; Kim, S.; Shim, S.; Kim, J.; Moon, J. Reliable Autism Spectrum Disorder Diagnosis for Pediatrics Using Machine Learning and Explainable AI. Diagnostics 2024, 14, 2504."
    }
  ],
  "contact": {
    "name": "Jihoon Moon, Ph.D.",
    "email": "johnnyone89@gmail.com",
    "affiliation": "Soonchunhyang University",
    "note": "For any inquiries, please contact Jihoon Moon."
  }
}