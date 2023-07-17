{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "71a9f94f",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-07-17T13:54:37.019728Z",
     "iopub.status.busy": "2023-07-17T13:54:37.016501Z",
     "iopub.status.idle": "2023-07-17T13:54:40.561091Z",
     "shell.execute_reply": "2023-07-17T13:54:40.559203Z"
    },
    "papermill": {
     "duration": 3.565827,
     "end_time": "2023-07-17T13:54:40.564504",
     "exception": false,
     "start_time": "2023-07-17T13:54:36.998677",
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
    "    })"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d85179d0",
   "metadata": {
    "papermill": {
     "duration": 0.01182,
     "end_time": "2023-07-17T13:54:40.588305",
     "exception": false,
     "start_time": "2023-07-17T13:54:40.576485",
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
   "id": "c5c34ab8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T13:54:40.650509Z",
     "iopub.status.busy": "2023-07-17T13:54:40.613420Z",
     "iopub.status.idle": "2023-07-17T13:54:41.257102Z",
     "shell.execute_reply": "2023-07-17T13:54:41.255236Z"
    },
    "papermill": {
     "duration": 0.660301,
     "end_time": "2023-07-17T13:54:41.260214",
     "exception": false,
     "start_time": "2023-07-17T13:54:40.599913",
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
   "id": "5a090cb0",
   "metadata": {
    "papermill": {
     "duration": 0.012682,
     "end_time": "2023-07-17T13:54:41.289492",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.276810",
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
   "id": "b8e60dfe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T13:54:41.318536Z",
     "iopub.status.busy": "2023-07-17T13:54:41.316960Z",
     "iopub.status.idle": "2023-07-17T13:54:41.356012Z",
     "shell.execute_reply": "2023-07-17T13:54:41.354148Z"
    },
    "papermill": {
     "duration": 0.056819,
     "end_time": "2023-07-17T13:54:41.359058",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.302239",
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
   "id": "3492e393",
   "metadata": {
    "papermill": {
     "duration": 0.012229,
     "end_time": "2023-07-17T13:54:41.383548",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.371319",
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
   "id": "485748f5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T13:54:41.412460Z",
     "iopub.status.busy": "2023-07-17T13:54:41.410768Z",
     "iopub.status.idle": "2023-07-17T13:54:41.531873Z",
     "shell.execute_reply": "2023-07-17T13:54:41.529145Z"
    },
    "papermill": {
     "duration": 0.138371,
     "end_time": "2023-07-17T13:54:41.534661",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.396290",
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
   "id": "07e4969c",
   "metadata": {
    "papermill": {
     "duration": 0.012643,
     "end_time": "2023-07-17T13:54:41.560176",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.547533",
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
   "id": "79777ae8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T13:54:41.589263Z",
     "iopub.status.busy": "2023-07-17T13:54:41.587782Z",
     "iopub.status.idle": "2023-07-17T13:54:41.718595Z",
     "shell.execute_reply": "2023-07-17T13:54:41.716891Z"
    },
    "papermill": {
     "duration": 0.147981,
     "end_time": "2023-07-17T13:54:41.720831",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.572850",
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
   "id": "af8be758",
   "metadata": {
    "papermill": {
     "duration": 0.013559,
     "end_time": "2023-07-17T13:54:41.748096",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.734537",
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
   "id": "baa60eec",
   "metadata": {
    "papermill": {
     "duration": 0.013023,
     "end_time": "2023-07-17T13:54:41.774234",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.761211",
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
   "id": "e76d04c3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T13:54:41.803812Z",
     "iopub.status.busy": "2023-07-17T13:54:41.802189Z",
     "iopub.status.idle": "2023-07-17T13:54:42.789752Z",
     "shell.execute_reply": "2023-07-17T13:54:42.788077Z"
    },
    "papermill": {
     "duration": 1.004792,
     "end_time": "2023-07-17T13:54:42.791988",
     "exception": false,
     "start_time": "2023-07-17T13:54:41.787196",
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
   "id": "a3563e14",
   "metadata": {
    "papermill": {
     "duration": 0.013507,
     "end_time": "2023-07-17T13:54:42.818997",
     "exception": false,
     "start_time": "2023-07-17T13:54:42.805490",
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
   "id": "134c37d2",
   "metadata": {
    "papermill": {
     "duration": 0.013884,
     "end_time": "2023-07-17T13:54:42.846260",
     "exception": false,
     "start_time": "2023-07-17T13:54:42.832376",
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
   "id": "5a32fdeb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T13:54:42.876639Z",
     "iopub.status.busy": "2023-07-17T13:54:42.875124Z",
     "iopub.status.idle": "2023-07-17T13:54:43.682603Z",
     "shell.execute_reply": "2023-07-17T13:54:43.680815Z"
    },
    "papermill": {
     "duration": 0.82524,
     "end_time": "2023-07-17T13:54:43.684908",
     "exception": false,
     "start_time": "2023-07-17T13:54:42.859668",
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
   "id": "ae3da0ab",
   "metadata": {
    "papermill": {
     "duration": 0.014491,
     "end_time": "2023-07-17T13:54:43.713357",
     "exception": false,
     "start_time": "2023-07-17T13:54:43.698866",
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
   "id": "44c8ffaa",
   "metadata": {
    "papermill": {
     "duration": 0.013982,
     "end_time": "2023-07-17T13:54:43.741316",
     "exception": false,
     "start_time": "2023-07-17T13:54:43.727334",
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
   "id": "92b772d1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T13:54:43.772974Z",
     "iopub.status.busy": "2023-07-17T13:54:43.771358Z",
     "iopub.status.idle": "2023-07-17T13:54:49.423742Z",
     "shell.execute_reply": "2023-07-17T13:54:49.422010Z"
    },
    "papermill": {
     "duration": 5.670715,
     "end_time": "2023-07-17T13:54:49.426045",
     "exception": false,
     "start_time": "2023-07-17T13:54:43.755330",
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
      "time: 5s\n",
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
   "cell_type": "code",
   "execution_count": null,
   "id": "adcc9616",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-17T13:36:01.638762Z",
     "iopub.status.busy": "2023-07-17T13:36:01.637001Z",
     "iopub.status.idle": "2023-07-17T13:36:07.020064Z"
    },
    "papermill": {
     "duration": 0.014499,
     "end_time": "2023-07-17T13:54:49.455743",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.441244",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "f32db979",
   "metadata": {
    "papermill": {
     "duration": 0.014462,
     "end_time": "2023-07-17T13:54:49.484562",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.470100",
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
   "execution_count": null,
   "id": "1cf37dc2",
   "metadata": {
    "papermill": {
     "duration": 0.014958,
     "end_time": "2023-07-17T13:54:49.513949",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.498991",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "40b5e192",
   "metadata": {
    "papermill": {
     "duration": 0.01426,
     "end_time": "2023-07-17T13:54:49.542633",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.528373",
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
   "execution_count": null,
   "id": "65803149",
   "metadata": {
    "papermill": {
     "duration": 0.014412,
     "end_time": "2023-07-17T13:54:49.571350",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.556938",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "2779a0fc",
   "metadata": {
    "papermill": {
     "duration": 0.014333,
     "end_time": "2023-07-17T13:54:49.600462",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.586129",
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
   "execution_count": null,
   "id": "1f99f572",
   "metadata": {
    "papermill": {
     "duration": 0.014217,
     "end_time": "2023-07-17T13:54:49.628968",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.614751",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "f7edf8e0",
   "metadata": {
    "papermill": {
     "duration": 0.014102,
     "end_time": "2023-07-17T13:54:49.695723",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.681621",
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
   "execution_count": null,
   "id": "85eab2c2",
   "metadata": {
    "papermill": {
     "duration": 0.01444,
     "end_time": "2023-07-17T13:54:49.724246",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.709806",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "6d69d192",
   "metadata": {
    "papermill": {
     "duration": 0.014095,
     "end_time": "2023-07-17T13:54:49.752633",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.738538",
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
   "execution_count": null,
   "id": "0ca039fc",
   "metadata": {
    "papermill": {
     "duration": 0.014168,
     "end_time": "2023-07-17T13:54:49.780916",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.766748",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "b753ccf2",
   "metadata": {
    "papermill": {
     "duration": 0.014154,
     "end_time": "2023-07-17T13:54:49.809270",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.795116",
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
   "execution_count": null,
   "id": "cd6829b8",
   "metadata": {
    "papermill": {
     "duration": 0.014804,
     "end_time": "2023-07-17T13:54:49.838553",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.823749",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "ca4cfa87",
   "metadata": {
    "papermill": {
     "duration": 0.01417,
     "end_time": "2023-07-17T13:54:49.867283",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.853113",
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
   "execution_count": null,
   "id": "9126521a",
   "metadata": {
    "papermill": {
     "duration": 0.014019,
     "end_time": "2023-07-17T13:54:49.895564",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.881545",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "70336c4a",
   "metadata": {
    "papermill": {
     "duration": 0.014008,
     "end_time": "2023-07-17T13:54:49.923833",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.909825",
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
   "id": "730dcb53",
   "metadata": {
    "papermill": {
     "duration": 0.014032,
     "end_time": "2023-07-17T13:54:49.951954",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.937922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "0a13e316",
   "metadata": {
    "papermill": {
     "duration": 0.016315,
     "end_time": "2023-07-17T13:54:49.982295",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.965980",
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
   "id": "2802e6ac",
   "metadata": {
    "papermill": {
     "duration": 0.014452,
     "end_time": "2023-07-17T13:54:50.011649",
     "exception": false,
     "start_time": "2023-07-17T13:54:49.997197",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "e53b4059",
   "metadata": {
    "papermill": {
     "duration": 0.014284,
     "end_time": "2023-07-17T13:54:50.040379",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.026095",
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
   "id": "d1bd22d2",
   "metadata": {
    "papermill": {
     "duration": 0.014308,
     "end_time": "2023-07-17T13:54:50.069099",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.054791",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "99cd9093",
   "metadata": {
    "papermill": {
     "duration": 0.014528,
     "end_time": "2023-07-17T13:54:50.098410",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.083882",
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
   "id": "205f80d8",
   "metadata": {
    "papermill": {
     "duration": 0.014256,
     "end_time": "2023-07-17T13:54:50.126850",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.112594",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "85ea4d92",
   "metadata": {
    "papermill": {
     "duration": 0.014247,
     "end_time": "2023-07-17T13:54:50.155932",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.141685",
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
   "id": "40dad7f8",
   "metadata": {
    "papermill": {
     "duration": 0.01425,
     "end_time": "2023-07-17T13:54:50.184349",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.170099",
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
     "image/png": "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"
    }
   },
   "cell_type": "markdown",
   "id": "3de29758",
   "metadata": {
    "papermill": {
     "duration": 0.014186,
     "end_time": "2023-07-17T13:54:50.212643",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.198457",
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
   "id": "53b30dd5",
   "metadata": {
    "papermill": {
     "duration": 0.014428,
     "end_time": "2023-07-17T13:54:50.241854",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.227426",
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
   "id": "8ce037de",
   "metadata": {
    "papermill": {
     "duration": 0.014206,
     "end_time": "2023-07-17T13:54:50.270337",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.256131",
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
   "id": "e747b4f4",
   "metadata": {
    "papermill": {
     "duration": 0.014296,
     "end_time": "2023-07-17T13:54:50.298913",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.284617",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "b94ab98e",
   "metadata": {
    "papermill": {
     "duration": 0.014208,
     "end_time": "2023-07-17T13:54:50.327340",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.313132",
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
   "id": "6a3a274e",
   "metadata": {
    "papermill": {
     "duration": 0.01427,
     "end_time": "2023-07-17T13:54:50.356326",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.342056",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "7a317c7f",
   "metadata": {
    "papermill": {
     "duration": 0.014232,
     "end_time": "2023-07-17T13:54:50.384859",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.370627",
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
   "id": "4c9dc308",
   "metadata": {
    "papermill": {
     "duration": 0.014165,
     "end_time": "2023-07-17T13:54:50.413151",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.398986",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "205050d3",
   "metadata": {
    "papermill": {
     "duration": 0.014474,
     "end_time": "2023-07-17T13:54:50.441797",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.427323",
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
   "id": "ee6aa2a7",
   "metadata": {
    "papermill": {
     "duration": 0.01412,
     "end_time": "2023-07-17T13:54:50.470359",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.456239",
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
     "image/png": "iVBORw0KGgoAAAANSUhEUgAAAQoAAAAjCAYAAABsH0SDAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAABVUSURBVHhe7Z0JXI3pHsf/53TaQ6GSZAkVkiXLmK7uZBmMwowamchysg7CpLFmmVsYhpKtIho3mtKQ/WIsjcl6KYWMFG4blxjVPZ3Oefvdt3ppO6dzWjFzvp9P6jzn8Z7n+b//5/f8n+f5v8UDC6lQoUJFNfC57ypUqFAhF5VQqFChQiGqpUcVcinxwAbadiaTxAUv6Hm+LlmNnEVeQjsyVuOqqFDxF0MVUciAx+OV/sBqaLGKvn2tQsVfFE4o8unukWOUUFD66q+LlO5snUMbnjnRul27aM+Bn2nfMhuKXz6E7GfG0NMirpoKFbUl/y4dOZZA73aoSeneqcMU/wf3UglYocijq99PopXJraiTFlf6V6XwNwoJukKviopIo0RC+WTQbyH5eXSktB/XUejvTEk1FR8W0v+9pOxH9ynpXib9jyt7J+Rdpe8nraTkVp3o3Q41AXVom00/TF5B53OUm/34GZFzaNEdFwrw6kO6XOGHB0MPw6bTkIF9yLJtG2pj1oZMTYypVTtrGrziF1YKOaQ3aMMIC2rV0ohMTNl6bcypa59BNDP8Uen7fF1qrpdLyclZJC4tYRFQxw5mxGeyKD1DypXVHeZhGE0fMpD6WLZl22FGbUxNyLhVO7IevIJ+KWsw3dgwgixatSQjE1O2Xhsy79qHBs0Mp0fvk2YxDyls+hAa2MeS2rJtNGtjSibGraid9WBaUdYZ1vwbaIRFK2ppZEKmbL025l2pz6CZFN5gnSmka+tHkm1Xc2prbkW93YLoQf3dwppRlEGRcxbRHZcA8uoje6Q1pk9odZ1JW2a/pu9mhNLvythkrLUzfsxgivc0/wQwyAp3hhGfwNMehIBHUq68HOKLmNepKSy+8MXR5Ffs/1DEaxwXmkHd0AX7n9a/nZiscDgb8UE8bQwKeISqLRbj4rxOaGrxBXyPJuPV+3yrmCyEOxuBTzxoDwqAbPPPQ6emFvjC9yiSG6sz4mtYYq0O9V4+iJdwZY0Kg/SwsbB2/hHKDLXG84mXOD69J4ZteSDjMypCtj432I/9EyG6CM/OAhBfH6P3ZFUSAhGStrnC0fs0lB3zBfF+sNM3hVNQMhrGx0S46NkZAuJDf/QeZFVqlyhpG1wdvXG6AUSqIRBd9ERnAYGvPxp7qnYG21wd4X36qRICXY8wj7H57xrvTihensQMS1v43FB2pDWeT0hTNsPB/EuEZ1Z/LfJPVaQlHxpS3PHtD00eD1ofr8O9t92T4GG4EE5zY5RS9WKkT6IxrVc3OG+/hVyurCGQ3vFFf00eeFofY11ZgyF5GA6h01zEfEgRn/QOfPtrgsfTwsfr7pXNVJKHCBc6YW5MRuOKRDHFQvHJuxIKBo8CB6Olgz9qMtQazSeYpwj73Ai9fW5VOxGy6xrupz8RTMYuOOqzoZvAEt9cKiguQeYRTzhN3YcUJR1F+jgas4eMwqqzWQrDsjrDZGCXoz4bsgtg+c0llLQ48wg8naZin7INVhbmOeIiY5CUz72WixTp58NxosafzyBjlyP02eWfwPIblJo/E0c8nTB1X0oDRWUKeJdCIb2HtQOa4hP/RzUTyEbzCQZPdztB32IhLlUT8FC1H8nkI/P2OUQFbcambf/E6TsvajFoCvD8wVWcPnwIp29mlHQYufdxYvtqLF7si8g7opJa9csrxEwxhRobuplMjEbq+eUYPS4QCUp+lCQtCvNdPRGRUtJaFtb5gxdi9bWG87JXMVNgqsaG7CYTEZ16HstHj0Ogsg1WGgbZx+eiV2dHbInP48qqIn1yCDN7mGPE1qTaDexXMZhiqsYu/0wwMToV55ePxrjABDagfkcoFAopcu6dxf4dm7F5ZwTO3nqC3OocveA5Hlw9jcOHTuNmRqmP5N4/ge2rF2OxbyTKuzSTtgn2uj2w4lbNLdk4PsH2PuV72On0gk81Kkrc9ypIUqOxYGAXDJgehNiHGXh4+Z/wtOuMAQuPIF1JtSi+xnz7LrCb5o/Ioz9j58Lh6OvgArdJ3gi7kY6oCYYwnhTD1a5fxFe+RVd1NnTTMYX1GD9cfsW9oQBJagSm9huAyd9tQWBgYMnXls1+mGw3DntyuEoNgfgKvu2qzobsOjC1HgM/ZRtcY9hI4dAM9GTFIuBWVbF4IxLDNl6vw3JLjCvfdoU6u/zTMbXGGL/LrHS/Q6oRCublFWz5yg5/n7wWB84nISXxHPavnQR7OzcEXn3J1XqDBKnR82HfxQ7T/CNx9OedWDi8Lxxc3DDJOww30qMwwdAYk2LKBvOr8LHQN3BFlHxdlk9j+UTBacww08XQbZlyox6ZQsG8OI25XbVhNGoX0sqJgjQlAIOatoRjcJriyEISj+/66ULXIaDsGuwNCxysAy2bJYhjbSlKT0Qip8j1jvQBNtrrsEZWh+2q28rNjOI4LO2uDR6VJGRW+BJYeSGuQXd9pXiw0R467OBSt12F2zWfgGqAFE9+noEenUbCv5xYlIpERwz/4Uad92SkDzbCXocVanVbrGrYzihGnlCI4rHBoSXaTzxYacOQjSAjxsPM0AEbE8r8UxL/Hfrp6sIhoMz/mceBGKyjBZslcWzEJEJ6YiLKXFqCm8ttWH9fhhu1MkEj+YT0PtYN0EKHOedLI34ZyBAKtnM+PaEh6Ih5FyqNDHatuX2oFjT6++KuAqUQX/FGF4EAFgsvlTtVkeD6Umuoq3XAnHMNJBAckrQDEPY2hDaPHeQWCxDbsB9XdyRpOCDsDUNtHkhggQUN3mBWLKKnw6bjZ/C/mQdJsUj07IgRm+ouEsX3Oe2AEL0Ni0WX9YEFsXIdsFGQKRRSpPg7oIl6V3x7VcYMIP4N31ioo+mQQDws8XU2SvLuAgF7bxaWX8xLrmOptTrUOsxBVZcW4dDEltBkJ8v02uwFNppPvMZeJy3ojA5jf5JN1Wc9pPF08NAdkqh3oZ49NLhCDn5zsuhkTEX3Euh2WUaSbApEJGbnYr5axY/QUGeviQISiYon6oahKPsEec/7Fw3cHUSurdVImhJBIcdfce++hxRl0wnvefSvgbspyLU1qUlTKCLkOCnVYul/KX7/InJyD6LUGuUtqZHZF9vp6PemFOrsQA7DvejxpCiKXGBLelyN2lFE2Se8ad6/BtLuIFdqrSallIgQUmj+3CSKWDmTpnpMofFjHGn0BG8KiXtKDZZXxvxOEfsvUZ6GJXXvVsnPi9HoTt2t1Cg3NpwiU0pbUSASs+Elnyq6tAaVurSIqro0Q3l5+UTauqRTdaRVTy19IjcpglbOnEoeU8bTGMfRNME7hOKeKrKiGmnraBKT+5ry5CVqcoJRRn4EXJqwIaNuL4xfshzLl1f88p4jhPv0rbiiKAzPO4u5ndWh+1kIst+q6WtETzCGwHQSDjXQep/JuQifUWPxAztLlswC3Fq52YggPKmNqjc0TA4u+ozC2B9uoqTFb/ZWmo1AUHUNltzFj15CeHztjdlDWkOz98pahabStAhM7KwL7VYOWH+jrrEEg5yLPhg19geUmv/NGrsZRgQ9kbv+hSQJge7uCLj+srQOa5Or64fCSNsCHoezS6rUCVkRRX4kXPV54LeciEMy9wdFOPiVAfj85nCLLq2Qd3YuOqvr4rOQ7LK+vI7GBGMBTCcdQlWXzsXeUVrQdAyt2R5NLX1CkhQId/cAXH9ZWofJuYr1Q42gbeGBw2WDUAalfdV08Jc7RqoKhehnuDXng2/wFQ7WaYOVwdOwcWjTsjvcQ68jMycT10KnwMbsYyw+1UAJN3k3scllNHwu5ry9/tu1skYfrElUPJIkz24h3MsRE3c+fLsObTjycHOTC0b7XEROWYO5vRUN9FmTqMTeihiXF3WBVi2EQvooCsLuneAUeBPJBz3Q3Xw4NtVBLPJuboLLaB9cLOvM2zW2Rp81kGd+8QVPWFuMwuar5c5suZBe4yM/rqAOyBSKqBKh4OmPR5RMP8/HT182A6+cUJTkHIxrg5bd3RF6PRM5mdcQOsUGZh8vximZyU/5iBynD80h28tNloqorU+IccHTGhajNqOiGZfCWl0DH/nd40pkkY/wL3ShOSIEL7iSylQNiNR7UG9rdUJ+Jv3nmZw4hGEUh4RFGXT4cgf68f5hcsdZ2r5pN10RONO+f8fS2mFG9f98e+F9Cv16NWULg2mlvcHb66uZTySPYQbEK4ynsOBLcp/ak97bR4s8ptH8jSG0Z/8ZupOVX7KL2XAU0v3Qr2l1tpCCV9qTQVmDaaLHMDLgFVJ8WDBdaqDHDJknP9OsUUvo2fRoipjTiyzH7qSj69tQqIsLbbpR9nyGshTeD6WvV2eTMHgl2Zd1hswnetAwAx4VxodRsJzO8HWbk15uMiVnlVvPCjpSBzM+MVnpXEE9o2lNNpYCdj3xkl6yq4MqFOXSi5dsewVWZMOOh5KijMN0ucOPdP+wO+Hsdtq0+woJnPfRv2PX0jAjWR4toNamRsR79ZyeK+VMdfEJPuk216Pc5GSqaMYOZMZnKCs9gyuRQdFLtq8MGZiYkA5XVAVOMMrBIGPv52ip1gyfBadXnfmZJ9glXIjjb1SYVdnL+/yx4/h9VpfKIb6A+QMmIlKeRFWBjUAu74P/juO4rzAZqBKiu9gzeSRmRafLjALyTs1Au+LzaMNxOPCcK5SH+DIWddFC75WKT0qkWZewNyAYZ1IVrcMqI8LdPZMxcla07KPmvFOY0a44D8EQ4xQ3uMYRRUnGqU1nNpJIqHjPWOs9ihLCuv2n2HBN3rZWVUR392DyyFmIlt0ZnJrRriSnxXDcASjqzVteH4fQTB2GLvu5gnJIs3BpbwCCz6SyvVcCOZuZaTuGQ1/QGpNjZPT11UG4GQnQ3DEEj7lBIL4wHwMmRsqddavCIHPbEOi0FuK4wn3I+vSJMl4fF8JM3RAu+59yJTIQx8HLSgv9fMtl0pYgRdalvQgIPgOS1SZ24Yrwr8yh29EdkU/K1yjAw/BZcP8h4e0NKjghRGt2EPK0HRBQPs2TeYZwZ2MY2X6J2d94wWuRNxYv98Eav83Ye+o2nla+wwUnIGzNGoKnDYcAZbPYJHiREAFvBxPojQjGM660Cnms0xUnAPF0Yb9BwTMbNRAK0dGpaFX8AJrWR/BNUm6USl4kIMLbASZ6IxAsv8E4LixOGONB134DkqtvcI2EovgIdEZPWSLxBlYsIoXo1n6oYrGQvEBChDccTPQwQn5nWPMLSxKHeLr22FB9ZzgKEO9nB31TJwTJqF9ju0vvwbefetUjbskD7P7CDPp9l+FS+U0E5gUuLOqNZu1csLf0yKME5lk4nI2NYPvlbHzj5YVF3oux3GcN/DbvxanbT2WKluTGMtjoDMTGavK3698nOAri4WenD1OnoOrrP9+NkU3aY/YvldRMdBRTWxU/nKYFqpxS8hbJY5xYMxb9eg+Fh88WhARvwrJprpji90uF9ZY0JRRfmjeD0UcrEFt2JM9SUDI7WTYzgrmlFawsLdC5Y3u01teCWvG5cAtbTI8ol9IrTUHol+ZoZvQRVlS8kAzE+G2tI2zNDdG0SRPo6WhBU9sIPWYfrPSwlwRJO93Qt70+tLR1oMfWbaJvBhs7B3zuV5oWW4WaRBTJOzGmbVMYmJnjq9Dqd2fFv62Fo605DJuybdDTgZamNox6zMbBSmtbSdJOuPVtD30tbejosXWb6MPMxg4On/uVpkNXoSZCIcWDkOkQ7pAnEm9gxeLgArj4nGPnORmIf8NaR1uYGzZl26cHHS1NaBv1wOyDlfaeJEnY6dYX7dl7rq2jx9ZtAn0zG9g5fA4/2Z1hKT62nYZe3Zyx/Zbs/RLl7S7G9c3jMXRgN7QutntTY1h+PJi9979y77OIU3HE53PY/W00PJZswLZtfpjvbI+BzqtwLK3S0C94hCihJeuj5rC0soKlRWd0bN+avVdqJfk6LWynI6JyenXBGcxsa4Cx4VVHWsP5BIv0CaKn9UI35+2QY8a3iI6xQt7KDdGV5wVpMnaOaYumBmagaIXbsWI8f3ANsZdu4ZHSz7MW4ObGweg0cBkuPK2spFLkPvoVQVO6Q89gJELet6OIGgjFG8RXfLBob0OmbVZH7Tcz3z+keBw9G0NGrcLZLPkz8Bvq1+6lfh534yFyZIUGBTexcXAnDFx2AVVdOhePfg3ClO56MBgZUunkQIRzczrBxC268bJTpY8RPXsIRq06C8VmFOGXrzuinccJNmaRg/gKaOy+ckc99YUoBpOMDeEWXU1kkBuF8S0M4BpV0w2JBqbGQsGuQ3cvwMqGTdushj+LUEiQFjUfrp4RKHvEJgPBC1dzLyrTuHYXxUyCsSE761br0uPRojhdu5JLS5LW4W9mY7FP+aOP2iNJQ9R8V3iy0XqZGYOxcPU17lUlip/LMe+N5dfk25HJ3A1+6vYgSizkdjbrC74hGTUvpMz/ZMs9HWGyn1CmtA11aCcj2eVDgkmmyERTGtv33fUDKCr+hz7cX+kppbSfZtC4Ta+oW8f/0smQrbR1ayD5r19GYRltuTqVaGS78w2NqHlhJv0nW65HU/aTTJK26UCVXVrQbQ75uqTS9qBEqu+hVgFpGv00YxxtetWNOv73JIVsZe0Y6E/rl4VRRttOXKXyMPR7qD9dG7SGFsq1I0PJkYlEJ+cOwMgtyWzQV58wyIn9Bz61ssXkbbFIr7DQFSE9divcbS0xjF0rvquAXS41iigKkLhtFpYce1b/UZkimCwc852BacLx+MTCAM1aWmHwV0J4zPgeZ987o1aPOG4puhenKbNyV/FLACuvOK5Wed6B3ZkcxP7jU1jZTsa22PSKezeidMRudYet5TD4/Srb+MyLk5g7YCS2JNfvSCtDjLil3UseWahiR4EVvGREXtK03RjbfwoOVvO7LQoSt2HWkmPgQZSAALellLMgnFb/rRl73fqj6I9kOhUeTicTXhA01UnAZ/WpsIDQogd95uZGw62a1X8+RV0pvEyLbAbRL+Ou0LXVPUjAFcuESaVzZ/Kp//DuH/DvG/0AeWd2L6I/kk9RePhJSngB0lQXsP7LUGEBqEWPz8jNbThZNZPv0QW3A8htaQ4tCF9N9TzUas7/btHGCStJ5L2fVnwkL2mfodRzZyi//3DuDwD9cZ12+MVRz5WeNEBuxsWfm6Ls47RuVQylvn5Av566RTnGfehTuw7UxNKV1i4aTAZcPRUq6sIf13eQX1xPWuk5QH5yU4MjpdvBK+hsFy+aP7CFUpO16i+FqVChQiHvXeSvQoWK9w+VUKhQoUIhKqFQoUKFQlRCoUKFCoWohEKFChUKIPo/RvuBU/DYSIIAAAAASUVORK5CYII="
    }
   },
   "cell_type": "markdown",
   "id": "27e81eb2",
   "metadata": {
    "papermill": {
     "duration": 0.014261,
     "end_time": "2023-07-17T13:54:50.498830",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.484569",
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
   "id": "df35b571",
   "metadata": {
    "papermill": {
     "duration": 0.014981,
     "end_time": "2023-07-17T13:54:50.527953",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.512972",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "ca2a8650",
   "metadata": {
    "papermill": {
     "duration": 0.014085,
     "end_time": "2023-07-17T13:54:50.556194",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.542109",
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
   "id": "67e910dc",
   "metadata": {
    "papermill": {
     "duration": 0.014112,
     "end_time": "2023-07-17T13:54:50.584457",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.570345",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "820b1fa7",
   "metadata": {
    "papermill": {
     "duration": 0.014771,
     "end_time": "2023-07-17T13:54:50.613352",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.598581",
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
   "id": "87c89b39",
   "metadata": {
    "papermill": {
     "duration": 0.014187,
     "end_time": "2023-07-17T13:54:50.641751",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.627564",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "a595715e",
   "metadata": {
    "papermill": {
     "duration": 0.014304,
     "end_time": "2023-07-17T13:54:50.670463",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.656159",
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
   "id": "e7e7967b",
   "metadata": {
    "papermill": {
     "duration": 0.014676,
     "end_time": "2023-07-17T13:54:50.699495",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.684819",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "5fd58a18",
   "metadata": {
    "papermill": {
     "duration": 0.01411,
     "end_time": "2023-07-17T13:54:50.727856",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.713746",
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
   "id": "63f96d7d",
   "metadata": {
    "papermill": {
     "duration": 0.014134,
     "end_time": "2023-07-17T13:54:50.756354",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.742220",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "1771bbbf",
   "metadata": {
    "papermill": {
     "duration": 0.014553,
     "end_time": "2023-07-17T13:54:50.785142",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.770589",
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
   "id": "9e92ba75",
   "metadata": {
    "papermill": {
     "duration": 0.014121,
     "end_time": "2023-07-17T13:54:50.813507",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.799386",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "d9ec2797",
   "metadata": {
    "papermill": {
     "duration": 0.014219,
     "end_time": "2023-07-17T13:54:50.841891",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.827672",
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
   "id": "7b655fa1",
   "metadata": {
    "papermill": {
     "duration": 0.014083,
     "end_time": "2023-07-17T13:54:50.870084",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.856001",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "d314ad39",
   "metadata": {
    "papermill": {
     "duration": 0.014133,
     "end_time": "2023-07-17T13:54:50.898371",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.884238",
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
   "id": "fb1909ee",
   "metadata": {
    "papermill": {
     "duration": 0.014111,
     "end_time": "2023-07-17T13:54:50.926592",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.912481",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "7f2ba576",
   "metadata": {
    "papermill": {
     "duration": 0.014458,
     "end_time": "2023-07-17T13:54:50.955302",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.940844",
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
   "id": "bc84e6c2",
   "metadata": {
    "papermill": {
     "duration": 0.015927,
     "end_time": "2023-07-17T13:54:50.985556",
     "exception": false,
     "start_time": "2023-07-17T13:54:50.969629",
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
   "duration": 17.46567,
   "end_time": "2023-07-17T13:54:51.121867",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-07-17T13:54:33.656197",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
