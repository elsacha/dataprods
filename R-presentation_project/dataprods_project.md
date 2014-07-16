Developing Data Products - Course Project - Fuel consumption calculator
========================================================
author: Alexandre Gadebski
date: July 16, 2014

Presentation
========================================================

- This application computes the estimated fuel consumption of a car based on the number of cylinders (4, 6 or 8), weight (in pounds) and horse power entered by the user.

- The application uses linear regression and builds a model on the basis of the 'mtcars' data set.

- Then, this model is used to predict fuel consumption based on the parameters entered by the user.

- The estimated fuel consumption is displayed in:
    - miles per gallon (mpg - format used in North America)
    - litres per 100 kilometers (format used in Europe)


Building a linear model - regression formula
========================================================


```r
data(mtcars)
fit <- lm(mpg ~ wt + cyl + hp, data = mtcars)
summary(fit)$coef
```

```
            Estimate Std. Error t value  Pr(>|t|)
(Intercept) 38.75179    1.78686  21.687 4.799e-19
wt          -3.16697    0.74058  -4.276 1.995e-04
cyl         -0.94162    0.55092  -1.709 9.848e-02
hp          -0.01804    0.01188  -1.519 1.400e-01
```
Note: the code is presented without Shiny reactive tags.

Building a linear model - Observations
========================================================
- As we see, weight is the most significat parameter, with the number of cylinders
being moderately significant (p-value 9%) and horse power being insignificant (p-value 14%).

- We still keep the numbers of cylinders and horse power in our model for the possible
effect of collinearity.

Fuel consumption prediction
========================================================
- Then this model predicts the fuel consumption of a new car the parameters of which
  are entered by the user (in this example, number of cylinders = 6, weight = 2 thousand pounds, horse power = 150)


```r
 df <- data.frame(cyl = 6, wt = 2, hp = 150)
 pred <- predict(fit, newdata = df); pred
```

```
    1 
24.06 
```

- As weight, number of cylinders and horse power increase, the mpg decreases.
