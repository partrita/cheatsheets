= SHAP (SHapley Additive exPlanations)

SHAP (SHapley Additive exPlanations) is a game theoretic approach to explain the output of any machine learning model. It connects optimal credit allocation with local explanations using the classic Shapley values from game theory and their related extensions.

== Links
- GitHub: https://github.com/shap/shap
- Documentation: https://shap.readthedocs.io/

== Installation

To install the latest version of the shap package, use pip:
`pip install shap`

== Usage

The basic idea behind SHAP is to use Shapley values to explain the output of a machine learning model. The Shapley value is the average marginal contribution of a feature value over all possible coalitions.

Here is a simple example of how to use SHAP to explain a single prediction:
```python
import shap
import sklearn

# train a model
X_train, X_test, y_train, y_test = sklearn.model_selection.train_test_split(*shap.datasets.iris(), test_size=0.2, random_state=0)
model = sklearn.ensemble.RandomForestClassifier(n_estimators=100)
model.fit(X_train, y_train)

# create a SHAP explainer
explainer = shap.TreeExplainer(model)

# explain a single prediction
shap_values = explainer.shap_values(X_test[0])
shap.initjs()
shap.force_plot(explainer.expected_value[0], shap_values[0], X_test[0])
```

== Main concepts
- *Shapley value*: The average marginal contribution of a feature value over all possible coalitions.
- *SHAP value*: The Shapley value of a feature for a specific prediction.
- *Explainer*: A class that can explain the predictions of a model.
- *Explanation*: An object that contains the SHAP values for a set of predictions.

== Types of explainers
- *TreeExplainer*: For tree-based models like Random Forest and XGBoost.
- *DeepExplainer*: For deep learning models.
- *KernelExplainer*: For any model, but it is slower than the other explainers.
- *LinearExplainer*: For linear models.
- *GradientExplainer*: For models with differentiable loss functions.

== Plots
- *force_plot*: Visualize a single prediction.
- *summary_plot*: Visualize the SHAP values for a set of predictions.
- *dependence_plot*: Visualize the effect of a single feature on the model output.
- *waterfall_plot*: Visualize the SHAP values for a single prediction in a waterfall plot.
- *beeswarm_plot*: Visualize the SHAP values for a set of predictions in a beeswarm plot.
