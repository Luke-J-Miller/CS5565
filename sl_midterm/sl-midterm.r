{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "08047b7c",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-06-20T17:38:42.966075Z",
     "iopub.status.busy": "2023-06-20T17:38:42.963201Z",
     "iopub.status.idle": "2023-06-20T17:38:44.202377Z",
     "shell.execute_reply": "2023-06-20T17:38:44.200272Z"
    },
    "papermill": {
     "duration": 1.259325,
     "end_time": "2023-06-20T17:38:44.205136",
     "exception": false,
     "start_time": "2023-06-20T17:38:42.945811",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [],
      "text/latex": [],
      "text/markdown": [],
      "text/plain": [
       "character(0)"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "77cd6723",
   "metadata": {
    "papermill": {
     "duration": 0.013151,
     "end_time": "2023-06-20T17:38:44.233511",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.220360",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Chapter 4 - applied\n",
    "## 13. This question should be answered using the Weekly data set, which is part of the ISLR2 package. This data is similar in nature to the Smarket data from this chapter’s lab, except that it contains 1, 089 weekly returns for 21 years, from the beginning of 1990 to the end of 2010.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "38d58ccb",
   "metadata": {
    "papermill": {
     "duration": 0.013315,
     "end_time": "2023-06-20T17:38:44.260068",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.246753",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (a) Produce some numerical and graphical summaries of the Weekly data. Do there appear to be any patterns?  \n",
    "  "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e6e6cf08",
   "metadata": {
    "papermill": {
     "duration": 0.013245,
     "end_time": "2023-06-20T17:38:44.286529",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.273284",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "717e3511",
   "metadata": {
    "papermill": {
     "duration": 0.013144,
     "end_time": "2023-06-20T17:38:44.313005",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.299861",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (b) Use the full data set to perform a logistic regression with Direction as the response and the five lag variables plus Volume as predictors. Use the summary function to print the results. Do any of the predictors appear to be statistically significant? If so, which ones?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "55eebec5",
   "metadata": {
    "papermill": {
     "duration": 0.013024,
     "end_time": "2023-06-20T17:38:44.339322",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.326298",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "518c134e",
   "metadata": {
    "papermill": {
     "duration": 0.012884,
     "end_time": "2023-06-20T17:38:44.365218",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.352334",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (c) Compute the confusion matrix and overall fraction of correct predictions. Explain what the confusion matrix is telling you about the types of mistakes made by logistic regression."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "35de997e",
   "metadata": {
    "papermill": {
     "duration": 0.012973,
     "end_time": "2023-06-20T17:38:44.391307",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.378334",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "838cc63b",
   "metadata": {
    "papermill": {
     "duration": 0.012948,
     "end_time": "2023-06-20T17:38:44.417834",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.404886",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (d) Now fit the logistic regression model using a training data period from 1990 to 2008, with Lag2 as the only predictor. Compute the confusion matrix and the overall fraction of correct predictions for the held out data (that is, the data from 2009 and 2010)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "08c9d835",
   "metadata": {
    "papermill": {
     "duration": 0.012784,
     "end_time": "2023-06-20T17:38:44.443607",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.430823",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "16b3363f",
   "metadata": {
    "papermill": {
     "duration": 0.012865,
     "end_time": "2023-06-20T17:38:44.469466",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.456601",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (e) Repeat (d) using LDA."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "942eb923",
   "metadata": {
    "papermill": {
     "duration": 0.012798,
     "end_time": "2023-06-20T17:38:44.495404",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.482606",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "c21b45f8",
   "metadata": {
    "papermill": {
     "duration": 0.01276,
     "end_time": "2023-06-20T17:38:44.521099",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.508339",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (f) Repeat (d) using QDA."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "ecdfe855",
   "metadata": {
    "papermill": {
     "duration": 0.012861,
     "end_time": "2023-06-20T17:38:44.547081",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.534220",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "3aa2a967",
   "metadata": {
    "papermill": {
     "duration": 0.013048,
     "end_time": "2023-06-20T17:38:44.573175",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.560127",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (g) Repeat (d) using KNN with K = 1."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "874e1719",
   "metadata": {
    "papermill": {
     "duration": 0.012895,
     "end_time": "2023-06-20T17:38:44.599202",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.586307",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "80b53917",
   "metadata": {
    "papermill": {
     "duration": 0.012878,
     "end_time": "2023-06-20T17:38:44.625087",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.612209",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (h) Repeat (d) using naive Bayes."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "7b56ab1d",
   "metadata": {
    "papermill": {
     "duration": 0.012912,
     "end_time": "2023-06-20T17:38:44.651086",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.638174",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "de2a28ce",
   "metadata": {
    "papermill": {
     "duration": 0.012838,
     "end_time": "2023-06-20T17:38:44.677189",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.664351",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (i) Which of these methods appears to provide the best results on this data?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "efdcc901",
   "metadata": {
    "papermill": {
     "duration": 0.012949,
     "end_time": "2023-06-20T17:38:44.703819",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.690870",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "44bdd99d",
   "metadata": {
    "papermill": {
     "duration": 0.013028,
     "end_time": "2023-06-20T17:38:44.729823",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.716795",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Chapter 5 - Applied\n",
    "## 5. In Chapter 4, we used logistic regression to predict the probability of default using income and balance on the Default data set. We will now estimate the test error of this logistic regression model using the validation set approach. Do not forget to set a random seed before beginning your analysis.\n",
    "### (a) Fit a logistic regression model that uses income and balance to predict default."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "36e04df4",
   "metadata": {
    "papermill": {
     "duration": 0.012842,
     "end_time": "2023-06-20T17:38:44.755704",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.742862",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "df5362f6",
   "metadata": {
    "papermill": {
     "duration": 0.012822,
     "end_time": "2023-06-20T17:38:44.781579",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.768757",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (b) Using the validation set approach, estimate the test error of this model. In order to do this, you must perform the following steps:\n",
    "#### i. Split the sample set into a training set and a validation set."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "72179bc5",
   "metadata": {
    "papermill": {
     "duration": 0.01292,
     "end_time": "2023-06-20T17:38:44.807465",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.794545",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "bb35ddc6",
   "metadata": {
    "papermill": {
     "duration": 0.012862,
     "end_time": "2023-06-20T17:38:44.833310",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.820448",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### ii. Fit a multiple logistic regression model using only the training observations."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "d004b5da",
   "metadata": {
    "papermill": {
     "duration": 0.012925,
     "end_time": "2023-06-20T17:38:44.859295",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.846370",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "6f502b44",
   "metadata": {
    "papermill": {
     "duration": 0.012847,
     "end_time": "2023-06-20T17:38:44.885177",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.872330",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### iii. Obtain a prediction of default status for each individual in the validation set by computing the posterior probability of default for that individual, and classifying the individual to the default category if the posterior probability is greater than 0.5."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "4be2eafd",
   "metadata": {
    "papermill": {
     "duration": 0.012833,
     "end_time": "2023-06-20T17:38:44.911125",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.898292",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "6ec2f1c7",
   "metadata": {
    "papermill": {
     "duration": 0.012901,
     "end_time": "2023-06-20T17:38:44.937016",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.924115",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### iv. Compute the validation set error, which is the fraction of the observations in the validation set that are misclassified."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "c20912a4",
   "metadata": {
    "papermill": {
     "duration": 0.01286,
     "end_time": "2023-06-20T17:38:44.962998",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.950138",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "3183d556",
   "metadata": {
    "papermill": {
     "duration": 0.012952,
     "end_time": "2023-06-20T17:38:44.989098",
     "exception": false,
     "start_time": "2023-06-20T17:38:44.976146",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (c) Repeat the process in (b) three times, using three different splits of the observations into a training set and a validation set. Comment on the results obtained."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "c75fd177",
   "metadata": {
    "papermill": {
     "duration": 0.012894,
     "end_time": "2023-06-20T17:38:45.015118",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.002224",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "bd2b53e8",
   "metadata": {
    "papermill": {
     "duration": 0.012908,
     "end_time": "2023-06-20T17:38:45.041063",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.028155",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (d) Now consider a logistic regression model that predicts the probability of default using income, balance, and a dummy variable for student. Estimate the test error for this model using the validation set approach. Comment on whether or not including a dummy variable for student leads to a reduction in the test error rate."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "73b9a10e",
   "metadata": {
    "papermill": {
     "duration": 0.012892,
     "end_time": "2023-06-20T17:38:45.067084",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.054192",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "b46e6047",
   "metadata": {
    "papermill": {
     "duration": 0.013399,
     "end_time": "2023-06-20T17:38:45.093532",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.080133",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 6. We continue to consider the use of a logistic regression model to predict the probability of default using income and balance on the Default data set. In particular, we will now compute estimates for the standard errors of the income and balance logistic regression coefficients in two different ways: \n",
    "## 1. using the bootstrap, and \n",
    "## 2. using the standard formula for computing the standard errors in the glm() function. \n",
    "## Do not forget to set a random seed before beginning your analysis.\n",
    "### (a) Using the summary() and glm() functions, determine the estimated standard errors for the coefficients associated with income and balance in a multiple logistic regression model that uses both predictors."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "9aba2ba1",
   "metadata": {
    "papermill": {
     "duration": 0.013318,
     "end_time": "2023-06-20T17:38:45.120049",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.106731",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "f5bf0198",
   "metadata": {
    "papermill": {
     "duration": 0.01299,
     "end_time": "2023-06-20T17:38:45.146228",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.133238",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (b) Write a function, boot.fn(), that takes as input the Default data set as well as an index of the observations, and that outputs the coefficient estimates for income and balance in the multiple logistic regression model."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "40711087",
   "metadata": {
    "papermill": {
     "duration": 0.012948,
     "end_time": "2023-06-20T17:38:45.172315",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.159367",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "9ed2b176",
   "metadata": {
    "papermill": {
     "duration": 0.012898,
     "end_time": "2023-06-20T17:38:45.198312",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.185414",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (c) Use the boot() function together with your boot.fn() function to estimate the standard errors of the logistic regression coefficients for income and balance."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e4d477fa",
   "metadata": {
    "papermill": {
     "duration": 0.013123,
     "end_time": "2023-06-20T17:38:45.224550",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.211427",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "3f92258e",
   "metadata": {
    "papermill": {
     "duration": 0.012917,
     "end_time": "2023-06-20T17:38:45.250540",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.237623",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (d) Comment on the estimated standard errors obtained using the glm() function and using your bootstrap function."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "0c7e53b0",
   "metadata": {
    "papermill": {
     "duration": 0.012851,
     "end_time": "2023-06-20T17:38:45.276515",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.263664",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "0f3668a2",
   "metadata": {
    "papermill": {
     "duration": 0.012933,
     "end_time": "2023-06-20T17:38:45.302508",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.289575",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 9. We will now consider the Boston housing data set, from the ISLR2 library.\n",
    "### (a) Based on this data set, provide an estimate for the population mean of medv. Call this estimate ˆµ."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "4a2df951",
   "metadata": {
    "papermill": {
     "duration": 0.01296,
     "end_time": "2023-06-20T17:38:45.328543",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.315583",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "15614367",
   "metadata": {
    "papermill": {
     "duration": 0.01286,
     "end_time": "2023-06-20T17:38:45.354457",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.341597",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (b) Provide an estimate of the standard error of ˆµ. Interpret this result.\n",
    "*Hint: We can compute the standard error of the sample mean by dividing the sample standard deviation by the square root of the number of observations.*"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "cf80af10",
   "metadata": {
    "papermill": {
     "duration": 0.013041,
     "end_time": "2023-06-20T17:38:45.420751",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.407710",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "b6350dce",
   "metadata": {
    "papermill": {
     "duration": 0.013006,
     "end_time": "2023-06-20T17:38:45.446787",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.433781",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (c) Now estimate the standard error of ˆµ using the bootstrap. How does this compare to your answer from (b)?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "48d48f2a",
   "metadata": {
    "papermill": {
     "duration": 0.013045,
     "end_time": "2023-06-20T17:38:45.472991",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.459946",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "17bc01f3",
   "metadata": {
    "papermill": {
     "duration": 0.012979,
     "end_time": "2023-06-20T17:38:45.499069",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.486090",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (d) Based on your bootstrap estimate from (c), provide a 95 % confidence interval for the mean of medv. Compare it to the results obtained using t.test(Boston$medv).\n",
    "*Hint: You can approximate a 95 % confidence interval using the\n",
    "formula [ˆµ − 2SE(ˆµ), µˆ + 2SE(ˆµ)].*"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "4127c624",
   "metadata": {
    "papermill": {
     "duration": 0.012979,
     "end_time": "2023-06-20T17:38:45.525072",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.512093",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "8b8d83b3",
   "metadata": {
    "papermill": {
     "duration": 0.012967,
     "end_time": "2023-06-20T17:38:45.551139",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.538172",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (e) Based on this data set, provide an estimate, ˆµmed, for the median value of medv in the population"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "2bb4abd5",
   "metadata": {
    "papermill": {
     "duration": 0.012883,
     "end_time": "2023-06-20T17:38:45.577185",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.564302",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "b400562a",
   "metadata": {
    "papermill": {
     "duration": 0.012914,
     "end_time": "2023-06-20T17:38:45.603230",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.590316",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (f) We now would like to estimate the standard error of ˆµmed. Unfortunately, there is no simple formula for computing the standard error of the median. Instead, estimate the standard error of the median using the bootstrap. Comment on your findings."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "82b87fce",
   "metadata": {
    "papermill": {
     "duration": 0.013,
     "end_time": "2023-06-20T17:38:45.629423",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.616423",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "353c6441",
   "metadata": {
    "papermill": {
     "duration": 0.012974,
     "end_time": "2023-06-20T17:38:45.655525",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.642551",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (g) Based on this data set, provide an estimate for the tenth percentile of medv in Boston census tracts. Call this quantity ˆµ0.1. \n",
    "*(You can use the quantile() function.)*"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "20dec964",
   "metadata": {
    "papermill": {
     "duration": 0.012985,
     "end_time": "2023-06-20T17:38:45.681823",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.668838",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "149e12f0",
   "metadata": {
    "papermill": {
     "duration": 0.013098,
     "end_time": "2023-06-20T17:38:45.708277",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.695179",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (h) Use the bootstrap to estimate the standard error of ˆµ0.1. Comment on your findings."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "68a178d9",
   "metadata": {
    "papermill": {
     "duration": 0.013046,
     "end_time": "2023-06-20T17:38:45.734450",
     "exception": false,
     "start_time": "2023-06-20T17:38:45.721404",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 6.319495,
   "end_time": "2023-06-20T17:38:45.870900",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-06-20T17:38:39.551405",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
