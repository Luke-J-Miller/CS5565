{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "3ec99e5e",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-07-03T11:49:45.040877Z",
     "iopub.status.busy": "2023-07-03T11:49:45.038789Z",
     "iopub.status.idle": "2023-07-03T11:49:46.165221Z",
     "shell.execute_reply": "2023-07-03T11:49:46.163532Z"
    },
    "papermill": {
     "duration": 1.133117,
     "end_time": "2023-07-03T11:49:46.167632",
     "exception": false,
     "start_time": "2023-07-03T11:49:45.034515",
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
   "id": "2e56d2a2",
   "metadata": {
    "papermill": {
     "duration": 0.001714,
     "end_time": "2023-07-03T11:49:46.171227",
     "exception": false,
     "start_time": "2023-07-03T11:49:46.169513",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Chapter 6 Conceptual:\n",
    "ISLR 6.6 Problem 1 (a)-(c) (page 282) +3 points\n",
    "ISLR 6.6 Problem 2 (a)-(c) (page 283) +3 points\n",
    "\n",
    "Chapter 6 Lab:\n",
    "ISLR 6.6 Applied Problem 8 (a)-(f) (page 285) +6 points\n",
    "ISLR 6.6 Applied Problem 9 (a)-(d) (page 285) +4 points\n",
    "         (do not do (e), (f), or (g) on problem 9)\n",
    "\n",
    "(See link for assistance with Conceptual & Lab Problems: https://rpubs.com/lmorgan95/ISLR_CH6_SolutionsLinks to an external site.) \n",
    "\n",
    "Chapter 7 Conceptual:\n",
    "ISLR 7.9 Problem 4 (page 323) +3 points\n",
    "ISLR 7.9 Problem 5 (a)-(c) (page 323) +3 points\n",
    "\n",
    "Chapter 7 Lab:\n",
    "ISLR 7.9 Applied Problem 6 (a)-(b) (page 323) +2 points\n",
    "ISLR 7.9 Applied Problem 9 (a)-(f) (page 324) +6 points\n",
    "\n",
    "\n",
    "(See link for assistance with Conceptual & Lab Problems: https://rpubs.com/lmorgan95/ISLR_CH7_SolutionsLinks to an external site.) "
   ]
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
   "duration": 4.43185,
   "end_time": "2023-07-03T11:49:46.292364",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-07-03T11:49:41.860514",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
