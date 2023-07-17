{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "b3ee038c",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-07-17T15:25:54.547749Z",
     "iopub.status.busy": "2023-07-17T15:25:54.544398Z",
     "iopub.status.idle": "2023-07-17T15:25:58.351208Z",
     "shell.execute_reply": "2023-07-17T15:25:58.349191Z"
    },
    "papermill": {
     "duration": 3.838322,
     "end_time": "2023-07-17T15:25:58.355469",
     "exception": false,
     "start_time": "2023-07-17T15:25:54.517147",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "suppressPackageStartupMessages({\n",
    "    library(tidyverse)\n",
    "    library(ggplot2)\n",
    "    library(ISLR)\n",
    "    library(caret)\n",
    "    library(tree)\n",
    "    library(randomForest)\n",
    "    library(BART)\n",
    "    library(gbm)\n",
    "    })"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1aa925a2",
   "metadata": {
    "papermill": {
     "duration": 0.017447,
     "end_time": "2023-07-17T15:25:58.391311",
     "exception": false,
     "start_time": "2023-07-17T15:25:58.373864",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 8.4 Exercises\n",
    "## Conceptual\n",
    "### 5. Suppose we produce ten bootstrapped samples from a data set containing red and green classes. We then apply a classification tree to each bootstrapped sample and, for a specific value of X, produce 10 estimates of \n",
    "### *P(Class is Red|X): 0.1, 0.15, 0.2, 0.2, 0.55, 0.6, 0.6, 0.65, 0.7, and 0.75.* \n",
    "### There are two common ways to combine these results together into a single class prediction. One is the majority vote approach discussed in this chapter. The second approach is to classify based on the average probability. In this example, what is the final classification under each of these two approaches?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "ae849bdb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:25:58.461932Z",
     "iopub.status.busy": "2023-07-17T15:25:58.428223Z",
     "iopub.status.idle": "2023-07-17T15:25:59.089210Z",
     "shell.execute_reply": "2023-07-17T15:25:59.086083Z"
    },
    "papermill": {
     "duration": 0.684217,
     "end_time": "2023-07-17T15:25:59.092811",
     "exception": false,
     "start_time": "2023-07-17T15:25:58.408594",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'The class prediction by majority vote is: Red'"
      ],
      "text/latex": [
       "'The class prediction by majority vote is: Red'"
      ],
      "text/markdown": [
       "'The class prediction by majority vote is: Red'"
      ],
      "text/plain": [
       "[1] \"The class prediction by majority vote is: Red\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "'The class prediction by average probability is: Green'"
      ],
      "text/latex": [
       "'The class prediction by average probability is: Green'"
      ],
      "text/markdown": [
       "'The class prediction by average probability is: Green'"
      ],
      "text/plain": [
       "[1] \"The class prediction by average probability is: Green\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASGRKPcAidOnSpdQjlFIqlUqlUp18EQqXTqdDCEmSWLEC\npVIpy1W4VOrLf/3W1tbmcrnSDtMhJEkSQqitrS31IAvKZNrjz7t2LpPJtM/Hipqams78/dj6\nvrfHAz2bzZZ6hFJKkiSXy3XyRSjc3J+7VqxwDrDC5TMlhJDNZjvzD5LC5VesHR5g/vcthXb7\nWNHJvx9b/5/SHsNuxowZpR6hlCoqKtLpdCdfhMJVVlaWlZXlcjkrVqCysrLy8nLLVaDy8vLy\n8vIQQkNDQ/v8CdfepNPpysrKhoaG9vZzt6WlpdQjdDwtLS3t7bEiSZKqqqrGxsZO/j+0pqZm\ncRd5jR0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\n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\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkSh22F1/5EE3ft5Y\n5I0CAHQGxQy73Dv/vvbWjyc353JF3CgAQGeRKc5mxj9+6em/+89nU2YVZ3MAAJ1QkcKu+zr7\nnDp612zTpyedcmFxtggA0NkUKezK61ZerS60zK5c5KVjxox59NFH86fr6uquu+66IoxUVlZW\nhK3QyZWVldXX15d6ivkkSZIkSXubqt1KkiR/oq6urrSTLOCiiy56+umnSz3FoiVJkmt/L7n5\n73//W+oRiF9xHvOz2WwrlxYp7Fo3ceLEcePG5U83NDSk0+kibHTu4zUsP0mSFOd4bqv2OVV7\n1t5W7Jlnnrn99ttLPQUwn/bwmN8uwm777bcfPHhw/nRFRcWMGTOKsNGWlpYibIVOrqWlpTjH\nc+HS6XRFRUVDQ0OpB+kY0ul0ZWVlCKGhoaFdPQs15xGsdwiblHiUDuPeEGaWegYiV5zH/Fwu\nV1tbu7hL20XYjRw5cuTIkfnT2Wx24sSJRdiosKMIWlpaGhvb1+f7lJWVVVRUtLep2q3y8vJ8\n2M2cObP1X38U2ZxHsE1CuLXEo3QYfUL4pNQzELmiPea3EnY+oBgAIBLCDgAgEsIOACASRX2N\nXbp85X/+85/F3CIAQOfhGTsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "prob_estimates <- c(0.1, 0.15, 0.2, 0.2, 0.55, 0.6, 0.6, 0.65, 0.7, 0.75)\n",
    "df <- data.frame(prob_estimates)\n",
    "ggplot(df, aes(x=prob_estimates)) +\n",
    "    geom_histogram(binwidth=0.1, fill=\"blue\", color=\"black\") +\n",
    "    labs(title=\"Histogram of Probability Estimates\", x=\"Probability Estimate\", y=\"Count\")\n",
    "majority_vote <- ifelse(prob_estimates >= 0.5, \"Red\", \"Green\")\n",
    "majority_class <- ifelse(sum(majority_vote == \"Red\") > sum(majority_vote == \"Green\"), \"Red\", \"Green\")\n",
    "paste0(\"The class prediction by majority vote is: \", majority_class)\n",
    "average_prob <- mean(prob_estimates)\n",
    "average_class <- ifelse(average_prob >= 0.5, \"Red\", \"Green\")\n",
    "paste0(\"The class prediction by average probability is: \", average_class)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "426df3d8",
   "metadata": {
    "papermill": {
     "duration": 0.018205,
     "end_time": "2023-07-17T15:25:59.129764",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.111559",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# *FIX ME*"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "26941145",
   "metadata": {
    "papermill": {
     "duration": 0.018207,
     "end_time": "2023-07-17T15:25:59.166138",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.147931",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Applied\n",
    "### 8. In the lab, a classification tree was applied to the Carseats data set after converting Sales into a qualitative response variable. Now we will seek to predict Sales using regression trees and related approaches, treating the response as a quantitative variable.\n",
    "#### (a) Split the data set into a training set and a test set."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "252baf8e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:25:59.207202Z",
     "iopub.status.busy": "2023-07-17T15:25:59.205008Z",
     "iopub.status.idle": "2023-07-17T15:25:59.245365Z",
     "shell.execute_reply": "2023-07-17T15:25:59.243313Z"
    },
    "papermill": {
     "duration": 0.064403,
     "end_time": "2023-07-17T15:25:59.248753",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.184350",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "set.seed(42)\n",
    "idx = createDataPartition(Carseats$Sales, p= .75, list = FALSE, times =1)\n",
    "train = Carseats[idx, ]\n",
    "test = Carseats[-idx, ]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "239946fc",
   "metadata": {
    "papermill": {
     "duration": 0.018783,
     "end_time": "2023-07-17T15:25:59.285996",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.267213",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (b) Fit a regression tree to the training set. Plot the tree, and interpret the results. What test MSE do you obtain?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "d0c0b2e6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:25:59.326819Z",
     "iopub.status.busy": "2023-07-17T15:25:59.325007Z",
     "iopub.status.idle": "2023-07-17T15:25:59.447636Z",
     "shell.execute_reply": "2023-07-17T15:25:59.444579Z"
    },
    "papermill": {
     "duration": 0.146381,
     "end_time": "2023-07-17T15:25:59.450700",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.304319",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'The test MSE for our regression tree is: 3.71463433378956'"
      ],
      "text/latex": [
       "'The test MSE for our regression tree is: 3.71463433378956'"
      ],
      "text/markdown": [
       "'The test MSE for our regression tree is: 3.71463433378956'"
      ],
      "text/plain": [
       "[1] \"The test MSE for our regression tree is: 3.71463433378956\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAV\nmklEQVR4nO3dvc9c5Z2A4WeMDWNjwlfCYqwobEdJA4gCIdi4SYW027DdptsiRSSqtEgpEFL+\nAxBp3K3YbS1AiAqoaFbuSIT4UBLbEH9NsGG2MA0ReMnM6zkz91xX/8zzmzPnHd8+8zVbLpcD\nAIDdd2jqAQAAOBjCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELY\nAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAi\nhB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4A\nIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHs\nAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAAR\nwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcA\nECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2\nAAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAI\nYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMA\niBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHcBeeOiOwy98+MXUUwC3lrADAIgQdgAA\nEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQMThqQcAbrmXX375zTffnHoKJnb++tf/9R//\n9r/Hjkw9CFN69tlnX3jhhamn4BaaLZfLqWcAbq2jR48uFouppwCmN5/Pr169OvUU3EKu2EHf\ncrk8cuTImTNnph6EKf3rz//l57//7/986PjUgzCZU6dOuZqT54od9M3n8zGGi3Z77qE7Dv/7\n2XMv//PdUw/CZDwV7AMfngAAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQ4XvsAPbC71//n5P/\ndOfUUwC3lu+xgz5fXgUMTwX7wUuxAAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLAD\nAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQI\nOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBA\nhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgB\nAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKE\nHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAg\nQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewA\nACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHC\nDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQ\nIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYA\nABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBECDsAgAhh\nBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCI\nEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBECDsA\ngAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISw\nAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBE\nCDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0A\nQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELY\nAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAi\nhB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4A\nIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHs\nAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAAR\nwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcA\nECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2\nAAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAI\nYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMA\niBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7\nAIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECE\nsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACIOTz0AfK/PP//8gw8+mHqKgq+//nqM\n8fbbb089yM47dOjQo48+etddd009CFtnJ56vduKpwF/ZmmbL5XLqGeC73X///efPn596CviW\n++6779y5c1NPwdbxfHWA/JWtwxU7ttfly5cPHTr0+OOPTz3Izvvoo4/GGD/96U+nHmTnvffe\ne5cvX556CrbRTjxf7cRTgb+yNblix/aaz+djjMViMfUg8A3nJN/HuXFQHMk1+fAEAECEsAMA\niBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7\nAIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECE\nsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEA\nRAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQd\nAECEsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIg4PPUAALAVTpw4\n8dlnn61zC7PZbLWFDz744KeffrrO1hu2/rG6uZWP5M3t3HFegbADgDHGuHDhwmw2e+SRR1ZY\ne6NyHnzwwRXWnj179sKFCyssnNA6x+rmboTXiRMnDvyWd/E4r2C2XC6nngG+23w+H2MsFoup\nB4FvOCfbpnp8d/G8MvPW8h47AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQI\nOwCACGEHABDht2IBYIwxTp48uVf7kuS3Ytlee/K7fuwQ5yTcsIt/C7s48wq8FAsAECHsAAAi\nhB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARh6ce\nAACYwPvvv//WW2+ttvarr74aY7z00kurLX/mmWcee+yx1dZyc7Plcjn1DPDd5vP5GGOxWEw9\nCHzDOUnJXXfddenSpUm2Pn78+MWLFze86bFjx8YYV65c2fC+G+aKHQDso2vXrt12223PP//8\nCmv/8Ic/jDEefvjhFdaePn362rVrKyxc06uvvrr5TTfPFTu2l6sjbBvnJCVTnc/+jm4pH54A\nAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQc\nnnoAAGACzz333F7tuydmy+Vy6hngu83n8zHGYrGYehD4hnMS2HJeigUAiBB2AAARwg4AIELY\nAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAi\nhB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4A\nIELYAQBECDsAgAhhBwAQIewAACIOTz0AW+F3v/vdmTNnpp7i7127dm2M8Ytf/GLqQf7eqVOn\nfv3rX089xc7bzrPu5rb2nLw5Zyzsj9lyuZx6BqZ39OjRxWIx9RQ7Yz6fX716deopdp6zbmOc\nsbA/XLFjjDGWy+WRI0deeeWVqQf5li+++GKMcffdd089yLf88pe/9N+hA7GdZ93N/fWvfx1j\n/OhHP5p6kH+AMxb2iit2jDHGfD4fY7h88kM4VgfFkdwMxxn2ig9PAABECDsAgAhhBwAQIewA\nACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHC\nDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQ\nIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARByeegD+Ac8999w777xzK275yy+/HGPcf//9\nt+LGn3rqqddff/1W3PJNOFYA7KHZcrmcegZ+qPl8/re//W02mx34Ld84DW7RLd9xxx2LxeLA\nb/nmHKvtN5/Pxxj7c3+n4jjDXnHFbsfs3D/8N/5RmYRjBcC+8R47AIAIYQcAECHsAAAihB0A\nQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACL88Aazu5MmTn3zyyTq3sPKPsz300EMff/zxOltv\n2PrHah234kfw/l879xhBgLADVnfu3LnZbHby5MkV1l64cGGMce+9966w9uOPPz537twKCye0\nzrFaxzrHeR27+BhBgLAD1nL77bd/9NFHG950R39Xd5JjNZUdfYxg13mPHQBAhLADAIgQdgAA\nEcIOACBC2AEARPhU7Ka9++67b7/99mprv/rqqzHGSy+9tNryp59++oknnlhtLQCw/WbL5XLq\nGfbL8ePHL1++PMnWd95556VLlza86bFjx8YYV65c2fC+N75qYbFYbHjfdZh5+/ddxy7OvI59\nu7+wJVyx27Tr16/fdtttzz///Apr//jHP44xfvazn62w9vTp09evX19h4Zpee+21zW86ocVi\n8emnn65zCx9++OFqC0+cOOGbwwD2nCt2m+YKx2YcPXp0jHH16tUN7/uTn/zkL3/5y4Y3veHH\nP/7xn//85w1v6nz+4XZx5nXs2/2FLeGKHU2/+tWvJtn34sWLs9nskUceWWHtn/70pzHGAw88\nsMLas2fPXrx4cYWFAJS4YrdprnC07dvju2/7rmMXZ17Hvt1f2BK+7gQAIELYAQBECDsAgAhh\nBwAQIewAACKEHQBAhO+xA1Z3+PA0zyFT7Quw5Tw5Aqt744039mpfgC3nC4o37dixY2OMK1eu\n7Mm++8YX9vJ99u0x2rf7C1vCFbtNO3369F7tCwBsjCt2cJBcseP77NtjtG/3F7aET8UCAER4\nKRbgh/rNb37z1ltvrbb22rVrY4wnn3xyteXPPPPMb3/729XWrmyd+/vll1+OXbu/EOClWDhI\nXoptO3r06FQHeT6fX716dcOb7tv9hQBX7OAg3fj08f7su2+Wy+WRI0fOnDmzwtobhXQjwf9R\np06dmuQ/4ft2fyHAFTs4SOfPnx9j3HfffXuy777Ztyuy+7YvBLhiBwdpqrSSdAAMn4oFAMgQ\ndgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCA\nCGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4AIELYAQBECDsAgIjDUw8AwJa655579mpfCJgt\nl8upZwDYDfP5fIyxWCz2ZF9g53gpFgAgQtgBAER4jx3ADzWbzfZqX2DnCDuAH+rFF1/cq32B\nnePDEwAAEd5jBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHsAAAi\nhB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAARwg4A\nIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcAECHs\nAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2AAAR\nwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAIYQcA\nECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMAiBB2\nAAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7AIAI\nYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECEsAMA\niBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEARAg7\nAIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQdAECE\nsAMAiBB2AAARwg4AIELYAQBECDsAgAhhBwAQIewAACKEHQBAhLADAIgQdgAAEcIOACBC2AEA\nRAg7AIAIYQcAECHsAAAihB0AQISwAwCIEHYAABHCDgAgQtgBAEQIOwCACGEHABAh7AAAIoQd\nAECEsAMAiBB2AAARwg4AIELYAQBE/B9ded5iEpoGqgAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "reg_tree = tree(Sales ~ ., data = train)\n",
    "plot(reg_tree)\n",
    "rt_pred = predict(reg_tree, newdata = test)\n",
    "rt_mse = mean((rt_pred - test$Sales)^2)\n",
    "paste0(\"The test MSE for our regression tree is: \", rt_mse)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "53932abc",
   "metadata": {
    "papermill": {
     "duration": 0.018682,
     "end_time": "2023-07-17T15:25:59.487910",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.469228",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (c) Use cross-validation in order to determine the optimal level of tree complexity. Does pruning the tree improve the test MSE?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "054bb62c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:25:59.529294Z",
     "iopub.status.busy": "2023-07-17T15:25:59.527523Z",
     "iopub.status.idle": "2023-07-17T15:25:59.668771Z",
     "shell.execute_reply": "2023-07-17T15:25:59.665197Z"
    },
    "papermill": {
     "duration": 0.166033,
     "end_time": "2023-07-17T15:25:59.672559",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.506526",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'The mse of the pruned tree is: 3.66921598122379'"
      ],
      "text/latex": [
       "'The mse of the pruned tree is: 3.66921598122379'"
      ],
      "text/markdown": [
       "'The mse of the pruned tree is: 3.66921598122379'"
      ],
      "text/plain": [
       "[1] \"The mse of the pruned tree is: 3.66921598122379\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\ntH379kmTJs2fP7/0ln9q+fLl999/f+kVmYb51+e/tG3btsHBwSuuuGLq1KmltzRo0qRJL7zw\nQmdnZ+khwB8TdvyDZcuWbdq0qfSKka2np+f48eOlV2Ty9TkcvPHGG9dff33pFcAf878u/sGp\nU6eqqnrggQfmzZtXessf279//7Rp0zo6hulvEdx1113+s9Q6w//r88+dPn36wIED559/fukh\nDerv79+9e/evv/5aegjwTwk7/sCiRYtWrFhResWIdPfdd5eekM/XZynPPffc7t27S68A/sww\nfewBAMDfJewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQ\nwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7\nAIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAjRWXoA\nf8/zzz//0EMP1ev1Fp1/9OjRqqpuv/32rq6uFt1i/PjxO3bs6O3tbdH5f+7mm2/eunVr684/\nefJkVVWTJ09u3S2uvfba1157rXXnAzByCbsR5qWXXhoYGKjVai29y08//dSik+v1+uDg4Nat\nW1esWNGiW/y5N99885dffmndJ3CouY8cOdK68998880WHQ7ASCfsRpihbnj99ddLhVGTFi9e\nvGXLlrIburu7T5w4UXZDw3p6ekpPAGD48jt2AAAhhB0AQAhhBwAQQtgBAIQQdgAAIYQdAEAI\nYQcAEELYAQCEEHYAACH85QmgfWbMmHHgwIEmD7nxxhubufyee+55+umnm9xQxBdffNHX19e6\nPxX9FzX5+W/S9OnT9+/fX3AADHPCDmifob90PGPGjMYuP378+I8//jhlypTG/trviRMnDh8+\nvHPnzsbuXtznn39er9e7u7unTJlSZECTn//m7d+/f2BgoMitYaQQdkBbjR07dt++fUVuvWHD\nhrJPm86Iq6++evPmzaVXlOFvJcO/5HfsAABCCDsAgBDCDgAghLADAAgh7AAAQnhVbLtt27Zt\ny5YtDV8+9HLCV199dffu3Y2dMGbMmFWrVvX29ja8AQAYnoRduy1duvTYsWNNHvLiiy82c/nm\nzZs3bNjQ5IbGdHd3V1U1bty4IncHgGzCrt1OnTo1ZsyYW2+9tbHLjx079uWXX86bN6+xy7/5\n5pvNmzf/+OOPjV3evGeffXbt2rVLly4tNaC4w4cPN//537NnT8PXTpgw4ZxzzmlyAADDk7Ar\noLOzc926dUVuvWHDhrJvbTpr1qz+/v6CA0q9Y/6QnTt3XnLJJc2fM2fOnGYu//TTT+fOndv8\nDACGG2HH6HLvvfcWvPvQk7Zx48bNmjWrsRMOHTpUVdXUqVMbu3zv3r0///zznj17hB1AJGHH\n6LJ69erSE6orr7yy1HPTxYsXN/PaHQCGOW93AgAQQtgBAIQQdgAAIYQdAEAIYQcAEELYAQCE\n8HYnQPt0dpb8N2fy5MlVVU2YMKHgBoCWEnZA+2zatKng3RcsWPDKK6/ccMMNBTcAtJSwa7eO\njpI//h4/fnxVVd3d3QU3MJrNnz+/7IDbbrut7ACAlhJ27bZ+/fqCd1+yZMkTTzxx++23F9wA\nALSIsGu3m266qeyARx55pOwAAKBFvCoWACCEJ3YAbfLuu+8288h8cHCwqqqPPvrommuuafiQ\nJUuW9Pf3N3x5M06ePLlixYqjR482c0JVVc18+BMnTtywYcPYsWMbPgGGOWEH0CaPP/74Bx98\n0OQhR48ebeaQjz/+uFTYbdy48a233mr+nCY/hxs3bvTKaIIJO2ifmTNnVlU1bdq0UgOGbj00\ng/b77bffqqrq7+9fsGBBYyf88MMPZ599dsMDli9fXq/XG768SUMf/mWXXbZmzZrGTjhx4kRV\nVT09PY1dft999+3YsWNoBqQSdtA+8+bN++qrry644IJSA9avX//4448XHEBVVXPnzl20aFGR\nW5d9u6Uhvb29pT783t7eIveFdir/TQ6jSvGoKj4AgNYRdgAAIYQdAEAIYQcAEELYAQCEEHYA\nACGEHQBACGEHABBC2AEAhBB2AAAhhB0AQAhhBwAQQtgBAIQQdgAAIYQdAEAIYQcAEELYAQCE\nEHYAACGEHQBACGEHABBC2AEAhBB2AAAhhB0A7XDhhRfWarWLLrqo1ICLLrqoVqtdeOGFpQZA\nG3SWHgDAqNDX13f69OmCA9auXbt27dqCA6ANPLEDAAgh7AAAQvhRLECbdHZ2VlXV1dVVakCt\nVit1a6A9hB1Amzz55JNr1qxZtmxZqQGPPfZYqVsD7VGr1+ulNwAAcAb4HTsAgBDCDgAghLAD\nAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAg\nhLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDC\nDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsA\ngBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABC\nCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHs\nAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMA\nCCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCE\nsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIO\nACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCA\nEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEII\nOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewA\nAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAI\nIewAAEIIOwCAEMIOACCEsAMACPF/S2eAVRbT3soAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "cv_tree = cv.tree(reg_tree)\n",
    "best_size = cv_tree$size[which.min(cv_tree$dev)]\n",
    "pruned_tree = prune.tree(reg_tree, best = best_size)\n",
    "plot(pruned_tree)\n",
    "pt_pred = predict(pruned_tree, newdata = test)\n",
    "pt_mse = mean((pt_pred - test$Sales)^2)\n",
    "paste0(\"The mse of the pruned tree is: \", pt_mse)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "556e7441",
   "metadata": {
    "papermill": {
     "duration": 0.027048,
     "end_time": "2023-07-17T15:25:59.726514",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.699466",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# *FIX ME*"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f6c40589",
   "metadata": {
    "papermill": {
     "duration": 0.019659,
     "end_time": "2023-07-17T15:25:59.767978",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.748319",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### (d) Use the bagging approach in order to analyze this data. What test MSE do you obtain? Use the importance() function to determine which variables are most important."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "83e67a5b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:25:59.811761Z",
     "iopub.status.busy": "2023-07-17T15:25:59.809812Z",
     "iopub.status.idle": "2023-07-17T15:26:00.867862Z",
     "shell.execute_reply": "2023-07-17T15:26:00.865550Z"
    },
    "papermill": {
     "duration": 1.083057,
     "end_time": "2023-07-17T15:26:00.870741",
     "exception": false,
     "start_time": "2023-07-17T15:25:59.787684",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'The mse for the bagging approach is: 2.25004198506043'"
      ],
      "text/latex": [
       "'The mse for the bagging approach is: 2.25004198506043'"
      ],
      "text/markdown": [
       "'The mse for the bagging approach is: 2.25004198506043'"
      ],
      "text/plain": [
       "[1] \"The mse for the bagging approach is: 2.25004198506043\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 10 × 2 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>%IncMSE</th><th scope=col>IncNodePurity</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>CompPrice</th><td>31.6781608</td><td>248.747153</td></tr>\n",
       "\t<tr><th scope=row>Income</th><td> 5.8035937</td><td>124.865080</td></tr>\n",
       "\t<tr><th scope=row>Advertising</th><td>21.4893197</td><td>151.979905</td></tr>\n",
       "\t<tr><th scope=row>Population</th><td> 1.3197875</td><td> 87.005126</td></tr>\n",
       "\t<tr><th scope=row>Price</th><td>68.3376408</td><td>682.639737</td></tr>\n",
       "\t<tr><th scope=row>ShelveLoc</th><td>77.8474377</td><td>779.229230</td></tr>\n",
       "\t<tr><th scope=row>Age</th><td>19.4409705</td><td>215.304139</td></tr>\n",
       "\t<tr><th scope=row>Education</th><td>-0.8612436</td><td> 57.379449</td></tr>\n",
       "\t<tr><th scope=row>Urban</th><td>-0.8038137</td><td>  8.616332</td></tr>\n",
       "\t<tr><th scope=row>US</th><td> 4.9367116</td><td> 13.554418</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 10 × 2 of type dbl\n",
       "\\begin{tabular}{r|ll}\n",
       "  & \\%IncMSE & IncNodePurity\\\\\n",
       "\\hline\n",
       "\tCompPrice & 31.6781608 & 248.747153\\\\\n",
       "\tIncome &  5.8035937 & 124.865080\\\\\n",
       "\tAdvertising & 21.4893197 & 151.979905\\\\\n",
       "\tPopulation &  1.3197875 &  87.005126\\\\\n",
       "\tPrice & 68.3376408 & 682.639737\\\\\n",
       "\tShelveLoc & 77.8474377 & 779.229230\\\\\n",
       "\tAge & 19.4409705 & 215.304139\\\\\n",
       "\tEducation & -0.8612436 &  57.379449\\\\\n",
       "\tUrban & -0.8038137 &   8.616332\\\\\n",
       "\tUS &  4.9367116 &  13.554418\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 10 × 2 of type dbl\n",
       "\n",
       "| <!--/--> | %IncMSE | IncNodePurity |\n",
       "|---|---|---|\n",
       "| CompPrice | 31.6781608 | 248.747153 |\n",
       "| Income |  5.8035937 | 124.865080 |\n",
       "| Advertising | 21.4893197 | 151.979905 |\n",
       "| Population |  1.3197875 |  87.005126 |\n",
       "| Price | 68.3376408 | 682.639737 |\n",
       "| ShelveLoc | 77.8474377 | 779.229230 |\n",
       "| Age | 19.4409705 | 215.304139 |\n",
       "| Education | -0.8612436 |  57.379449 |\n",
       "| Urban | -0.8038137 |   8.616332 |\n",
       "| US |  4.9367116 |  13.554418 |\n",
       "\n"
      ],
      "text/plain": [
       "            %IncMSE    IncNodePurity\n",
       "CompPrice   31.6781608 248.747153   \n",
       "Income       5.8035937 124.865080   \n",
       "Advertising 21.4893197 151.979905   \n",
       "Population   1.3197875  87.005126   \n",
       "Price       68.3376408 682.639737   \n",
       "ShelveLoc   77.8474377 779.229230   \n",
       "Age         19.4409705 215.304139   \n",
       "Education   -0.8612436  57.379449   \n",
       "Urban       -0.8038137   8.616332   \n",
       "US           4.9367116  13.554418   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bag_model = randomForest(Sales ~ ., data = train, mtry = ncol(train)-1, importance = TRUE)\n",
    "bag_pred = predict(bag_model, newdata = test)\n",
    "bag_mse = mean((bag_pred - test$Sales)^2)\n",
    "paste0(\"The mse for the bagging approach is: \", bag_mse)\n",
    "importance(bag_model)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9a5d03d0",
   "metadata": {
    "papermill": {
     "duration": 0.020513,
     "end_time": "2023-07-17T15:26:00.911812",
     "exception": false,
     "start_time": "2023-07-17T15:26:00.891299",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# *FIX ME*"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "106cb40b",
   "metadata": {
    "papermill": {
     "duration": 0.020036,
     "end_time": "2023-07-17T15:26:00.953020",
     "exception": false,
     "start_time": "2023-07-17T15:26:00.932984",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (e) Use random forests to analyze this data. What test MSE do you obtain? Use the importance() function to determine which variables are most important. Describe the effect of m, the number of variables considered at each split, on the error rate obtained."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "552a4f88",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:00.998586Z",
     "iopub.status.busy": "2023-07-17T15:26:00.996587Z",
     "iopub.status.idle": "2023-07-17T15:26:02.005822Z",
     "shell.execute_reply": "2023-07-17T15:26:02.003877Z"
    },
    "papermill": {
     "duration": 1.035018,
     "end_time": "2023-07-17T15:26:02.008742",
     "exception": false,
     "start_time": "2023-07-17T15:26:00.973724",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'The mse for the rf model is: 2.75027193576526'"
      ],
      "text/latex": [
       "'The mse for the rf model is: 2.75027193576526'"
      ],
      "text/markdown": [
       "'The mse for the rf model is: 2.75027193576526'"
      ],
      "text/plain": [
       "[1] \"The mse for the rf model is: 2.75027193576526\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 10 × 2 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>%IncMSE</th><th scope=col>IncNodePurity</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>CompPrice</th><td>16.7503658</td><td>231.97962</td></tr>\n",
       "\t<tr><th scope=row>Income</th><td> 4.0284514</td><td>174.32171</td></tr>\n",
       "\t<tr><th scope=row>Advertising</th><td>13.6411004</td><td>183.69292</td></tr>\n",
       "\t<tr><th scope=row>Population</th><td>-1.1244231</td><td>136.94309</td></tr>\n",
       "\t<tr><th scope=row>Price</th><td>45.3523822</td><td>564.37224</td></tr>\n",
       "\t<tr><th scope=row>ShelveLoc</th><td>49.1612640</td><td>590.75726</td></tr>\n",
       "\t<tr><th scope=row>Age</th><td>15.4835911</td><td>264.99766</td></tr>\n",
       "\t<tr><th scope=row>Education</th><td> 0.4738477</td><td> 96.57580</td></tr>\n",
       "\t<tr><th scope=row>Urban</th><td>-0.8845876</td><td> 19.40185</td></tr>\n",
       "\t<tr><th scope=row>US</th><td> 5.6963537</td><td> 40.04114</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 10 × 2 of type dbl\n",
       "\\begin{tabular}{r|ll}\n",
       "  & \\%IncMSE & IncNodePurity\\\\\n",
       "\\hline\n",
       "\tCompPrice & 16.7503658 & 231.97962\\\\\n",
       "\tIncome &  4.0284514 & 174.32171\\\\\n",
       "\tAdvertising & 13.6411004 & 183.69292\\\\\n",
       "\tPopulation & -1.1244231 & 136.94309\\\\\n",
       "\tPrice & 45.3523822 & 564.37224\\\\\n",
       "\tShelveLoc & 49.1612640 & 590.75726\\\\\n",
       "\tAge & 15.4835911 & 264.99766\\\\\n",
       "\tEducation &  0.4738477 &  96.57580\\\\\n",
       "\tUrban & -0.8845876 &  19.40185\\\\\n",
       "\tUS &  5.6963537 &  40.04114\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 10 × 2 of type dbl\n",
       "\n",
       "| <!--/--> | %IncMSE | IncNodePurity |\n",
       "|---|---|---|\n",
       "| CompPrice | 16.7503658 | 231.97962 |\n",
       "| Income |  4.0284514 | 174.32171 |\n",
       "| Advertising | 13.6411004 | 183.69292 |\n",
       "| Population | -1.1244231 | 136.94309 |\n",
       "| Price | 45.3523822 | 564.37224 |\n",
       "| ShelveLoc | 49.1612640 | 590.75726 |\n",
       "| Age | 15.4835911 | 264.99766 |\n",
       "| Education |  0.4738477 |  96.57580 |\n",
       "| Urban | -0.8845876 |  19.40185 |\n",
       "| US |  5.6963537 |  40.04114 |\n",
       "\n"
      ],
      "text/plain": [
       "            %IncMSE    IncNodePurity\n",
       "CompPrice   16.7503658 231.97962    \n",
       "Income       4.0284514 174.32171    \n",
       "Advertising 13.6411004 183.69292    \n",
       "Population  -1.1244231 136.94309    \n",
       "Price       45.3523822 564.37224    \n",
       "ShelveLoc   49.1612640 590.75726    \n",
       "Age         15.4835911 264.99766    \n",
       "Education    0.4738477  96.57580    \n",
       "Urban       -0.8845876  19.40185    \n",
       "US           5.6963537  40.04114    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "rf_model = randomForest(Sales ~ ., data = train, mtry = sqrt(ncol(train)-1), importance = TRUE)\n",
    "rf_pred = predict(rf_model, newdata = test)\n",
    "rf_mse = mean((rf_pred - test$Sales)^2)\n",
    "paste0(\"The mse for the rf model is: \", rf_mse)\n",
    "importance(rf_model)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d630519e",
   "metadata": {
    "papermill": {
     "duration": 0.022038,
     "end_time": "2023-07-17T15:26:02.051770",
     "exception": false,
     "start_time": "2023-07-17T15:26:02.029732",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# *FIX ME*"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c3941e74",
   "metadata": {
    "papermill": {
     "duration": 0.021077,
     "end_time": "2023-07-17T15:26:02.093932",
     "exception": false,
     "start_time": "2023-07-17T15:26:02.072855",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (f) Now analyze the data using BART, and report your results."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "2f379a53",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:02.142880Z",
     "iopub.status.busy": "2023-07-17T15:26:02.141260Z",
     "iopub.status.idle": "2023-07-17T15:26:07.888296Z",
     "shell.execute_reply": "2023-07-17T15:26:07.885856Z"
    },
    "papermill": {
     "duration": 5.775637,
     "end_time": "2023-07-17T15:26:07.891811",
     "exception": false,
     "start_time": "2023-07-17T15:26:02.116174",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in summary.lm(lm(y.train ~ ., data.frame(t(x.train), y.train))):\n",
      "“essentially perfect fit: summary may be unreliable”\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "*****Calling gbart: type=1\n",
      "*****Data:\n",
      "data:n,p,np: 301, 12, 99\n",
      "y1,yn: 1.974485, 2.184485\n",
      "x1,x[n*p]: 9.500000, 1.000000\n",
      "xp1,xp[np*p]: 4.150000, 0.000000\n",
      "*****Number of Trees: 200\n",
      "*****Number of Cut Points: 100 ... 1\n",
      "*****burn,nd,thin: 100,1000,1\n",
      "*****Prior:beta,alpha,tau,nu,lambda,offset: 2,0.95,0.287616,3,2.62724e-31,7.52551\n",
      "*****sigma: 0.000000\n",
      "*****w (weights): 1.000000 ... 1.000000\n",
      "*****Dirichlet:sparse,theta,omega,a,b,rho,augment: 0,0,1,0.5,1,12,0\n",
      "*****printevery: 100\n",
      "\n",
      "MCMC\n",
      "done 0 (out of 1100)\n",
      "done 100 (out of 1100)\n",
      "done 200 (out of 1100)\n",
      "done 300 (out of 1100)\n",
      "done 400 (out of 1100)\n",
      "done 500 (out of 1100)\n",
      "done 600 (out of 1100)\n",
      "done 700 (out of 1100)\n",
      "done 800 (out of 1100)\n",
      "done 900 (out of 1100)\n",
      "done 1000 (out of 1100)\n",
      "time: 4s\n",
      "trcnt,tecnt: 1000,1000\n",
      "*****In main of C++ for bart prediction\n",
      "tc (threadcount): 1\n",
      "number of bart draws: 1000\n",
      "number of trees in bart sum: 200\n",
      "number of x columns: 12\n",
      "from x,np,p: 12, 99\n",
      "***using serial code\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'The mse by BART is: 14.967185479883'"
      ],
      "text/latex": [
       "'The mse by BART is: 14.967185479883'"
      ],
      "text/markdown": [
       "'The mse by BART is: 14.967185479883'"
      ],
      "text/plain": [
       "[1] \"The mse by BART is: 14.967185479883\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# One-hot encoding so BART will work.\n",
    "train$ShelveLoc = as.factor(train$ShelveLoc)\n",
    "dummy_vars_train = model.matrix(~ShelveLoc-1, data = train)\n",
    "dummy_df_train = as.data.frame(dummy_vars_train)\n",
    "\n",
    "train_onehot = cbind(train[, !(names(train) %in% \"ShelveLoc\")], dummy_df_train)\n",
    "train_onehot$Urban = ifelse(train_onehot$Urban == \"Yes\", 1, 0)\n",
    "train_onehot$US = ifelse(train_onehot$US == \"Yes\", 1, 0)\n",
    "\n",
    "\n",
    "test$ShelveLoc = as.factor(test$ShelveLoc)\n",
    "dummy_vars_test = model.matrix(~ShelveLoc-1, data = test)\n",
    "dummy_df_test = as.data.frame(dummy_vars_test)\n",
    "\n",
    "test_onehot = cbind(test[, !(names(test) %in% \"ShelveLoc\")], dummy_df_test)\n",
    "test_onehot$Urban = ifelse(test_onehot$Urban == \"Yes\", 1, 0)\n",
    "test_onehot$US = ifelse(test_onehot$US == \"Yes\", 1, 0)\n",
    "\n",
    "#training bart\n",
    "X_train = as.matrix(train_onehot[-ncol(train_onehot)])\n",
    "y_train = as.matrix(train_onehot$Sales)\n",
    "X_test = as.matrix(test_onehot[-ncol(test_onehot)])\n",
    "bart_model = gbart(X_train, y_train, x.test = X_test)\n",
    "bart_pred = predict(bart_model, X_test, mc.cores = 1)\n",
    "bart_mse = mean((bart_pred - test_onehot$Sales)^2)\n",
    "paste0(\"The mse by BART is: \", bart_mse)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7e858c93",
   "metadata": {
    "papermill": {
     "duration": 0.020983,
     "end_time": "2023-07-17T15:26:07.933897",
     "exception": false,
     "start_time": "2023-07-17T15:26:07.912914",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 10. We now use boosting to predict Salary in the Hitters data set.\n",
    "#### (a) Remove the observations for whom the salary information is unknown, and then log-transform the salaries."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "0dea49f1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:07.979728Z",
     "iopub.status.busy": "2023-07-17T15:26:07.978017Z",
     "iopub.status.idle": "2023-07-17T15:26:08.050342Z",
     "shell.execute_reply": "2023-07-17T15:26:08.047791Z"
    },
    "papermill": {
     "duration": 0.098672,
     "end_time": "2023-07-17T15:26:08.053552",
     "exception": false,
     "start_time": "2023-07-17T15:26:07.954880",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 20</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>AtBat</th><th scope=col>Hits</th><th scope=col>HmRun</th><th scope=col>Runs</th><th scope=col>RBI</th><th scope=col>Walks</th><th scope=col>Years</th><th scope=col>CAtBat</th><th scope=col>CHits</th><th scope=col>CHmRun</th><th scope=col>CRuns</th><th scope=col>CRBI</th><th scope=col>CWalks</th><th scope=col>League</th><th scope=col>Division</th><th scope=col>PutOuts</th><th scope=col>Assists</th><th scope=col>Errors</th><th scope=col>Salary</th><th scope=col>NewLeague</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>2</th><td>315</td><td> 81</td><td> 7</td><td>24</td><td>38</td><td>39</td><td>14</td><td>3449</td><td> 835</td><td> 69</td><td>321</td><td>414</td><td>375</td><td>1</td><td>1</td><td>632</td><td> 43</td><td>10</td><td>6.163315</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>479</td><td>130</td><td>18</td><td>66</td><td>72</td><td>76</td><td> 3</td><td>1624</td><td> 457</td><td> 63</td><td>224</td><td>266</td><td>263</td><td>0</td><td>1</td><td>880</td><td> 82</td><td>14</td><td>6.173786</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>496</td><td>141</td><td>20</td><td>65</td><td>78</td><td>37</td><td>11</td><td>5628</td><td>1575</td><td>225</td><td>828</td><td>838</td><td>354</td><td>1</td><td>0</td><td>200</td><td> 11</td><td> 3</td><td>6.214608</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>321</td><td> 87</td><td>10</td><td>39</td><td>42</td><td>30</td><td> 2</td><td> 396</td><td> 101</td><td> 12</td><td> 48</td><td> 46</td><td> 33</td><td>1</td><td>0</td><td>805</td><td> 40</td><td> 4</td><td>4.516339</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>594</td><td>169</td><td> 4</td><td>74</td><td>51</td><td>35</td><td>11</td><td>4408</td><td>1133</td><td> 19</td><td>501</td><td>336</td><td>194</td><td>0</td><td>1</td><td>282</td><td>421</td><td>25</td><td>6.620073</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>185</td><td> 37</td><td> 1</td><td>23</td><td> 8</td><td>21</td><td> 2</td><td> 214</td><td>  42</td><td>  1</td><td> 30</td><td>  9</td><td> 24</td><td>1</td><td>0</td><td> 76</td><td>127</td><td> 7</td><td>4.248495</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 20\n",
       "\\begin{tabular}{r|llllllllllllllllllll}\n",
       "  & AtBat & Hits & HmRun & Runs & RBI & Walks & Years & CAtBat & CHits & CHmRun & CRuns & CRBI & CWalks & League & Division & PutOuts & Assists & Errors & Salary & NewLeague\\\\\n",
       "  & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <int> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t2 & 315 &  81 &  7 & 24 & 38 & 39 & 14 & 3449 &  835 &  69 & 321 & 414 & 375 & 1 & 1 & 632 &  43 & 10 & 6.163315 & 1\\\\\n",
       "\t3 & 479 & 130 & 18 & 66 & 72 & 76 &  3 & 1624 &  457 &  63 & 224 & 266 & 263 & 0 & 1 & 880 &  82 & 14 & 6.173786 & 0\\\\\n",
       "\t4 & 496 & 141 & 20 & 65 & 78 & 37 & 11 & 5628 & 1575 & 225 & 828 & 838 & 354 & 1 & 0 & 200 &  11 &  3 & 6.214608 & 1\\\\\n",
       "\t5 & 321 &  87 & 10 & 39 & 42 & 30 &  2 &  396 &  101 &  12 &  48 &  46 &  33 & 1 & 0 & 805 &  40 &  4 & 4.516339 & 1\\\\\n",
       "\t6 & 594 & 169 &  4 & 74 & 51 & 35 & 11 & 4408 & 1133 &  19 & 501 & 336 & 194 & 0 & 1 & 282 & 421 & 25 & 6.620073 & 0\\\\\n",
       "\t7 & 185 &  37 &  1 & 23 &  8 & 21 &  2 &  214 &   42 &   1 &  30 &   9 &  24 & 1 & 0 &  76 & 127 &  7 & 4.248495 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 20\n",
       "\n",
       "| <!--/--> | AtBat &lt;int&gt; | Hits &lt;int&gt; | HmRun &lt;int&gt; | Runs &lt;int&gt; | RBI &lt;int&gt; | Walks &lt;int&gt; | Years &lt;int&gt; | CAtBat &lt;int&gt; | CHits &lt;int&gt; | CHmRun &lt;int&gt; | CRuns &lt;int&gt; | CRBI &lt;int&gt; | CWalks &lt;int&gt; | League &lt;dbl&gt; | Division &lt;dbl&gt; | PutOuts &lt;int&gt; | Assists &lt;int&gt; | Errors &lt;int&gt; | Salary &lt;dbl&gt; | NewLeague &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 2 | 315 |  81 |  7 | 24 | 38 | 39 | 14 | 3449 |  835 |  69 | 321 | 414 | 375 | 1 | 1 | 632 |  43 | 10 | 6.163315 | 1 |\n",
       "| 3 | 479 | 130 | 18 | 66 | 72 | 76 |  3 | 1624 |  457 |  63 | 224 | 266 | 263 | 0 | 1 | 880 |  82 | 14 | 6.173786 | 0 |\n",
       "| 4 | 496 | 141 | 20 | 65 | 78 | 37 | 11 | 5628 | 1575 | 225 | 828 | 838 | 354 | 1 | 0 | 200 |  11 |  3 | 6.214608 | 1 |\n",
       "| 5 | 321 |  87 | 10 | 39 | 42 | 30 |  2 |  396 |  101 |  12 |  48 |  46 |  33 | 1 | 0 | 805 |  40 |  4 | 4.516339 | 1 |\n",
       "| 6 | 594 | 169 |  4 | 74 | 51 | 35 | 11 | 4408 | 1133 |  19 | 501 | 336 | 194 | 0 | 1 | 282 | 421 | 25 | 6.620073 | 0 |\n",
       "| 7 | 185 |  37 |  1 | 23 |  8 | 21 |  2 |  214 |   42 |   1 |  30 |   9 |  24 | 1 | 0 |  76 | 127 |  7 | 4.248495 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  AtBat Hits HmRun Runs RBI Walks Years CAtBat CHits CHmRun CRuns CRBI CWalks\n",
       "2 315    81   7    24   38  39    14    3449    835   69    321   414  375   \n",
       "3 479   130  18    66   72  76     3    1624    457   63    224   266  263   \n",
       "4 496   141  20    65   78  37    11    5628   1575  225    828   838  354   \n",
       "5 321    87  10    39   42  30     2     396    101   12     48    46   33   \n",
       "6 594   169   4    74   51  35    11    4408   1133   19    501   336  194   \n",
       "7 185    37   1    23    8  21     2     214     42    1     30     9   24   \n",
       "  League Division PutOuts Assists Errors Salary   NewLeague\n",
       "2 1      1        632      43     10     6.163315 1        \n",
       "3 0      1        880      82     14     6.173786 0        \n",
       "4 1      0        200      11      3     6.214608 1        \n",
       "5 1      0        805      40      4     4.516339 1        \n",
       "6 0      1        282     421     25     6.620073 0        \n",
       "7 1      0         76     127      7     4.248495 0        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "hitters= read.csv(\"/kaggle/input/cs5565-datasets/ALL CSV FILES - 2nd Edition/Hitters.csv\")\n",
    "hitters$League = ifelse(hitters$League == 'N', 1, 0)\n",
    "hitters$Division = ifelse(hitters$Division == 'W', 1, 0)\n",
    "hitters$NewLeague = ifelse(hitters$NewLeague == 'N', 1, 0)\n",
    "hitters = na.omit(hitters)\n",
    "hitters = as.data.frame(hitters)\n",
    "hitters$Salary = log(hitters$Salary)\n",
    "head(hitters)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9a38409b",
   "metadata": {
    "papermill": {
     "duration": 0.021038,
     "end_time": "2023-07-17T15:26:08.095682",
     "exception": false,
     "start_time": "2023-07-17T15:26:08.074644",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (b) Create a training set consisting of the first 200 observations, and a test set consisting of the remaining observations."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "3fb1d4bb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:08.141865Z",
     "iopub.status.busy": "2023-07-17T15:26:08.140217Z",
     "iopub.status.idle": "2023-07-17T15:26:08.158333Z",
     "shell.execute_reply": "2023-07-17T15:26:08.156492Z"
    },
    "papermill": {
     "duration": 0.045068,
     "end_time": "2023-07-17T15:26:08.161797",
     "exception": false,
     "start_time": "2023-07-17T15:26:08.116729",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "train = hitters[1:200, ]\n",
    "test = hitters[201:nrow(hitters), ]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "99f2b40d",
   "metadata": {
    "papermill": {
     "duration": 0.02186,
     "end_time": "2023-07-17T15:26:08.205154",
     "exception": false,
     "start_time": "2023-07-17T15:26:08.183294",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (c) Perform boosting on the training set with 1,000 trees for a range of values of the shrinkage parameter λ. Produce a plot with different shrinkage values on the x-axis and the corresponding training set MSE on the y-axis."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "f13fd398",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:08.251975Z",
     "iopub.status.busy": "2023-07-17T15:26:08.250289Z",
     "iopub.status.idle": "2023-07-17T15:26:17.015361Z",
     "shell.execute_reply": "2023-07-17T15:26:17.010492Z"
    },
    "papermill": {
     "duration": 8.792813,
     "end_time": "2023-07-17T15:26:17.019375",
     "exception": false,
     "start_time": "2023-07-17T15:26:08.226562",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nBb2yekFBQUlJSXfv3j158iQRhYWF8RozNnfu3HnmzJl//vnnp59+unTp0tzc3Bs3bhCRv79/\n3759RSJRWFgYm0WPVTIgIGDlypUlJSXFxcWDBg2ysbFZunRpmzZtHBwc/P39/f39v/jiix49\neiQmJn7++edsZAYRrV+/Pjo6Oj09XbNiYWFhiYmJ6vcCnZ2dN23a9PjxY5VK1b17d4FAcPLk\nyenTp69YsWLXrl1lOjvhI6FLwS4kJMTQqtOOdVHqLTc2TWn75cSbuXL1lireny5at6ajt3ll\nVBAAAN4Wx3G+vr7vFD7GjRt39OjRWbNm7d27t3v37k5OTunp6TKZ7NKlS5aWlhEREUTEVipL\nSEg4fvx4165dW7ZsqXkEOzs7IsrKylIoFERUJkrWqFEjOTlZqVSy7XK5PC8vj4gsLS1PnTrF\nChDR6NGjV65c+eWXX7IZj9kwCyIaOHDg4cOHR44c6eLiolKpzMzMzp8/z66UiHie37hxY2Zm\n5uLFi9mqu25ubuy8IpHo119/3bZt24wZMwwMDExNTVNSUoYOHWpjYxMXF9e0aVOVStWiRQuB\nQLBly5aoqCj2XFgul4eFhWVnZzds2PDkyZNxcXGsXzAxMbF///7t27e/fPkym2BPLT8/n3Vk\nurm5GRkZ/dv3OS0tLTU1VSQSeXt7l3lqDDqgMrsL3xERmdgPU3+Zc32ekVDACaSte0dOnfXb\n8iW/fTeoo6lQIDby/DunuALPi0exAAAfiOLi4rFjx8pkMvVdzMTExMPDg/2/qakpW+6CiHr2\n7Kk5apVhq5+dO3dux44dRDR79mzNT6dPn05E06ZNCw8PFwqFT58+/fXXX4loy5YtzZo1EwgE\nly9fZiWTk5PV0/v5+vra2Niw/+/fv79SqWRlevfuzXHcvn37vL29HR0deZ5nr+XdvXuXvbf3\n5MkTVlKpVE6fPl1zcmYiMjMzU5/u7NmzRDR+/PhWrVrR81cJExISiCguLm7FihVEtHHjRvWF\nLFiwgF58UHjhwoX27durR/5KpdKuXbsmJSWNHj06ODi4bt26LVq0mDJlytq1a9lzYUYgELRt\n2/bKlSsV2IL64UN+FKvDwW5eXWuO4ybsfmHsesaReCHHuXbeVoHnRbADAPigyOXy48ePb9u2\n7dixY8XFxTzPHzlyJCoqqk2bNi1bthQKhX5+fi/vpVQqWReUQqEoLCyUyWQ1atQoKChQFygs\n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\nQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "lambdas = seq(.001, .1, by = .001)\n",
    "train_mses = rep(0, length(lambdas))\n",
    "test_mses = rep(0, length(lambdas))\n",
    "for(i in 1:length(lambdas)){\n",
    "    gbm_fit = gbm(Salary ~ ., data = train, distribution = \"gaussian\", n.trees = 1000, shrinkage = lambdas[i])\n",
    "    train_preds = predict(gbm_fit, train, n.trees = 1000)\n",
    "    test_preds = predict(gbm_fit, test, n.trees = 1000)\n",
    "    train_mses[i] = mean((train_preds - train$Salary)^2)\n",
    "    test_mses[i] = mean((test_preds - test$Salary)^2)\n",
    "}\n",
    "plot(lambdas, train_mses, type = 'b', xlab = \"shrinkage\", ylab = \"Training MSE\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4915853d",
   "metadata": {
    "papermill": {
     "duration": 0.022418,
     "end_time": "2023-07-17T15:26:17.103387",
     "exception": false,
     "start_time": "2023-07-17T15:26:17.080969",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (d) Produce a plot with different shrinkage values on the x-axis and the corresponding test set MSE on the y-axis."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "4d869d04",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:17.154175Z",
     "iopub.status.busy": "2023-07-17T15:26:17.152218Z",
     "iopub.status.idle": "2023-07-17T15:26:17.249871Z",
     "shell.execute_reply": "2023-07-17T15:26:17.247230Z"
    },
    "papermill": {
     "duration": 0.126912,
     "end_time": "2023-07-17T15:26:17.254220",
     "exception": false,
     "start_time": "2023-07-17T15:26:17.127308",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nMEHuMKIADxVXWoQCe2MrKip6MGKXl5cHLaxRAgMDjx49amhouGXLlj59+jCZzFu3bl24cGHw\n4MEPHjyAVymdp6KigkgkomkmTU1NHR0dVNjxHTsBEStix2AwampqtLS0JNAEQtyJgeCIHSqD\naDQaX8fEP//8c/ny5Vi3SBKJtGTJktjYWBKJ1NrayltEK6QEs0tBe0FE3L7DcbE4ejwVC0QQ\ndrD8EQqpsrIyvsKOTCbjfiVUVFSam5vb2tqgU0lDQwOBQODb/iwkFct3UCxEiIb+LyNLxcro\nQuDgy5CQEN6w3M6dO4lEIu9kzK7g2bNnmZmZixYtwl0rKyoqnjp1Sl1dHTcwBwCgpaXVSWFn\nb2/f3t5++/Zt3rsKCgr++usvOzs7IQ8XxcqOrzsxxMDAgMlkwkhDTk4OiUTCGYvghN2wYcMc\nHBzCw8MvX76M3YzBYMyePZvJZC5btkzIkXSIcP8a+MMtiu1Zfn7+rl27oqKiRCnTFJ3S0lIG\ng4GNw127du3o0aNjxox5//795s2bvby8fv311/Pnz6ekpLS1tc2aNUtajXiVlZWamprY06GN\njc379+9hhYAQYSdKjR2Hwzl+/PiAAQOUlZWNjY1pNJqzs7O4Hr9C5okBTLwHXWlqampra0NV\nAt+IXVRU1OzZsxUUFMLDw9+9e5ebm5uQkGBraxsWFjZnzhwAAN/WKAqF0lMROxUVFQJB1NNl\nh+NicfR4Khb88x3kC/ySwnYovubtTCaTV/3jXoqGhgZlZWW+WRohqVhZxE5cZMJORheSk5Oj\noaHBN95Gp9PNzc1hMKmrgeM+p06dynuXsrLyL7/8kp2djav+7ryXxKxZs8hk8vLly3H7aWlp\nWbBgAZfL9ff3F/JwGo2mra0tSsSOr7BDrewAQoPCigAAIABJREFUADk5Oebm5rjAIdR5qLAj\nEAgxMTFqampTpkwZP3784cOH4+LiNmzYYG1tfevWrYCAgA4Dq8Lp3bu3mppaUlISX6/ja9eu\nAQAcHBw6nEB15syZoKCgVatWhYSEdOZ4cOCGiQEADh06pKSkdPbsWdy5avTo0atWrXr//v39\n+/el8tS87S82NjaNjY2FhYUNDQ1NTU2C3Lw7TMWyWKxJkyYtXLiwtLR05syZq1atmjhxYnZ2\n9oQJE9asWSP6EYobscMlLmGNHfZ9Ly8vX7Fihbm5eXZ29uLFi/v27du7d28vL6+MjAwvL6/z\n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\nOCslJSUqKsrd3d3W1pbaMmzYsOTk5JUrV37xxRfu7u6hoaE7d+588ODB559//qlVWrp06fLl\ny728vBISEnJycl69emVhYWFhYZGVldWzZ0/lytja2s6cOTMtLe3cuXOqXDxN6evr5+XllZWV\n1TLYVf/yhFwuf/PmTYUU4uLikpSUlJmZWfn4+Pj4srIyxUhoPSsrKzt48KCPj8+gQYMq7LK3\nt58yZcrLly/j4uJKS0vrYaHYXbt2TZkyJSEhITAw0MbGxsHBYdSoUVlZWVu2bJkyZYq6vzvU\nFV0KdnNX9BbnX3bpELz39I1iaaV1bOTiB5cPj+7ZasvLAt/vv9dEBQGgzigHuwpPZLNYrIiI\niNTU1B49eijPuRAXF9ejR4+SkpIVK1YoH0/10h06dOjMmTO7d+8ePny4Ct0zaWlpS5cubdeu\n3blz57y8vBgMRk5OTkZGxoABA37++edXr179+OOPysd36dKFEJKUhNGD/xgYGOTl5ZHaTWJH\nPtZjl5mZKRKJKgS7sLAwiUQydepU+ftroJWWls6YMYPNZg8dOrQ2VVLZ69evCwsLO3fuXOXe\nTp06EUIePHhQD/PYEUJ4PN66deueP3++YcOGKVOmTJ8+fffu3a9evRo3bpy6vzXUIV16K7b5\n8IPbrvUauzl6mP8hFtfIoXkza3NjHo8jLRPnZ6UlP32eUyphMBh+EzYdm1jxXTkA0C36+voi\nkUgikVQOdoSQYcOGvX79esGCBW5ubk5OTra2tsnJycnJyTweb9u2bd27d6/z+hw9erS0tHTe\nvHmK+yu1yoWent7IkSOXL19+8ODB5cuXK46n+lcwFKtMX1+fGlhXa49dlZPYBQYG9u/fPzIy\nMisra9asWR4eHuXl5ZcuXVq0aNHt27fnzZtX+Q3r+lFWVkYI4XK5Ve6ltlO/CPUQ7ChNmjSZ\nNGlS/XwvUAddCnaEMEdvPNtn2JFNv0WduJDw6OGtp0n//O3FYPJsm7Xu6dc7ZHR4oIeNZmsJ\nALVHzXNWXFxcUFBQ5Zxnc+bM6dOnz8aNG69cuXLz5s3GjRtPnDgxPDy8RYsW6qjP06dPCSEe\nHh6KLRYWFnw+PykpicFgeHh4/P777+Xl5YpXOqi+Ol1crlR9DAwMqHdj1fqMXeVJ7Cj79u0L\nDw/fsWNHbGysYiOXy128ePG8eRp7387W1pbNZt+/f7/KvdR2apGuehiKBXrQrWBHCCE2XkHL\n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\nZ+6EQIybAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plot(lambdas, test_mses, type = 'b', xlab = \"shrinkage\", ylab = \"Testing MSE\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7c3c5cf9",
   "metadata": {
    "papermill": {
     "duration": 0.024169,
     "end_time": "2023-07-17T15:26:17.302974",
     "exception": false,
     "start_time": "2023-07-17T15:26:17.278805",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (e) Compare the test MSE of boosting to the test MSE that results from applying two of the regression approaches seen in Chapters 3 and 6."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "6d3ad5da",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:17.355202Z",
     "iopub.status.busy": "2023-07-17T15:26:17.353475Z",
     "iopub.status.idle": "2023-07-17T15:26:17.367619Z",
     "shell.execute_reply": "2023-07-17T15:26:17.365759Z"
    },
    "papermill": {
     "duration": 0.044133,
     "end_time": "2023-07-17T15:26:17.371201",
     "exception": false,
     "start_time": "2023-07-17T15:26:17.327068",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Fix me"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "05589ab0",
   "metadata": {
    "papermill": {
     "duration": 0.024065,
     "end_time": "2023-07-17T15:26:17.419442",
     "exception": false,
     "start_time": "2023-07-17T15:26:17.395377",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (f) Which variables appear to be the most important predictors in the boosted model?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "1ea1476b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:17.471606Z",
     "iopub.status.busy": "2023-07-17T15:26:17.469910Z",
     "iopub.status.idle": "2023-07-17T15:26:17.483672Z",
     "shell.execute_reply": "2023-07-17T15:26:17.481909Z"
    },
    "papermill": {
     "duration": 0.043376,
     "end_time": "2023-07-17T15:26:17.486939",
     "exception": false,
     "start_time": "2023-07-17T15:26:17.443563",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Fix me"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bb782d23",
   "metadata": {
    "papermill": {
     "duration": 0.024046,
     "end_time": "2023-07-17T15:26:17.535113",
     "exception": false,
     "start_time": "2023-07-17T15:26:17.511067",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (g) Now apply bagging to the training set. What is the test set MSE for this approach?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "4f709f4f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T15:26:17.588379Z",
     "iopub.status.busy": "2023-07-17T15:26:17.586675Z",
     "iopub.status.idle": "2023-07-17T15:26:18.352162Z",
     "shell.execute_reply": "2023-07-17T15:26:18.350029Z"
    },
    "papermill": {
     "duration": 0.795718,
     "end_time": "2023-07-17T15:26:18.355068",
     "exception": false,
     "start_time": "2023-07-17T15:26:17.559350",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"The test MSE for bagging is: 0.230966452244614\"\n"
     ]
    }
   ],
   "source": [
    "rf_fit = randomForest(Salary ~ ., data = train, mtry = ncol(train) - 1, ntree = 500)\n",
    "preds_rf = predict(rf_fit, test)\n",
    "mse_rf = mean((preds_rf - test$Salary)^2)\n",
    "\n",
    "print(paste0(\"The test MSE for bagging is: \", mse_rf))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8399aac1",
   "metadata": {
    "papermill": {
     "duration": 0.026324,
     "end_time": "2023-07-17T15:26:18.406895",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.380571",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 9.7 Exercises\n",
    "## Conceptual\n",
    "### 1. This problem involves hyperplanes in two dimensions.\n",
    "#### (a) Sketch the hyperplane 1 + 3X_1 − X_2 = 0. Indicate the set of points for which 1 + 3X_1 − X_2 > 0, as well as the set of points for which 1 + 3X_1 − X_2 < 0."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "ffdafed7",
   "metadata": {
    "papermill": {
     "duration": 0.026505,
     "end_time": "2023-07-17T15:26:18.460213",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.433708",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "9be1d2a0",
   "metadata": {
    "papermill": {
     "duration": 0.025886,
     "end_time": "2023-07-17T15:26:18.512457",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.486571",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (b) On the same plot, sketch the hyperplane −2 + X_1 + 2X_2 = 0. Indicate the set of points for which −2 + X_1 + 2X_2 > 0, as well as the set of points for which −2 + X_1 + 2X_2 < 0."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "191dd8b5",
   "metadata": {
    "papermill": {
     "duration": 0.025848,
     "end_time": "2023-07-17T15:26:18.564689",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.538841",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "acd79ebf",
   "metadata": {
    "papermill": {
     "duration": 0.025569,
     "end_time": "2023-07-17T15:26:18.617759",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.592190",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 2. We have seen that in p = 2 dimensions, a linear decision boundary takes the form β0+β1X1+β2X2 = 0. We now investigate a non-linear decision boundary.\n",
    "#### (a) Sketch the curve (1 + X_1)^2 + (2 − X_2)^2 = 4."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "a30bef5d",
   "metadata": {
    "papermill": {
     "duration": 0.02594,
     "end_time": "2023-07-17T15:26:18.670491",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.644551",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "bb9bbec1",
   "metadata": {
    "papermill": {
     "duration": 0.027137,
     "end_time": "2023-07-17T15:26:18.724990",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.697853",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (b) On your sketch, indicate the set of points for which (1 + X_1)^2 + (2 − X_2)^2 > 4, as well as the set of points for which (1 + X_1)^2 + (2 − X_2)^2 ≤ 4."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "b6474060",
   "metadata": {
    "papermill": {
     "duration": 0.026773,
     "end_time": "2023-07-17T15:26:18.780072",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.753299",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "9d307fc1",
   "metadata": {
    "papermill": {
     "duration": 0.026549,
     "end_time": "2023-07-17T15:26:18.833415",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.806866",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (c) Suppose that a classifier assigns an observation to the blue class if (1 + X_1)^2 + (2 − X_2)^2 > 4, and to the red class otherwise. To what class is the observation (0, 0) classified? (−1, 1)? (2, 2)? (3, 8)?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "0c946ea7",
   "metadata": {
    "papermill": {
     "duration": 0.025559,
     "end_time": "2023-07-17T15:26:18.886526",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.860967",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "attachments": {
    "c62a5b00-0462-4481-9b2a-f05fe08d58e4.png": {
     "image/png": "iVBORw0KGgoAAAANSUhEUgAAAsgAAABrCAYAAABqvHQfAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAFRXSURBVHhe7d0HWFNXGwfwfxJABFkOBFGcdYILqrWIE+veuLV1INq6Z1stzhZrtXUPxFHbiqhoFXFXsYiK6KegIIiyVIYDQZmBJO93A1ESCCMhKNLze560crLOPeM9596cey+POKgkXt/cAddrbbF8TifoydIqAtHdXXD5pwUWzrVHDb4skfkPeo2bO1xxre1yzOlUkVqohojuYpfLP2ixcC7sP1hDr6BlXBHK5vVN7HC9hrbL56BiFQ2LjwzDVDyVaoLMMAzDMAzDMGXF9tcZhmEYhmEYRg6bIDMMwzAMwzCMHDZBZhiGYRiGYRg5bILMMAzDMAzDMHLYBJlhGIZhGIZh5LAJMsMwDMMwDMPIYRNkhmEYhmEYhpHDJsgMwzAMwzAMI4dNkBmGYRiGYRhGDpsgMwzDMAzDMIwcNkFmGIZhGIZhGDlsgswwDMMwDMMwctgEmWEYhmEYhmHklDxBTr8Pb58gZMn+VEfYmeMIei37g2EYhmGY9yQd9719EKTqIC4Kw5njQWBDN/NfVfwEOe0GfvlqOcLNPoGuLKlY4gwkJ8biQUgY4tJlaZyG9RPx60QX+L6SyFLKlyTxOL5z2oI72bIERilRRjISYh4g5EFCmXaAPhoirn0mxHDt8wESyrzBImQkJyLmQQjC4jNkaR9Oha7LIuICow4JstOSEB8VhruRLyCWpVY6rM1oSBpu/PIVloeb4ZNSDeJytBqifuKvmOjii/c0dP+nSGN2ojRmh8Xjw48gjFJUFPFTOvSVPX3pGUdiWVJxcu78SoPbNCATHR5Buw39cDtH9kyeV+dnU3dHd3qgmFwOxBS7pQfpaTWgb/7JlKUxioR07cfeZF3fmLR5IO2OrhQukj1VSQmv/Ui9reuTsba0fXYk19JusOgxnVk7h+b+cpYev32L8Ab93K811TfWJh60qd2yICr3Zl2kil2XJcUFzRPR4zNrac7cX+jsuwpTgbL6rjDS6dSCz6hFnWok4Oq6yoC9lCJ7pjJ5/22mvJSxLZaZmJ4e+orsv/SkuNIM4kq9ovOzu5Oj+4MyxrgPXRYViZBu/NyPWr+N2e2WUZBC4f7Xyqribm8RE2SuY+0fTlaOf6jYsXIoeHl70lYa1JLplHNb6r35IVcc5UgURRu6VeUmLgKynHaWG1L+w0RP6ZpfGBW5myC8Rouaa5X7pEr09Br5hVWEnRVuMrmoOWmpMEEW+s+nplrgBmor+j5QsU0LA78nK+33NEGuIHWpnuLigoYJ/Wl+Uy0Ct+Ni9X2gyvVSXH1XGClHaGwtfqWdIOd5j22mvJSxLZaV+Ol+Gm7lSH+oPzvOk3yKnNv2ps0PyxBYPnBZaJpGxjRhIH1vpV14glzJyqpEFXh7lS+xSDmP1a4xGPbdKNRR6TQ+PmrXrg6e7C9Fxui9+Ctkb1yKQwnl93uNOOZvnI03Q22BGHE+Xrj8X/55TngVOzZdxuuiiltQG6Y1ldeWJgmv7sCmy6/x4X+lE6C2ac0i2qdyOlZDMKF3e9j0GYf+zbVkqXm0apuiRvkXX54KUpfqKS4uaJiOFYZM6I32Nn0wrn9zKNZYyYqr7wqjKlfXRpX9/Or32GbKSxnbYtmk4PxqV8QM+w6jVBvECzPujcVfZWPj0kNQe+j+oGWheRoZ07S4fqxsAKlkZVWiCry9SnqOBLF/rcfROhMwsa2OLE0VRYc0QcOxmNjmMn7deRciWZpmiRF57CKMFv0KxwZaECeexlHf/+4MWRR5Hw8zuB2zD0qEyPsP8cGzoS4je/zg8z/c8v4OdgayNDnvawCvGHVZFu+rpIxg/4MP/nfLG98pq7CSlFDfFcZHPXMsrY99I8vYFstAEvsX1h+tgwkT20KdUVyRAA3HTkSby79i5111R+4PVxaap8ExTWkTr0xlVRoVd3sLT5DFETjocRNWg4egvkCWpin8mugzoCOiPP/EjfI4gY7L+9FLhhg4tB9GDWoELXEiTh/5B6myp/9bMnBj/2HcK589kdLLuIH9h++V0w7Rf0UFqUuGYT4CYkQc9MBNq8EYoqFBnF+zDwZ0jILnnzfwnz/3nY1p/xmFJsiSJ2dw5m5D2He1UHZ4uQAJsp6F4eqZkzgXGIO0En9v4KNGV3u0euqL82Gab16isKP4t8Yg9K9RBR1GDEYTLQmenz2C80VdpybrFR5H3MOtq744eyEIz7j8S9LjcOfSaVwKTVJyhrgQSY8CceHEcVy4E8/9xUmLwJkdq/D99644cj8LyH6de4Z50I0ruHjGFyHvTv+VIP1FLB7cu4Vrl8/iVECs0jPQJRkJuOfrhV0bN2D7gQu4/0qN89QlyQjeMx1TtoUjR5SBlKQkJEkfr1Lz8lwU4TPcu3wSf5+4gBvRr4s5Qz4NkVe8sHfLRmz70xtXIpKV/tQkSQ7GnulTsC08B6KMlLw8cI9XqcXmohBRVjqyRLJvkIghzEiHUCxCVloGsmWZlIiykJ6V16Ykwgy512dDmK0sd1JCPLt3GSf/PoELN6LxuuAGi9PwLDocwYHSuryM+ylFfY4yEmQk3IOv1y5s3LAdBy7chzpVWf51qaF8KlA1LqiQB3EKInw94bZxPTbu8sC5kFdy2yZG2rNohAcH4srFM7h8P6VAu8xA7PVjXLtdj7Xrt8PrZiKy4q/gzI1Xea8rVX2LkRx+EQd3bsRGt0O4GPQEaQXzmp2C+Mj7uBPwLy6cuoao3Iri2tp9f5w54a28rZWB8Nl9XD13Cv/cikFKiWG1NPlXI4aVeZtVbTOliUFZePU4AvduXYXv2QsIygvwiLtzCacvhSIpNz9cHMkQ5m+HOBtZ6Vn5kx8urmQI856Vxpi3/y5ZMW2xvNuH5AnOnLmLhvZdYVHsIC5GSoQvPN02Yv3GXfA4F1J0v+PXQFf7Vnjqex6qD90l9UuuZ8Zex7G9W7B+7Xps97qJxKx4XDlzQ6WrZ2SnxCPy/h0E/HsBp65F5cVHLg7e9z+DE94lxUEul8nhuHhwJzZudMOhi0F4UqhjcEWroTGtaEWXVdm2r/QxNi3yCry4uti47U94X4lAspI6yHr1GBFcHLjqexYXgp5xn87Fhrg7uHT6EkLzOlYpfcB+UgqFuk/qtau4q9MCrT8pbiWIBC/8N+JL+04Yue4fxBEfr/+3D/O+nIfDMTmy1ygnqNsWVjUicP3qi/yC0AgR7h/1g+ngvjDh/tL5dASGNtOG5OU5eJ1PyXtJAVnXt2PujEkY4tATAyZtR+Dt3Zg/fxvOHPsZw9vZwPnEK9kruU+PPoZ5Xdth8C/XkSIgRP01BfY9RmL8zD140WEKbJ5uxKxfzkN07y8smTUVI77oBodBM/HXQ1k0kTzDufVz8PW4/ujWoy+Gr/m3wOW4RIg+Nh/dbIdj68PacBg5GO1xCs6f2WPBybhiO7YC8QN4LJ6J1adikMPj/gw7iIXTpmLqVO7x9QZcVrqzQEgL3IkFi7bjciIfuhlX4GLfBJ2+vYCkApUkeXYBq50W4UicOeyGjYBDvQT8McEODgu98EBug8QPPLB45mqc4toDj8t92MGFmCbNA/f4esNlFa6tKcK9Pd9goK0FdLW0INCtjfaDvsex6GDsnTkEHevpQkugBaNPemDyjv8hm2tVT4/OQQdzXQi0tKFnbotZx58XamuUFoidCxZh++VE8HUzcMXFHk06fYsLchssfnISP8+ZhpG9u6HX4Pk4FFvKFiuKxrH53WA7fCse1nbAyMHtgVPO+Mx+AU7GqdCjy7kuNZbPd9SICyrkIS14NyZ3aIsRex6jZvue6NGmBp4d/w5jvt6DUGnwFD/ByZ/nYNrI3ujWazDmH4rNr/eMO9g8dizW3TdF9wmzsXDmcDSL/x0Teg7At95Rua8rqb4lKTewZVxXDF17E7zmvTDQzpTbAXdB/67jsTUwP8aI7h3IiwG9e+CLYStwNu4m3ObPx7aLTyHRSVfa1tQiisOpVTOwaKcfElEFGXf3wdnOBoNXnMETJZOY0udf9Rim/jar3mZKG4O4AI/tc2dg0hAH9BwwCdsDb2O3NE9njuHn4e1g43wCr0Sh+H3WUHRuZARtLQEEhk3QdYobgmSHSbPvbMagJtUg4GKMYQN7fP1nRN4TJSmmLZZ7+0i9hqt3ddCi9SdFr+dMC8buyR3QdsQePK7ZHj17tEGNZ8fx3ZivsSe3MxUkQN22VqgRcR1XX6iYr+L6JbfTemfzWIxddx+m3Sdg9sKZGN4sHr9P4Mbkb70RVeqv4saJA0swa+oI9O7xBYatOIu4m2654/nFpxLopBcTByUpuLFlHLoOXYubvOboNdAOps/PwqV/V4zfGoi3PUNzY1oxiiyrMmxfaWMs178vrHbCoiNxMLcbhhEO9ZDwxwTYOSyEl2LHwvXtczFj0hA4cPFz0vZA3N49H/O3ncGxn4ejnY0z5KZOxfuQ/aQ0ZCfrvXP7h9ak23op3SryVEIxPT87l9oY1qexno8VrkghTjhDc9vpE6+4M49FD+jnTrrUcKYvZcmSNCLnNi1zmEhe707rzsndFm3wqcaIg/RKllpYOp2cbE7a5g40avY6upkmotidfclYy5j6ucXmXeIuJ4hWd9An/e6bKPrtBotjaUtPPa6svqdrmUSZT+/Rvbi3WySkgG9bkpZWS/o2QChLk0n+g4YY8KjKoP2UJkuSlmnS+VnUsqopDdodLVemInq0qQcZ1hxAu959cSllnSYnCwHp9NpOiUWdxCyKpHWdtUm7WU+auORvuSuWiCh8zWekrWNLq+4pnF5LfnObkkmTfuTqn5/7nNC11Flfl1ovCeBeoSjrtBNZCHSo1/bEvLJUV6Y/zW+mRVotvyX5Ik2/NIuaaBvTiINvZCl5Mi/PISvb78hf4TR/EUWu60za2s2o58Ql9Lfc2d2i8DX0mbYO2a66V+As2hy6t9KGe087WqZ4LR6uCWygbjoFrmIhTqLzs1pSVdNBtFu+zkSPaFMPQ6o5YFd+Gyqt8qhLjedTjbigQh5EkXtoiLkONXE+TUnvti2Lri7rQCZc/Q/9M0mWxtXYvZVko3B1ETHFbHGgemO95PqclJjidg2iz5fclKvzIuo7M4jWda9JDSZ4UYJCHXCf4TmG6tXqTuuD5SMaF39c2nCf8xmNXriMjpeqrZWS0I/mfqJFfAMbWnD+uUK/EscfoQn19aip03HFfKqcf1VjmJSq26zOWKJ6DEo/OZnMtc3JYdRsWnczjUSxO6mvsRYZ93OjWFkWxXH7aHB1Pun22EJPFcqHa2W+s6i13TK6lixLUEHhtvhW+bWPnNs/UGvd1rS0qEGcixV7hpiTThNnOp3fmSjr6jLqYKJNxkP/pPzelE/04GfqpNuQZvqqN3IrKwtxzBZyqDeWvBQbElcfu2jQ50vopqoFwM0DXNpwcfCz0bRw2fFSjGmZFLSuO9VsMIG8FDsGlwdPGlOvFnVfH6wwV9HYmMbNITZ001Fymbdi2o2q26dCjBX6zaWmJk2on6t/fr/OCaW1nfW5ec4ShXE3V/pJmmyuTeYOo2j2upuUJoqlnX2NScu4H7m97Vil9CH6SWkUOoIcGxsPqmEKs6J+mkm9iOUztiLc6hssd6zH7Vfm45s5YPLgZsWfhSgwh1lN4NmTxxpdyyS6cxRXLQfjCyNZApcL6xFDYa1NSP7nCE4l5aUWpgUjw2qgF7ch/nQSbPUFsJx2Eo+fP4a3s2XuIfbs/3nA47YQFu1sUOftBvPr4LOOjSAO9YTHdSF0LaxgVaeK7EkBalQ3Vr7+XtcQhroFnhEFY9NiN0TUGY35ExrIlakADUc4omPaeezxiCj9UWQViWKEaDV5oNwVSwSo16Qh9EWPEBomX0sSvElNxevIy7h4J+ndnp5Ws0Ho24rbo/bxKb91srodMX5ES/AensFJuS/Ra/sprKumwu/UBYU9+MxnWfhs9jx0etce5IhiIGw1GQPlzu4W1GuChvoiPAoNK9Au+TA0NCj16UKi4E1Y7BaBOqPnY0IDud4haIgRjh2Rdn4PPCLKqyZLX5caz6cacaHUeZAk4egPS3EyyRZTF32B6u+2TYTXiYlIk+hCT65P8Q0NYaBQYSLEPIxG0oMghKbJknLxUduuE1rpyudMWX2LEek2D6v8TTFq5sACsZGPOkNnYqSJP1YtcEfUuyLjcXHFgPvqIMSbf4kBpWprqhG0csTUHrVyY9RbfPOhWDq9NaL3zcPy82/PvlAn/yrGsFwqbrNaY4nqMUjLyBDV6AVuiz/FJFt9CCyn4eTj53js7QxLWRb5dUZgumNd5FzzxIGH8u1ejCdBaeiz+lt0MpYlqaBwW3yr/NqHKDYW8VQDpkoHcQmSjv6ApSeTYDt1Eb7I70wQvU5EYpoEunq6SutdYG6GmniGJ4/Va7XKykIU8xDRSQ8QpNgxwa9th06tdIufSyjDM0JescbD/MsBJcZBcaQb5q3yh+momRhYoLz4dYZi5kgT+K9aAPf8jvFeFNluVNw+VeK85E0qUl9H4vLFO/lHobWaYVDfVhCH+cCncMeCYTXCi9tifDrJFvoCS0w7+RjPH3vD+W3HKqUP0U9Ko9BWpKWlA1X1oVfE9qWc3oPD0UAjuy6QL+88PPD5JRWMAFX1qkCc+qYU68xKKxu3jl6FxRcdIXn9Gq9lj/S6fdHXSguUcglHfUpY0sFrCpsObyOgAAYmBvkBOysTQuIKS6C4bTraOgBlITOz8OmsJZdDPlGQF/4OzYF2i7ZoU+CUY371pmhSW4Kw4Lt5a47KAd+iHWzrKlYmX1sb2siCUP6XFeii/wY/XPG9Do+v83YepAE3O4OgVYUHSWoy3pRbHOF2eEYNR2vcx7HD0qUUeZLOXEFai8Z4dfYwzibLEpGE0/8ADgNMCzdwKb4F2tnWza9fKT63vdpcVStusIpECPL6G6E52mjRtk2Bs8f5qN60CWpLwhB8t7xqsrR1qfl8qh4XVMhDyml4nn4GXoPPYGcp/+H66Lv9Lh4/CcPvjtKFVUXRgXXXz2ES9BN6tLLDqDk/YsdhX4Q+F0LQ8jvscmlb/EAsjoCnhz/SdJrBulWBDiqlYw3r5gKk+h3A4UcFOgC3I92mfXm0NY5AoCTf3E715x1RnxeLv/86n5ekZv5ViWEKSrnN6o0l6sYgHpradMC7CG9gAgOF79RHD6dxaCEOxB/7buUPuNm38VdwY4yz15MlaFg5tA9xWhrSURX6SgfxFJz2PI1nvAb4zM5S4Xv1+27H3cdPEPa7Y+4yxUIEVaFXRYzUN4qT2bLQse6Kz02C8FOPVrAbNQc/7jgM39DnEApa4rtdLmir8gw5D79OG7QvMQ6KEeHpAf80HTSzbqXkah9c3LBuDkGqHw4cfiRLqxhKt32qxXnd/hvgd8UX1z2+frfjKMnOAGlVAU+SiuQiBndeUxvkT50MYKLYsTSjPONoMQr1ILFYOhPkF34ilwiR9+7jjYSHmmZmqu/d5eJzcZ37dBJzn6Yh2Tfh5ZuEpwem48svv8x/THJFkMCUK9TX8D16EsUuneJXR61ayitWx3Yw+jfi4UloqNyC9Uw8iowDmX+BAZ1UvYenouzIh4jhCoMfdwG/uLjARf7x43kIHMZidJcGapZ3yXi6eqiqdO+NIKECk3+DJujYQgz/bUvgNHYUJjjNgcv6vxD4nCsY7qWFdxU0R6vFSAy34ePh3555V0GRPIPPv1Xx9aZxaPPmPA6fyvuZQPLMB5e1e6NPUXMmni70lG8wSEJl2IZsRD6M4do1H3EXflGsR+7x43kBHMaORpcG5VWTpa1LTedTnbhQ+jyIIsNyL3HHq2UGs4JdVGAEM3PjEr+z+pBNOPyLI+q/CcSRzS74ZlQPWNe1RKev9+JOSYsHhSEIiRCBV7Ua9JWGCG1Uq1YVPFEEQrgdXQXl1taKJjA1RXWeBCnhoXkJZcm/Okq1zWUYS9SKQdyEoFYtxQG2AJ32EzHxMy2Ee+zGP7I5YLqvJ552GAer8uqy5dA+SCzm3seN4coGcVEkwh5ykx5eLZgV7kwwMjOHcVHbyhcgb+jW2Mgt7ZjYdPgXONZ/g8Ajm+HyzSj0sK4Ly05fY2+JHbNopYuDQoSEREDEq4pqyjsGtKtV4z5HhIgQWV+qIMonzhugSccWEPtvwxKnsRg1wQlzXNbjr0DpOTxFdixu6lQLRUydNOcDxFGpQl1Iryo32cvKQlaRk0nlmSw9CbeHw81udPWhr3wWrjJhwFHc+fQ3nPI+gRMnCjwOzEYHbtfpzeWjOCk9i7lIRQQUKf3u+OGHYTAJ3IzF+28hITkBN/fNwcp/G2Phnl8wqLiDV6XA19GBNo8HnRbDsWz1aqxWeKzFlt374Tajo5I9XBWlxeBRfFmOXkoQf2oR7K26YmlgA0zfehB/7t6Ctctnolvxp0srSIt5BLWyIfgEIx07Qiv6BA75Z0GSeBJX9fvgC9tRcLTNxMXDJ/BMIkGi9xXo9e0FZasryhcfOjra4PF00GL4sgL1yD3WbsHu/W6Y0bHMNVnGuiyPfKoaF1TIg5YgL1CJRFywVxPfBJ/PP4x7TyJx49Qf2Lh8Boa100aQmzMGzvCCdG5VtLxtoyK/XwKxKHcIqRjeDhiCt6NWRc2/OmOJ+jGoxCPigiYYN/kLGMQfwx7pib2SF/A+kYleIxvktb+PBF+vKnTBjeFKB3Gt3EmudAeFaw6qkQiRN3TryxI0gQ+Tz+fj8L0niLxxCn9sXI4Zw9pBO8gNzgNnwKv4jllmuS2Qii4LCbczwHWnEqk9ppUr1eK8JP4UFtlboevSQDSYvhUH/9yNLWuXY2a3Eq5oVuQB1Y9foe2qY2EKXspLvFTaKLTQ2Lo5DPiEl4mJ6g1WkmQkJYthYm4OzfxoJcTVo3fR2tGeCwqFCRoPx7AOVbgW7AevEwlceFWDJA7HrzfEHw+O40v6B9t/24MALUf8+T8/rOmt7Gf8vJ8HlYb/3MuOKRaudpv2sNImpMc/KXKgFovLvnZBFP47NnglyP5SnSTRA7Mm/Ybb9RfAc68zbN+tX+MGZLlNSg/xQ0BiUSUtQvjvG+Cl1i2ZBGg43BGddB7jhOdFPDxxA8b9u0OfG9ik66myLx/B8bjHOB5ghAE9qsne8z5po017K2hTOuKfFL5yRh4xV5eyf5ZB2epS0/lUJy6UPg9ajVqjpSGfC+CxeKxW0MmG31InbH4kBr+aJT7tNwFzVmyF1/U7OLOoLVK8PXCuuIulV7FC62ZaQFYykpXdd0iSysW0LC6jzdHaSluW+OGIEuK5OCJALeu2eQlq5V+1GKY69cYSzcSgovBhNnwKhpq9xtm9HoiKPoKL+sMwsIbs6Y+EVh0LmPJS8FLZIK7VCK1bGoIviUesip1JkpyEZLEJzM01t9wk228pnDY/gphfDZaf9sOEOSuw1es67pxZhLYp3vAotmOWVRVYtZauc89CsvKOgdSkZO5ZLTRvbSVLU6YsY1p5UiHOSxLhMWsSfrtdHws898LZtvq7eQ0pdiz4BSQW8VmVT6G5XaPGluBzA1FsEX3HuM9EDLckRAX440mhAVSMtPQMaaiS/a2E6DEec+O6ZePGXPVpQLovvELaYGintyfIFSBogGHDPuMmz+nwP3ocT9WpWVEUwoLj8BKN0HPyd9ze1w+YNaEfWhf5uwIf+tKfLLlmJC7wfaKIewjPkJZPfikJGozG5H41IL5zAeeUdDLJkz2Ytvgc11FVwNPLO3FJlM1ND/KI09JBeurv/Wf5+eDiSwGa9h4AhaWMXLBNfPF2ayRI8TsEn+i8BsTT00NeNt7lgmsjBD01fz7gWw7HSPuqSPDeiMX+NTGws3S3SIAGjiPRma7g0DY33Kw5EF3Kaclg8bh8jJ6MfjXEuHPhnJLbskrwZM80LD6n4popjdel5vOpelxQIQ9GfTB5RAMgwRdnAgvnSRy1HV/NP11M/yAIk/xw/ORjLidy+LVg7zwKbfnZyCmUZzmCTzBmYk8Yie7i2lUlA3aqP64Gczv9X0zC6Cbl/VujnGyhkvMSsnHP9wriBS0wYUrPvCS18q9aDFOHOmOJOjFIJQa94TTmE2T778XSFTdgObqbhg7kvD9ajRrDks9NgJUO4kboM3kEGiABvmcCC/cZcRS2fzUfp5V0JtHjx9y7LNG4seZ2AkmYBL/jJ/FYsWOilr0zRrXlI7vYjllWAnwyZiJ6Golw99pVJTcUS4X/1WCITb7ApNFNZGmaH9PKjwoxNssPPhdfQtC0NwYodizEJ7541wslKX445BOt3sHRj1ChGq3VsSOapEQgLL6IhmnUG6s3T0WjO9ux6rjiEVlh2F784hnDBdQ3ePWqiCJMDUNYnBlsP2vIVV8ZiZ/D98flOPg4HRkZsrRCBKjXrQuaaREyrh7EwQcF88WlZ2Rye0kZSE8v1ILyaLXEpxbnMfOLUZixcBEWLf4W37ssx+o1G7H/3D08f9tP5Ji0a49PeC/w9EmmLIUjSYDPkRBo1RSAUl7h5duv49fB+N82YVSNf7F2yVHFwUIYBc81fmj5lYPSI+RF0moBm9bVIOEGs7u5WRDjaXAaTK3lFh5w28xtOigzHQXPMxRxBSo9MTE7Kz9SatWtBzOBGAkPHsitxZbg1eVTeGxUD/z0N3gjkuBFkgTG1fNqV6uFDVpXkyDi3l3kZeMpgtNMIZ8NlfDNMWREN+g/v4yHFoPRUbZfxLcYipFdBfDfdBK1Bn8O5btLeXXNbTDSC28wMvI2uMCgIX0PN1ATNxkp8JMlcekZ3N51Jvf//Kocj982jUKNf9diydEnChMyYZQn1vi1xFcOKq5ZL4e61Hg+1YgLpc+DAXqu2opvmsdh35K1CJC/rLn4Cf7+5TKajOn5rn+8rRehMEsuH5nw37waPgVORHhzLxSvOvVD93dFqay+uYHGaQt+HSTA8R/X4qr80kjJK/z7kyt8qg7ltmXSu5Nb8j5H1bamCh5MuMFq33nFk4+zQt3wg3scOizdhaXvzo1QJ/8qxrBcKm6zGm1GnRgkbQ+ZXHvISE9X+A7ldNBx0pew5YfA52k7jFf3LDEZ5W1RqvzaB79WR3RskoKIsHiFPvWWQc9V2PpNc8TtW4K1ip0JT/7+BZebjEFPJV0/NSwMcWa2+KyheiN3UWWR6b8ZqwueRP/mHkJfdUK//I5ZOirGQUEDJ2z5dRAEx3/EWsWOgVf//gRXn6oYyo3Nk+Q6hsbGNGleuR1NyuT+X6BhFtluyivOa9VFPTMBxAkP8EDuziCSV5dx6rER6vHT8eaNCJIXSZAYV8+bu+Xmhct/RjqKmjqV1ofoJ6WSd7U3OVkXaLqlCQ0/UNxFH0UUd+EnGmnXmUYu2UYHD/9O65fMJKd5W+jPxTakDR5Vqd2COvVZLnt9vkyfKWRhNo6OKl62VkVCCvh5INk0qkWGBoZkUE2PjCza0Hj3hwrX0qS007S0b1dq37AGGRoacg8DMrawos49+tC8IwmUftaF+nXvQE1qGpCBgRGZN+9E3XsNozX+ha7mSzFHplAzI1Nq1Kw5NW/WlD5p3IDqGOuSgMcj7Ro25Oz5SPFafOKXdGlFL2rabiSt3neUjv21hVbMmkO/XfKhuU21iMc3IMv2XWmSe9i7POfEnqZVwztQ+15OtGyzO+36bSlNHT2JXC+qd71F4f3dNK6VOVmNWklb1s+jSQuPUGzulwnpxvqR5NC5BZkZcNtuWIuaduxB/ZZdoPQ4T5rdpzu1r2+SW2a55dVrCu0Ok74xmQI2jydbC0uy+/pX+uvIQdqxej7N3+hLiZF/0OiGxtS4myONdzlO8e8yLKT7u8dRK3MrGrVyC62fN4kWHolVrCcViZ//SUNN29APCtf5FNPzP4ZSLevvKVDJRRGFN9bTSIfO1MJMWteGVKtpR+rRbxldSI8jz9l9qHv7+mQibSPGFmTVuRdN2R1GGTc30Jhe9tSqDtfGuHIybdaJes32pLjMm7RhTC+yb1WHa38GZFi7GX3ecyi5XnnbbnIo9vQqGt6hPfVyWkab3XfRb0un0uhJrnSxyAsZF0/zdSml6XyqExdKnwdx4mVaN/ZTatJmEM1x3Ua7tv5I8ydNoWUnYvL6nlCxXgxMm1GnXrPJMy6Dzk9vTu0mLaW5XzrTil2Hydv7CO1xnUHDHRfRMdmFQIVF1ffbbAijyHvZULLrPJicvl9H27a50lzHLmTvuIJ8ovNjhjptTaX+IPSj+R0H067IGPL5aRbN+3EnHTp2iNxXO1Nvu940+/cgUhpeS5n/d1SIYRlqb7OqbUaFGJR6llz6dacOTWrm1qeReXPq1L0XDVvjX+hayQrET8mtfwMa9scz9a9zW2RbFJd/++DGqwvTLclk+AGutIogTqTL68bSp03a0KA5rrRt11b6cf4kmrLsBMUovahsJvlMsSCzcUeVt63iFFMWWeenU/N2k2jp3C/JecUuOuztTUf2uNKM4Y606Jj8PQFKUpY4KKQo72U0lGuDg52+p3XbtpHrXEfqYu9IK3yilbSVso5pQrq5YQz1sm9Fdbg5iYFhbWr2eU8a6nqlmLLKLPc4nxywmcbbWpCl3df0619H6OCO1TR//kbyTYykP0Y3JOPG3chxvAsdj0+lsy79qHuHJlRTmhcjc2reqTv1GraGCk2dSvJB+0nJeNL/yObKMlnwnWWNcclrEfbXsBJPdBImRSA47BX0G1mjVR19pMf8D8EvtFG9Zk2YSs+m1pffA8/CpZlWmCzcglD3vtDkUv/yI8SdX/tj5InPsNtrJbqayu89i5EWex0eK7/BguOW2BDsDad6igflxSkxuHc/Bik8UzRv1xJmOil4dCsMKXo1UKuWKWrXNIZuwR3y7CQ8Cr6PZ9qWsGpdH0aFjvOrQPIa0bfuIBb1YWPbEAZl+ay3xCmICQlD7GsBzFu0QdNasuO12cmIT+LD1NwIBY+7SF5H49adWKC+DWwbGhT+6UIl2Uh4FAe9Rg0VyyY7EY/iqqJRQ6Myfr7mZCc9QvD9Z9C2tELr+mXMV3nUpYxG88lRLS7kKXUeuHYWeTcECbw6aNmmMaqX4iBf2pPHEFpYogY/HXHBtxGexEP1hlawbljyFTAKy0bSo2BEvK6B5taNYCL/i+QHIEyKREj4C1Rt3BrNzfRKUXeq5V+tGKYGldqMGjGo1CRP4D59I+r+9iv6fohTGTQgy3cWrMclY23YXxhW7CCejeTIuwhJ4KFOyzZoXFRnyrqEmVaTIdwSCve+Ghy5057gsdACljX4SI8Lxu3wJPCqN4SVdcOir6ZRjnJjUMRr1GhujUYldAzNjmnvR8kxVoyUmBCExb6GwLwF2jStJfs1lmsn8Ungm5rD6APUy4eiZIIMiELXonvfm5h28zDG19Zgtb/2xuT2K2HheR2rP/3Ao0ppZXljYgMniLZH469hRQSGNC+MbeAM2vkUBx0/thVrDMMw/2HiDGSI9KAnm2OLgn/ClGMOcF+pgSsHfSiiUKzt3hc3p93E4fG1yzx5e+09Ge1XWsDz+mp8LEM3w5SV0n6j1WomfhoRhe1u97j9Bk0RI2LvRgT2WIX5H1MP49eCafVsxD9JVFi/I0+c+BjxorpoWJ9FDoZhmI+G+D7W9zCHSZMpOJF7llYyzu2Pxmdf2X68k2MprVaY+dMIRG13w72yDuLiCOzdGIgeq+azyTHzn1LEjqU+Oi91he3ZpXB7UNS0UDXimP1YcqgBVq7sq/wuPRWVTkd877YI2jtHwWn7FcQprAbPQtyVbZg8ehd0v92ORZ/+h357YBiG+ejpQFsgQI1PmsJcR4wnx3/C8bozMKmRBtaMfGD6nZfC1fYslro9KPLgTsnEiNm/BIcarMTKvh/VyM0wZaZ0icVbWXc3YdySV5h3YCU6q3qGpryMO1g/fjkyF3vA5bOPc1GX5HU4zh44gDPBSaAq2tDidi3E2VmgGm3Qb9w49Glecda9MgzDMKUjivHBum2X8YZH0G4+GvMmfgqTyhLMs+5i07gleDXvAFaqMYhn3FmP8cszsdjDBR/p0M0wait2giz1+uYOuF5ri+VzOql9Pci7u77HPy0WYq59DTaJZBiGYZj35fVN7HC9hrbL56CTKoO46C52ufyDFgvnwr4GG7mZ/54SJ8gMwzAMwzAM81/CdgsZhmEYhmEYRg47gswwDMMwDFNAaogn1m89jzhhJl6+yEC1lgPwzYLJ+Lz2x38SJ1MyNkFmGIZhGIaRIwrdiim/SDBr00zYGvMhSQ7E+lEDsSJ2EA76uWGwJu8RwVRIrIYZhmEYhmHeycZVdzcEpEgg0cmbJvFNOmC+qxMaR/+Bn/dG5KYxlRubIP/HSVLCccnTDZu27Mc/j9JkqYz6xMhITkTsgxCExaXL0piPiigDyYkxeBAShvgMWRrDfEwkKQi/5Am3TVuw/59HYJFdVXzoV6+G1PBwJAhlSRytxg1Rjy9GwtM4WQrzoYgzkpEY+wAhYXEor5GWTZD/syR4du4H9OrshBOSdrB6vQcjPx2AX0NFsudLTxy5H84O9rBtZom6deuhroU5apvVh1VPF1x8F5lFuLWuL5qa1YSpuQX3urpo1NIWPaYfQIxm7kXz4YmC8NsQG7RqXB8Nm7fHmJ0R3FaXhRiR+53hYG+LZpZ1UbdeXViY14ZZfSv0dLmYP+iJbmFd36Ywq2kKcwvudXUboaVtD0w/ECN7wfshfnIWv8ydh3XnnpThxgTFK+/vyA5ci/42LdHIshGatx8Ht4fyNSjGk7O/YO68dTj3pLI02uK9jzplNEvy7Bx+6NUZTickaGf1GntGfooBv4aqHovEkdjv7AB722aw5OJ1vboWMK9thvpWPeGSH9i58LMOfZuaoaapOSy419Vt1BK2PabjwIcK7BrJtxZsl11H/IOdGCx3f5TU6wEIkVRHh87WshTNY+NpSUQI+m0IbFo1Rv2GzdF+zE5ElG2gLZp0DfJHTfSUrvmFUabsT6Z0xM8P01jzqmSzPIhyuNLzmWxOfIEFOZ/Nkr1CdeKEA+RoyifwqlKPTTEkkqXnE9K/s5uQYdNh9NPJcEoRy5IrmZzg5dReW5va/HCbK1tNEFPCAUcy5YN4VXvQppjCJUvCf2l2E0NqOuwnOhmewr3jfROS//ympMWFFG2r7ymw0IaL6Ok1PworU0ct6Ts0RUiB31uRtnY7WhYk9yVCf5rfVIsAbbL6PlBDdVuRva/yVoLFdfWIn9PhseZU1WY5SZtups9kMucLyML5LKkd2cUJdMDRlPjgUdUem0h5+JlNTQyb0rCfTlJ4RQnsms53VhC52hmTxUA3Cn8PfYGNpyXICabl7bVJu80PdLuc6uPjP4IsvIodmy7jtUT2N1MqWZeP4vTLxviifytuX1kX/bfcQkjITWzqXUX2CtXxzYZh1pjG0CIhbl/yxYsCdZIVuhs7oobB68oRLBnQDEaV9PcLfu3aqM6T/aERfJgNm4UxjbVAwtu45PsCikWbhdDdOxA1zAtXjizBgGYf4q6OOrAaMgG929ugz7j+aF7orutCXN2xCZfL1FFL+g5N0UJt0xooVIU6VhgyoTfa2/TBuP7NuVdVdu+rvJVgcV09WZdx9PRLNP6iP1px9aXbfwtuhYTg5qbeUDuy880wbNYYNOb2DYW3L8G3cGDH7h1RGOZ1BUeWDECzihLYNZlv8RMcmzUJB8xd4ePhjGbvoS+w8bQE/NqordmBtpCPvkhFkffxMINdiEM1Erx+/hIZMITx2wamVwctmptzU+Wy0IWd80TYVCG8PueO/RH5v/WIojww8/twjHFbg16mlb8na7zb6trBeaINqtBrnHPfj/yiFSHKYya+Dx8DtzW98CGL1sj+B/j87xa8v7ODgSztHVEk7j/MQFl7arHfoVHKatAI9j/44H+3vPGdXfl+e0Xx/spbEYvr6pG8fo6XGYChcXVZC9ZDnRbNYV62wM6FH2dMtKkCen0O7vsj8pfbiKLgMfN7hI9xw5pephVuQqGRfIsf49jsydhvsQ7/eH6Ntu/tlttsPC1R+c6PK1x7VlEGbuw/jHvltf6kMsu9uh9P4+1L0HwipvYyAi8rEPt2B0B6foMk4SQWzr2Ibht+w6A6/+HOXCYCNJ84Fb2MeMgK3IfdAbkli4STCzH3Yjds+G0QKnLRZtzYj8OsozKlwuK6+ih3J5Sn+cCOiVN7wYiXhcB9u5EXfhJwcuFcXOy2Ab8NqlMxJxNlzbcoBl4Lv4Vfl504vLwnzATc2+PdsWDVTdkLyhcbTz8swQqO7N8fF0kygvfOxISVl5Bk0R2T+jfjGlEmMrPEEFStUuDnTwkyEkLgf+4ETpy7gcg0fdRtUAtV37atrFd4HPUID8Pv4+6D1zBoaAa9jDgE+fsjLKM6LE31wM9OQXxMFB5F3EdIcDx49evBREuIZ/cDcOXqHcSk6sHMwgg6so+UvI5CgO9l3HrwHGIjc5hWU/abTAZir5/EseOncP5KEBK166ER7w4u3DdA47pV1Zi8ipEc7ovjXt64+L9YpGsZwbQWlyf5PiRKR3LKG7wIPAS3S9no9OUQWOlkISuHDx1drbIHOR6X92oR+OPIbcRG5aDtMBMcnLUPlqvd4dTibem8J2mRuOJ9HN7nryHiuRBVTeuhRtUCpVpcvV4LQsxrHdQ0N4FuMQUjyXqG8BtXEBCWjCpm5jDK+R/+2nAW6XZT4dzDXGMDB8+gMapF/IEjt2MRldMWw0wOYtY+S6x2d8L7LtqCxGnPuPqOxMOwUNyNzkIty1rQzS1qCZKD92LmhJW4lGSB7pP6oxk3WGVmZkEsqIoqKvxUWfR35MmIvY6Tx47j1PkrCErURr1GPNy5cB8GjeuiYLUXj/A64A9suSBEZ+ep6G4mrUEx0p5x5R75EGGhdxGdVQuWtXTz+mgZ25AkIwEh/udw4sQ53IhMg37dBqj1LjjJKU17Lk0sk720JEWWtwb6TJHed1xHNlLiYxD1KAL3Q4IRz6uPeiZaED67j4ArV3EnJhV6ZhYwyg/siArwxeVbD/BcbARz02pKltpoOq5zdZEcDt/jXvC++D/EpmvByLQWlyf5AhYhPTkFb14E4pDbJWR3+hJDrHSQlZUDvo4utNSpCwU8rh9VQ8QfR3A7Ngo5bYfB5OAs7LNcDXenFu/GvYqnDPkWRePQtNHYmNkZXYye4nZgIAJvXMOlAwfxsM1MOLatKnthOapI42kx0iKvwPu4N85fi8BzYVWY1qtRKOZmp8QjhuuPEfdDEBzPQ/16JtASPsP9gCu4FhSD1zo1YW6iW3R8kmThWfgNXAkIQ3IVM5gb5eB/f23A2XQ7THXuAfMyt3ElZGuRPy6icDqwYCwNH2pPjarySGBmQwOGDqWh0sfIlXQ2RfY6qZwoOjrPnlp0ciY3v0iKi7xOf82xo086zSfvp3nL3jMvraahDjZkoct9lsVU8r7pTnOcv6efZtiTsXZ9mnw8iXJubaWv+n5OjQ35BJ1etC0ykHbO+4ZcNh8kn9Me5NLLgszsXejicyFFH1tB3yxcQ3v/PkMntk4k6xqNaYR7mOJJPem3adOYwTRj9xWKShaSKDOR7h5fQ47NDcl6yU2VTwASJwfQ5rF21HXiGjroG0KP7l0ijzVfURe7cbTlRrLsVVxxBO0gp+FDqX/72iTgG1OLnnnl5jj/IEUpOYlBLcIA+ralNvF4emRhNYRcr8tXyPsgpsTzq2jKdK4s/MPp6dNw8t3pRB1adKcFR8IVTvwpTb3W/HQxnX9Z+AwI8fMrtGFCZ+owcAFtPnSKfA5tp2VO42j25sXUTUeTJ+nlEwZ8Sy21ecTTsyCrIa703otWKRFFe8ylgV2akjGfR9rtluWeICRNDz+wgMZy7c2+UVXiCczIZoCsnw4dSSsVOmpJivoOqXS6vWkMDZ6xm65EJZNQlEmJd4/TGsfmZGi9hG6qXAliit3QjXTkT9ITRZPH3IHUpakx8Xna1G6Z9OTWPOq3oRyKOjqP7Ft0Imc3P4qMi6Trf80hu0860Xzvp3In5ZS+PZcmlpVO0eVdlj5TrA8Q17mNoa1f9aXPGxsSHzrUa1skBe6cR9+4bKaDPqfJw6UXWZjZk8vF5ySMPkYrvllIa/b+TWdObKWJ1jWo8Qh3CpNvXxqO61xgp4DNY8mu60Rac9CXQh7do0sea+irLnY0bssNehfZc4Joh9NwGtq/PdUW8Mm4Rc+8cnOcTwc1F9gp4NuWpM3jkZ6FFQ1xvU4VIvyUSJ18C+naEmviJnnSA/KKD63mtPCaUPa69+CDj6fFECfS+VVTaPqag+Qf/pSehvvSTqcO1KL7AjoSrjDS0q2tX1HfzxuTIR+k02sbRQbupHnfuNDmgz502sOFelnUpE8Xn6dCYUP8nK5smECdOwykBZsP0SmfQ7R9mRONm72ZFnfTKdeT9D7uq1hknSYnCwFX2NspUVksFifR+VktqarpINodLRckRI9oUw9DqjlgF+Unp9PJyeakbe5Ao2avo5tpIord2ZeMtYypn1us7KoAOXTbpQ1pa39Goxcuo+Nx+V8qCl9Dn2lrk/WYmbRg0x3u095KpaPja5FWrXHk9UaWxH1azBYHqjfWi9JkKXnEFLdrEH2uaiDNDKJ13WtSgwlelKBQDtzneY6herW60/pg+XOYxRS/pQc3AbCmpbfKo2WJ6OH6LqTHBSRtmxV0t5wab5GEfjS3qQk16edK/u8KOIdC13Ymfd3WtCSgYHArqV51yHbVPYU6ET8/S3PbGFL9sZ70WH78ESfQmbntSJ+bRJXHBJlED2l9Fz0uWGqTzYq7mv/8ssi5RytttAtMXqWy6LSTBQm4ydR2pR1VBUq+QxyzhRzqjSUvxc5E4rhdNOhzDU2QZXLurSQbrp/LT5DzqNqGxJR0fha1rGpKg3ZHy02GRfRoUw8yrDmAdr0NTiq359LEslIqsk5V7zOl9t7jOrc1t12oDVevn41eSMuOx+WXETdpX/MZt/3WY2jmgk10Jz+wU+rR8VRLqxaNexfYNRzXuV2foHXdqWaDCeSlGNi5tu1JY+rVou7rgxWuTiGO30I9uJ1z66W31Cv7EogerqcuetwOurYNrXjvgV19H2u+83zg8bQYQr+51NSkCfVz9c9v8zmhtLazPum2XkKFh9rb5NKG60+fjaaFy45TftgQUfiaz0hbx5ZW3ZPbQG5yfHZuGzKsP5Y8FQdaSjgzl9rpc2XCrmKhHlHwJix2i0Cd0fMxoYHcvdMFDTHCsSPSzu+Bx7uF71owMqwGenEb4k8nwVZfAMtpJ/H4+WN4O1vKDvvzuNcYcB8chHjzLzFAbv2PoF4TNNQX4b5fJrpPaQs9Wbp0oX3jRnXBSwlHaOzbRXUixDyMRtKDIITmX5aRw0dtu05opavC784QI9JtHlb5m2LUzIHI/TX4HT7qDJ2JkSb+WLXAHVH5a/zLl+gJboWlQV8XyAn2wL7r0pVTpSB6gSCPRRj4pVvZ8ip5g9TU14i8fBF3kt6e+quFZoP6opU4DD4+97gakFdyvT4KDUO2LA1IxcXlM7A13ArfLHdEPfnb8vPN4DB5cLmd5Sx6cgthafpcq8pBsMc+lFy0qQjxXI7pk50wacwQDBg8Hovdr+FZebQFviEMDdT5AVkFSr5DFPMQ0UkPEKTYmcCvbYdOrXSV/ASuPr6hIZRvooptSBSMTYvdEFFnNOZPaID8JiRAwxGO6Jh2Hns8ZCcVqdyeSxPLSqnIOlW1z2iO5uM6tzVGXL1ypRgUb44vB8itSxXUQ5OG+hDd90Nm9ylomx/Yodu4EeryUhAeGisrf03GdS6yR7ph3ip/mI6aiYGKgR38OkMxc6QJ/FctgPv7C+x4cisMaXmBHR77rueuiS2ZCC+CPLBo4Jdwe295laduvisINcbT1BBPLJ8+GU6TxmDIgMEYv9gd18oh6EvepCL1dSQuX7yD/NDUDIP6toI4zAc+BU8k4Blx8YTbpKB4mH85QO68GQHqNWkIfdEjhIbJjbQXl2PG1nBYfbMcjooDLcwcJmNwOV9ORLHXVSpcsPP6G6E52mjRtk2BtUZ8VG/aBLUlYQi+W6Cx8ZrCpoOx7A8BDEwM5AYvGX4dtGlfVzGdrw1tbR4ELW3xqcLSJB6XzlUiZSHz3V25dGDd9XOYBP2EHq3sMGrOj9hx2Behz4Xc+7/DLpe2pR/UxRHw9PBHmk4zWLdSsiZJxxrWzQVI9TuAw4/eQ3CSJOL04tk4Z78HbqPrQMA1eE/3U0iRPa2UKAx/LnLC1Lnr4b7PAxdCE5Au/TFLXbr9scHvCnyve+BrS1kTl2Qjg7RQhSdBavKb/LOZ5RVZr0CWMEuWwEk5jT2Ho4FGdugiP0DL8Pj8culYksTTWDz7HOz3uGF0HQFEjzzhfqq4khUhdOtMrHs+ED/v3o19B4/hz6WtEfSDA7pMP4FnBS4b9LHSse6Kz02C8FOPVrAbNQc/7jgM39DnEApa4rtdLmhbvjFUUSnbkCjIC3+H5kC7RVu0KdBt+dWbokltCcKC7+YN5Oq259LEsrIqbZ/RmHKM69z767Rpj7qKG8NtizZ4XFuyVQzs4HHpWiBkvQvsGozrXI1GeHrAP00HzaxbKVkry32XdXMIUv1w4PAjWVp5kiDx9GLMPmePPW6jUUfA7QB5uqPY8MPVVdifi+A0dS7Wu++Dx4VQJJQpsKtDnXxXIGqMp6LQrZi57jkG/rwbu/cdxLE/l6J10A9w6DIdJzQc9HX7b4DfFV9c9/ga+aEpA6RVBTxJKpLfKJ9z8Ou0QXvFjsaFDS5uIAv5YSMFp/ccRjQawa6L/EEEGR43zpbzDLacP/5Dykbkwxiui/IRd+EXuLi4KDx+PC+Aw9jR3ASnQMjiV0etWoVDpwKeLvQKrkCX4VXVg77SUpUuZ8lvnNWHbMLhXxxR/00gjmx2wTejesC6riU6fb0Xd17LXlQawhCERIi4760GfaXZ1ka1alXBE0UghBuQy5UkGX4rp2Fv3ZXY+lVb9J82Hs20CYneu3H4STEdU6sFJqzbDfetqzGhnRG3S1F2Bk06ooXYH9uWOGHsqAlwmuOC9X8F4jmXjbzzvJUopl5Jkv8uUeQ93H8jAa+mGcze0+RLkuyHldP2ou7KrfiqbX9MG98M2pQI792HUWTRZl+Fu1sAUiQS2YmafJh0mA9Xp8aI/uNn7JW7bNBHrfoQbDr8Cxzrv0Hgkc1w+WYUeljXhWWnr7FXpc6kAaVsQ9mRDxEj4mok7gJ+KRCbXH48D4HDWIzmBoW3zUut9lyaWFZWpdxezSnHuM5FHl29Ik6i41WFnvLALl2myE3D8mgsrnO7RiEhERBx31tNeWCHdrVqqMoTISIkVJZSXiRI9luJaXvrYuXWr9C2/zSMb6YNSvTG7sNP3m17YVpoMWEddrtvxeoJ7WCkicCuEnXzXUGoNZ5m46q7GwJSJJDITuLkm3TAfFcnNI7+Az/vjchN0xwDNOnYAmL/bVjiNBajJjhhjst6/BX4nCtfrvcXEQB4unpFnDjN9aXcK2xxRJG4d/8NJLyaMHtfA20BlW+CnBaDR/HSowd86Ohwe/48HbQYvgyrV69WfKzdgt373TCjY8F98/LfK8nFN8Hn8w/j3pNI3Dj1BzYun4Fh7bQR5OaMgTO8cge+0slrZSQScYOGMhKIRblNtZyl486mafgNC+A+tx30uRQdWydM7lQVeHMR7r/fLyJ/5UASj1OL7GHVdSkCG0zH1oN/YveWtVg+sxssNFS37zXWp9/Bpmm/AQvcMbddbsnC1mky8orWHb/fL6Jk+fqoXi0V4eEJcj8paqFxw3rgixPwNO691YgSaYh5FK+hnzq5if/n83H43hNE3jiFPzYux4xh7aAd5AbngTPgVfrO9N7wdXSgzeNBp8VwLCsYm1avxZbd++E2o2PekUO12/N7imXvw38urstiDHFxvYhuKhGLuMmE7I9ylH5nE/LCz1zkhR9bOE3uhKp4g4vuv6Oo8POhlT3fH3JpiLrjKR/61ashNTwcCXLBVatxQ9Tji5HwNE6WohmS+FNYZG+FrksD0WD6Vhz8cze2rF2Omd0suJxowHvfqVJUWcLnO6Lw37HBK4H7lzbatLeCNqUj/ol0b0YZMcQf5CBaNvyWOmHzIzH41Szxab8JmLNiK7yu38GZRW2R4u2Bc6myl5akihVaS9fhZCUjOV2WJk+SiqTkLK6HNEdrK21ZoqZl48HeGViZOAW7lneBydtWJWiECU69YcLLRtD+XfAvj19cC5Eg0WMWJv12G/UXeGKvsy2qv82P9KRU2T+lASjELwCJasydtBpbo7kBH/QyEYnlPThkP8DeGSuROGUXlncxeddhBY0mwKm3CXjZQdi/yx9Ki1bLFsuux+PBzsEwkSVJ1yRfDwiBpHoHdLYur/ZQCqJw/L7BCwkamLtm+y2F0+ZHEPOrwfLTfpgwZwW2el3HnTOL0DbFGx6l7kzvj3ab9rDSJqTHPyly0iTODU7l354/Bv+5uI4qsGrdjNudzUKy8sCO1KRk7lktNG9tJUvTvOwHezFjZSKm7FqOLvmBHY0mOKG3CQ/ZQfux6/0EdpWULd8femlIWcZTLdguu474BzsxOD/oI/V6AEIk1dGhs7UsRQMkifCYNQm/3a6PBZ574Wxb/d34JP1V5Z30EPgFJBbRV4uh1RjWzQ3Ap5dILPeBVrm32/Nx4ulBT3phTlE216TyiNPSQXrS/S0BGoyejH41xLhz4ZySgViCJ3umYfG5D9G5CcIkPxw/+Vhx7SC/FuydR6EtPxs5pQ3wgk8wZmJPGInu4tpVJdE31R9Xg8Uw+WISRjcpj59bsxD2+zQsuDUI21x7F7iTGx+mw6ZhRD0BRNGe2Hk8SZZenrLg53MRLwVN0XuA4to9SXwiXrztt5IU+B3yQbQ6/c64DyYOtwRFBcD/SeGKkrZB6U3AyhxSs8Lw+7QFuDVoG1x7F7jbE98Uw6aNQD2BCNGeO1HaohUGb4XrUQn6/LgaIwregUmciKv7N8P9n+h3/UkzeNDTk14zWITs/I6KdCpqOZJqSJgEv+Mn8VixM6GWvTNGteUju9Sd6f0RNBiNyf1qQHznAs4p2UuQPNmDaYvPca35PbTniobFdY4An4yZiJ5GIty9dpXbrS0oFf5XgyE2+QKTRjeRpWlWVtjvmLbgFgZtc0XvArGCbzoM00bUg0AUDc+dx6GRyK6h+FP2fKu6NESMxKv7sdn9H0SXOXCWw3gqDMZW16OQ9PkRq0eYyhKlypjvLD/4XHwJQdPeGKBw/pME8Ykv3o1/khQ/HPKJVuMXZGP0mTgclhSFAP8nin1KSjqGaGSgLZoGhqcPSKsFbFpXgyTiHu5mShPEeBqcBlNro9yn+XXG47dNo1Dj37VYclSxgIVRnljj1xJfOby9BychIyOT2/PJQHp6Ufs6ea8BZSI9s0CtiDKQISTuqXSkKbyde0+mNHM5ECo0wkz4b14NnwI3WH9zLxSvOvVD97xNKAVuwHDagl8HCXD8x7W4Kr/OTfIK//7kCp+qQ7lymPRuEb00T+kZWdy2ZiIto6htLZno1V0c+rYfes56hsErh8FC2fxbvzMGOZhBIHkJnx378KDcB3At1K3HfZ84AQ8eJOfvtXJlcfnUYxjV4yP9zRuIJC+QJDFG9dw8l1yvyJZOVd4yQu/VmzG10R1sX3VccZAWhmHvL56IEUvw5tUrNYKClAiv7h7Ct/16YtazwVg5zIKr5cL0Ow+Cg5kAkpc+2LHvQYnfJX5yDLMmHYC5qw88nKVHpxRlnVkKx8lzMG3gWKwPVSPnXN/J4AIWCYXIUmhW3IBj0xrVJBG4l9dRIX4ajDRTa64kVVTEd2T6b8ZqnxeKRyne3EPoq07oV/rOJCNtDxm5/SOjQP8gLj2DuImQMEvxu1RtQ/w6GP/bJoyq8S/WLjkKhf0sYRQ81/ih5VcOkF6DQ932XHwsK6Ui61TVPqOC9x7XpZuZwUVkQma69L/yRNz7hbltIV0xsHPvyeTew0V2hcCuqbgu3YlywpZfB0Fw/EesVQzsePXvT3D1qYqhXBualB/YQekZyOLaZ2ZaRoH2qQLRK9w99C369ZyFZ4NXYpjywI7OgxxgJpDgpc8O7NNAYC9z/PlA+eYyjqWOkzFn2kCMXR+qZsyXZr8cxlPxExybNQkHzLl5gIez4tWVyppvrbqox40/4oQHeJCc39okry7j1GMj1OOn480bESQvkiAxrp43hknjSW7YSEfhsJGBvLAhN9L2Xo3NUxvhzvZVOK440CJs7y/wjBFD8uYVXmmgGpXKvdjbR0x4fzeNa2VOVqNW0pb182jSwiMUK3+5PMqh2NOraHiH9tTLaRltdt9Fvy2dSqMnudJF2UU208+6UL/uHahJTQMyMDAi8+adqHuvYbTGP/8ifsIb62mkQ2dqYSZ9jSHVatqRevRbRhfS48hzdh/q3r4+mRgakqFxXWrdtTdN2R1G6dfWkqODHTWvLXtPkw7Uvf8KupiVReenN6d2k5bS3C+dacWuw+TtfYT2uM6g4Y6L6Jj8tT1LSxhF3suGkl3nweT0/Trats2V5jp2IXvHFeQTnb8dOcHb6Mte9tSqjiGXJwOq0ciGuvbsQ3MPx+df+7MEwqtraIBNI6plyG1XNT3SrVKVTNt8Q17PFD8hJ2Qnjfu0ARnrViW9atIyMKZ6re2o+1BX8pe/eOc7Qrq+qAXptl9etms9Sm+aMt6WLCzt6Otf/6IjB3fQ6vnzaaNvIkX+MZoaGjembo7jyeV4PGWWul4tyKpzr9x6fVs7orgL9NNIO+o8cgltO3iYfl+/hGY6zaMtfy4mG20Qr0ptatGpDy2/pHRjlRDS1TUDyKZRLTLk6qaani5VqWpKbb7xIsWizaGQnePo0wbGpFtVj6pxrzUwrket7brTUFd/heuiviWKPUrfOAyiFf8kyF1zV5EofCcNsTQkk3qNaOzeV7LU0hDSzQ1jqJd9K6ojbRMGptSsUy+a7Rkne54jvE+7x7Uic6tRtHLLepo3aSEdUeyoJSj6O7LOT6fm7SbR0rlfkvOKXXTY25uO7HGlGcMdadEx+WsMl0x4cwONedc/DKl2s8+pJ9der6TepA1jepF9qzq5dWNg2ow69ZpNnnFiFWJD4TaUE3uaVg3vQO17OdGyze6067elNHX0JHK9mJjfH1Voz6mliGWlU3R5l2V7S+t9xXVuY2j9SAfq3MKMe40BGdZqSh179KNlF9IpznM29enenuqbcNtiaEx1W3el3lN2U1j6NVrr6EB2zWvL3tOEOnTvTysuvtZ8XOfqIcp7GQ2160yDnb6nddu2ketcR+pi70grfKK5Z2Vygmnbl3Lts0Yjsunak/rMPUzxpQ/stGaADTWqJW371UhPtwpVNW1D33g9UxwbckJo57hPqYGxLlXVq5ZbBsb1WpNd96Hkqjywk/D6Imqh256WFxPY1Y4/Hzjf0mtl7xxiSYYm9ajR2L2kSuSUKrfxVBRLR79xoEEr/qEEZU2vjPmWSg7YTONtLcjS7mv69a8jdHDHapo/fyP5JkbSH6MbknHjbuQ43oWOx2fSjfUjyaFzCzKTtk/DWtS0Yw/qt+wCpcd50uw+3al9fROunxmSsYUVde41hXaHyTItiqMLP43k5jYjacm2g3T49/W0ZKYTzdvyJy220SbwqlDtFp2oz/JLea/XoI9+gpxLnEJRN3zJ90YUvSkmGAhfPqRAP3+6E5NS6slgeUl9HCu7Y0waPQ3yo38uXqHbUckauLi7kF4+DKRrtyLplapj4genoQmyjCg5moKuXaZ/bzyg53IBRPgqjuJTNPAFb2W9pAc3rtD1kLi8i6WnRdOtq4EUHBZFcUlp5XLBflXkRB+huaPnkOejt4UgvXHBfFoZqDxnwoBltOh3dcJlScSUEnWDfH1vUFRxHVVVqY8pVnb7pbSnQeT3z0W6cjuKkj90watC+JIeBvqR/50YSimiaN5be64oWFxXkLud125R5McX2Es30ZQpv/ijOlXyLb3j3bJFv6s10dS4nGg6Mnc0zfF89O6AifTGSfNXBsr+klPmfIsoOTqIrl3+l248eC53gEZIr+LiSXOhKYtePrhBV66HUFzeQEvRt65SYHAYRcUlUVo5hECe9D+yg8kM84Fl4/qi1uhxcRQCAleizYe5skulIoo+hGmjN0EycAxsjPMW05EoFbe9gtH1pCcmyp3IkUeChL0L4dbiZ6zoVPBKAAzDMKrLvr4IrXtcxKiAQKwsNrBXrPiTHbAYbbtfxMjAG1hhXfyAJEnYi4VuLfDzik4K5wq8d6JoHJo2GpskAzHGxvjd1VBSb3shuOtJeBYI+hUm3xUQmyAzH54kEad+XoETUW/w8MpZ3HlVG7Zf2KGhQTOMXrMIPQtN4phSyb6OpbY9seZewXWVgFbzhfALXodCY5D4PjYtPIMe6xaghPGAYRimGBIknuImuiei8ObhFZy98wq1bb+AXUMDNBu9BouUBfYKFn9KP0EW4/6mhTjTYx0WfNCMZ+P6Ulv0XHOv0Bpf6ZWsFvoFY51C0K8o+a6Y2ASZYRgZIUK2z4NH/ZX4sX+tj/wMXoZhPi4VL/6UdoIsDNmOeR71sfLH/qj1EQXOjzXf7wsrEoZh8ojj8LzR11jKJscMw7xvFTH+kPQuiQS5m+AqIUbc80b4eunHNsn8WPP9/rAjyAzDMAzDMLnUWBrCVEpsgswwDMMwDMMwctiBdYZhGIZhGIaRwybIDMMwDMMwDCOHLbEoKDUEnuu34nycEJkvXyCjWksM+GYBJn9eW+ntfhmGYRiGYZjKhU2Q5YlCsXXKL5DM2oSZtsbgS5IRuH4UBq6IxaCDfnAfXFv2QoZhGIZhGKayYkss5GRfdYdbQAokEp28guGboMN8Vzg1jsYfP+/NfQ3DMAzDMAxTuVWSCbIYkfud4WBvi2aWdVG3Xl1YmNeGWX0r9HS5iDTZqyC6hXV9m8KspinMLbjX1W2ElrY9MP1ATO7TfP3qqJYajvAEYe7fubQao2E9PsQJT2UJDMMwDMMwTGVWyZZYSJDoMQptJnjhRZUe2Bh2HrPrF1g5nO2HOa0G4mzrb/Gr6wz0a2ZU/F5C6mk4tRoC78/24/nhMbJEhmEYhmEYprKqZEss+DAbNgtjGmuBhLdxyfcFN2WWl4XQ3TsQNcwLV44swYCSJscQInirK45K+uDH1SNkaQzDMAzDMExlVskmyBxdOzhPtEEVeo1z7vsRIZalQ4Qoj5n4PnwM3Nb0gmmJWy7Gk2OzMOmAOVx9PODcrOj7sDMMwzAMwzCVR+WbIEOA5hOnopcRD1mB+7A7QLqeWIKEkwsx92I3bPhtEOqUYnL8+NhsTN5vgXX/eOLrttVk6QzDMAzDMExlVwknyNxG1XHE1KHmEIgewsPtFKIvL8fXB5rgx23j0bjEA8EixHgtxLd+XbDz8HL0NBNw8+t4uC9YJXueYRiGYRiGqcwq7XWQs298h3b2vyBMuw5afTED7r9/j8+MZE8WSYToQ9MwepMEA8fYwJgnTSOIUm/DK7gr/D0n5r6KYRiGYRiGqbwq741CxI/wa482WHQlB+2X/w8By61R0sHj7OtLYdtzDe5lFiwSLTRf6IewdZ1kfzMMwzAMwzCVVaVcYiElenILYWn60EUOgj324brcpY2LotPpJ9zNkEC6z6D4yGGTY4ZhGIZhmP+ISjlBliSexuLZ52C/xw2j6wggeuQJ91MpsmcZhmEYhmEYpmiVboIsSfbDyml7UXflVnzVtj+mjW8GbUqE9+7DeKJ4UWSGYRiGYRiGKaRyrUFOv4MNk1YiZeY+LO9ikjv7Fz/6FT3aLMIVkQ1W/u86XKyKWomcihDP9dh6Pg7CzJd4kVENLQd8gwWTP0ftAjfjYxiGYRiGYSqvynMEOfsB9s5YicQpu95NjqUEjSbAqbcJeNlB2L/LH1mydEUihG6diXXPB+Ln3bux7+Ax/Lm0NYJ+cECX6SfwjB15ZhiGYRiG+c+oHBPkrDD8Pm0Bbg3aBtfepoobxTfFsGkjUE8gQrTnThxPkqXLy74Kd7cApEgk0Ml9Mx8mHebD1akxov/4GXvzb8enSPIcAX9tws7TEciQJTEMwzAMwzAft498gizCq7uH8G2/npj1bDBWDrOAstUQ+p0HwcFMAMlLH+zY94B7VwF8fVSvlorw8ATkX+xCC40b1gNfnICncYXekUt4bgmGT5yLbxynY3csO8zMMAzDMAxTGXykE+RsXPt5IGwb10HDzlOx/UYyci7/gF4zjuK5wjxVhFC38ehgNQ4HXlVBtWp83PmpF2w698CwNVfzJ8Natlh2PR4Pdg6GiSxJuib5ekAIJNU7oLO1tixNkVZTO3Sub4RabTqjXc3KcTCeYRiGYRjmv67y3iikjITBa9Cz2zZUX3sRx5yblXiTEYZhGIZhGKZyYIc9lRA/OYZZkw7A3NUHHmxyzDAMwzAM85/CJsgFiB8fw+zJ+2Gx7h94ft0W1WTpDMMwDMMwzH8DmyDLEcV4YeG3fuiy8zCW9zSDABLEuy/AqpvKT9JjGIZhGIZhKh+2BllGFH0I00ZvgmTgGNgY83LTSJSK217B6HrSExPzz95jGIZhGIZhKjE2QZbKvo6ltj2x5l4mChaGVvOF8Ateh046sgSGYRiGYRimUmMTZIZhGIZhGIaRw9YgMwzDMAzDMIwcNkFmGIZhGIZhGDlsgswwDMMwDMMwctgEmWEYhmEYhmHksAkywzAMwzAMw8hhE2SGYRiGYRiGkcMmyAzDMAzDMAwjh02QGYZhGIZhGEYOmyAzDMMwDMMwjBw2QWYYhmEYhmEYOWyCzDAMwzAMwzDvAP8HTBb3MnC/Tt0AAAAASUVORK5CYII="
    }
   },
   "cell_type": "markdown",
   "id": "cb91ab27",
   "metadata": {
    "papermill": {
     "duration": 0.025593,
     "end_time": "2023-07-17T15:26:18.937446",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.911853",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "![image.png](attachment:c62a5b00-0462-4481-9b2a-f05fe08d58e4.png)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "12c41f7b",
   "metadata": {
    "papermill": {
     "duration": 0.026696,
     "end_time": "2023-07-17T15:26:18.990313",
     "exception": false,
     "start_time": "2023-07-17T15:26:18.963617",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "attachments": {
    "368ed58f-3b9c-4331-a1bd-1fec455808f4.png": {
     "image/png": "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"
    }
   },
   "cell_type": "markdown",
   "id": "5fc8820c",
   "metadata": {
    "papermill": {
     "duration": 0.026283,
     "end_time": "2023-07-17T15:26:19.043725",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.017442",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Applied\n",
    "### 5. We have seen that we can fit an SVM with a non-linear kernel in order to perform classification using a non-linear decision boundary. We will now see that we can also obtain a non-linear decision boundary by performing logistic regression using non-linear transformations of the features.\n",
    "#### (a) Generate a data set with n = 500 and p = 2, such that the observations belong to two classes with a quadratic decision boundary between them. For instance, you can do this as follows:\n",
    "![image.png](attachment:368ed58f-3b9c-4331-a1bd-1fec455808f4.png)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "0a0acda3",
   "metadata": {
    "papermill": {
     "duration": 0.025481,
     "end_time": "2023-07-17T15:26:19.094848",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.069367",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "5ddf505b",
   "metadata": {
    "papermill": {
     "duration": 0.025337,
     "end_time": "2023-07-17T15:26:19.145427",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.120090",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (b) Plot the observations, colored according to their class labels. Your plot should display X1 on the x-axis, and X2 on the yaxis."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "0d562971",
   "metadata": {
    "papermill": {
     "duration": 0.02519,
     "end_time": "2023-07-17T15:26:19.196021",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.170831",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "b73d1ef0",
   "metadata": {
    "papermill": {
     "duration": 0.028379,
     "end_time": "2023-07-17T15:26:19.250818",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.222439",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (c) Fit a logistic regression model to the data, using X1 and X2 as predictors."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "cf031daa",
   "metadata": {
    "papermill": {
     "duration": 0.025238,
     "end_time": "2023-07-17T15:26:19.302931",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.277693",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "a067194b",
   "metadata": {
    "papermill": {
     "duration": 0.026078,
     "end_time": "2023-07-17T15:26:19.354801",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.328723",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (d) Apply this model to the training data in order to obtain a predicted class label for each training observation. Plot the observations, colored according to the predicted class labels. The decision boundary should be linear."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "03b7c8ca",
   "metadata": {
    "papermill": {
     "duration": 0.025465,
     "end_time": "2023-07-17T15:26:19.405890",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.380425",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "attachments": {
    "a7335347-1c70-4db4-bc27-b88fce6725e3.png": {
     "image/png": "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"
    }
   },
   "cell_type": "markdown",
   "id": "08fe19e7",
   "metadata": {
    "papermill": {
     "duration": 0.024447,
     "end_time": "2023-07-17T15:26:19.454780",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.430333",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (e) Now fit a logistic regression model to the data using non-linear functions of X1 and X2 as predictors (e.g. ![image.png](attachment:a7335347-1c70-4db4-bc27-b88fce6725e3.png)), and so forth)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "0437d241",
   "metadata": {
    "papermill": {
     "duration": 0.024422,
     "end_time": "2023-07-17T15:26:19.503767",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.479345",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "46ca1f67",
   "metadata": {
    "papermill": {
     "duration": 0.024418,
     "end_time": "2023-07-17T15:26:19.552580",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.528162",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (f) Apply this model to the training data in order to obtain a predicted class label for each training observation. Plot the observations, colored according to the predicted class labels. The decision boundary should be obviously non-linear. If it is not, then repeat (a)-(e) until you come up with an example in which the predicted class labels are obviously non-linear."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "5612d53e",
   "metadata": {
    "papermill": {
     "duration": 0.025353,
     "end_time": "2023-07-17T15:26:19.602239",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.576886",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "4d96242e",
   "metadata": {
    "papermill": {
     "duration": 0.025398,
     "end_time": "2023-07-17T15:26:19.651828",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.626430",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (g) Fit a support vector classifier to the data with X1 and X2 as predictors. Obtain a class prediction for each training observation. Plot the observations, colored according to the predicted class labels."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "68ed85d8",
   "metadata": {
    "papermill": {
     "duration": 0.024487,
     "end_time": "2023-07-17T15:26:19.701389",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.676902",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "1c891f56",
   "metadata": {
    "papermill": {
     "duration": 0.02438,
     "end_time": "2023-07-17T15:26:19.750024",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.725644",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (h) Fit a SVM using a non-linear kernel to the data. Obtain a class prediction for each training observation. Plot the observations, colored according to the predicted class labels."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "aa9738eb",
   "metadata": {
    "papermill": {
     "duration": 0.024157,
     "end_time": "2023-07-17T15:26:19.798482",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.774325",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "0e3a86a7",
   "metadata": {
    "papermill": {
     "duration": 0.029107,
     "end_time": "2023-07-17T15:26:19.852099",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.822992",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (i) Comment on your results."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "9626f081",
   "metadata": {
    "papermill": {
     "duration": 0.031144,
     "end_time": "2023-07-17T15:26:19.910609",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.879465",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "fccf991c",
   "metadata": {
    "papermill": {
     "duration": 0.024452,
     "end_time": "2023-07-17T15:26:19.964824",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.940372",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### 6. At the end of Section 9.6.1, it is claimed that in the case of data that is just barely linearly separable, a support vector classifier with a small value of cost that misclassifies a couple of training observations may perform better on test data than one with a huge value of cost that does not misclassify any training observations. You will now investigate this claim.\n",
    "#### (a) Generate two-class data with p = 2 in such a way that the classes are just barely linearly separable."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "2e9e92be",
   "metadata": {
    "papermill": {
     "duration": 0.024463,
     "end_time": "2023-07-17T15:26:20.014720",
     "exception": false,
     "start_time": "2023-07-17T15:26:19.990257",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "903ef83a",
   "metadata": {
    "papermill": {
     "duration": 0.024425,
     "end_time": "2023-07-17T15:26:20.063354",
     "exception": false,
     "start_time": "2023-07-17T15:26:20.038929",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (b) Compute the cross-validation error rates for support vector classifiers with a range of cost values. How many training errors are misclassified for each value of cost considered, and how does this relate to the cross-validation errors obtained?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e33c955f",
   "metadata": {
    "papermill": {
     "duration": 0.026111,
     "end_time": "2023-07-17T15:26:20.113729",
     "exception": false,
     "start_time": "2023-07-17T15:26:20.087618",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "281fea10",
   "metadata": {
    "papermill": {
     "duration": 0.024631,
     "end_time": "2023-07-17T15:26:20.162618",
     "exception": false,
     "start_time": "2023-07-17T15:26:20.137987",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (c) Generate an appropriate test data set, and compute the test errors corresponding to each of the values of cost considered. Which value of cost leads to the fewest test errors, and how does this compare to the values of cost that yield the fewest training errors and the fewest cross-validation errors?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "b13c8445",
   "metadata": {
    "papermill": {
     "duration": 0.024558,
     "end_time": "2023-07-17T15:26:20.211991",
     "exception": false,
     "start_time": "2023-07-17T15:26:20.187433",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "1b05229e",
   "metadata": {
    "papermill": {
     "duration": 0.024903,
     "end_time": "2023-07-17T15:26:20.261277",
     "exception": false,
     "start_time": "2023-07-17T15:26:20.236374",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### (d) Discuss your results."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "3ed781cf",
   "metadata": {
    "papermill": {
     "duration": 0.024432,
     "end_time": "2023-07-17T15:26:20.310673",
     "exception": false,
     "start_time": "2023-07-17T15:26:20.286241",
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
   "duration": 29.777761,
   "end_time": "2023-07-17T15:26:20.459150",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-07-17T15:25:50.681389",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
