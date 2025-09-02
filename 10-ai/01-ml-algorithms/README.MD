# Machine Learning Algorithms

## Table Of Contents
- [What is Machine Learning?](#What-is-Machine-Learning?)

- [Machine Learning Algorithm/Model](#Machine-Learning-Algorithm/Model)

# What is Machine Learning?
* __Machine Learning__ is the scientific study of _algorithms and statistical models that computer systems use to perform a specific task  without using explicit instructions_, relying on patterns and inference instead. i.e., ML is the study of building generic (generalized) algorithms and statistical models that perform certain tasks e.g., predicting the prices of things. (_Fundamentally, __machine learning__ involves building mathematical models to help understand data._)

* __Machine Learning__ can be broken down into three kinds:
    1. Supervised Learning
        - Classification Algorithms
        - Regression Algorithms

    2. Unsupervised Learning
        - Clustering
        - Dimensionality Reduction

    3. Reinforcement Learning

# Machine Learning Algorithm/Model
* Mathematical expression that reppresents data in the context of a problem, often a business problem. The aim is to go from data to insight.

* __Machine Learning__ = _Representation_ + _Evaluation_ + _Optimization_:

    1. __Representation__: involves the transformation of inputs from one space to another more useful space which can be more easily interpreted.

    2. __Evaluation__: is essentially the __loss function__. (how effectively did your algorithm transform your data to a more useful space?)

    3. __Optimization__: (this is the last piece of the puzzle) once you have the *evaluation component*, you can optimize the representation function in order to improve your evaluation metric.


# Model Selection and Hyperparameter Tuning

# Selecting the Best Model
* Of core importance regarding _model selection_ and selection of _hyperparameters_ is the following question: if our _estimator is underperforming_, how should we move forward? There are several possible answers:

    1. Use a more complicated/more flexible model
    2. Use a less complicated/less flexible model
    3. Gather more training samples
    4. Gather more data to add features to each sample

* The answer to this question is often counterintuitive. In particular, sometimes using a more complicated model will give worse results, and adding more training samples may not improve your results! The ability to determine what steps will improve your model is what separates the successful machine learning practitioners from the unsuccessful.

# The bias–variance trade-off
* Fundamentally, the question of “_the best model_” is about finding a sweet spot in the trade-off between __bias__ and __variance__.

* A model is said to __underfit__ the data if it does not have enough model _flexibility_ to suitably account for all the features in the data. Another way of saying this is that the model has __high bias__.

* A model is said to __overfit__ the data if it has so much model flexibility that the model ends up accounting for random errors as well as the underlying data distribution. Another way of saying this is that the model has __high variance__.

* __R^2 score__, or __coefficient of determination__, measures how well a model performs relative to a simple mean of the target values. __R^2 = 1__ indicates a perfect match, __R^2 = 0__ indicates the model does no better than simply taking the mean of the data, and negative values mean even worse models.

* _Remarks:_
    * For __high-bias models__, the performance of the model on the validation set is similar to the performance on the training set.

    * For __high-variance models__, the performance of the model on the validation set is far worse than the performance on the training set.

# Essential features of a Validation Curve:
* The training score is everywhere higher than the validation score. This is generally the case: the model will be a better fit to data it has seen than to data it has not seen.

* For very low model complexity (a high-bias model), the training data is underfit, which means that the model is a poor predictor both for the training data and for any previously unseen data.

* For very high model complexity (a high-variance model), the training data is overfit, which means that the model predicts the training data very well, but fails for any previously unseen data.

* For some intermediate value, the validation curve has a maximum. This level of complexity indicates a suitable trade-off between bias and variance.