## Comparison of machine learning methods for predicting the recovery time of professional football players after an undiagnosed injury

### Kampakis, 2011

#### Introduction

There is no standard method for determining time missed due to injury. Estimates are based on physician experience and on recommendations by various groups and studies.

Gaussian processes, support vector machines, and neural networks are all popular methods for regression tasks

#### Methods

Data set variables:

* age
* stage of season - start, mid, etc.
* where injury occured - practice, game
* phase of play - how the injury occured
* injury - description not specific diagnosis
* type - overuse, acute injury, etc.
* side of body - left or right
* player position
* body part injured
* reoccurance - has the same injury happened before?

Main variable of interest: days unavailable

all variables except age and days unavailable were categorical and needed to be converted to dummy variables. each value was converted to a binary variable

each algorithm (neural network, svm, gaussian process) was executed with many different parameter sets using grid search used to find the best paramaters

tables 2-6 show the parameter ranges

tasks were evaluated using root mean squared error from 10-fold cross validation runs of the grid search

mean of the data was used as a naive predictor in order to compare error of methods against it

inspection of individual predictions showed that RMSE could be severely affected by a few errors

correlation between predicted and actual vaues is able to provide a scale-free measure of error

correlation of naive predictor with data is 0. values above that provide a measure for whether an algorithm can make better predictions than the mean

**Uhhh WTF?! don't understand their analysis**

#### Results

best results parameter settings shown in table 7

