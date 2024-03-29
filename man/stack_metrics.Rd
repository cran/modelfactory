% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/combine.R
\name{stack_metrics}
\alias{stack_metrics}
\title{Combine model metrics for n number of lm, glm, and lmer models}
\usage{
stack_metrics(...)
}
\arguments{
\item{...}{lm, glm, or lmer models to summarize and combine.}
}
\value{
A \code{\link[=tibble]{tibble()}} that includes a variety of evaluation metrics.
}
\description{
\code{stack_metrics()} calculates basic model metrics like MSE for the models
passed in, then stacks them in a dataframe for comparison. This supports
lm, glm, and lmer models, and different metrics are calculated for each.
This does not perform model selection based on a given criteria, but it
makes the tedious task of, say, comparing R-squared across several models
very easy.
}
\examples{
# lm example -------------------------------------------
lm_1 = lm(mpg ~ cyl + disp + hp, data = mtcars)
lm_2 = lm(mpg ~ hp + drat + wt, data = mtcars)
lm_3 = lm(mpg ~ ., data = mtcars)
lm_combined = stack_metrics(lm_1, lm_2, lm_3)
lm_combined

# glm example ------------------------------------------
glm_1 = glm(vs ~ drat + hp, data = mtcars)
glm_2 = glm(vs ~ wt + qsec, data = mtcars)
glm_3 = glm(vs ~ ., data = mtcars)
glm_combined = stack_metrics(glm_1, glm_2, glm_3)
glm_combined

# lme4 example -----------------------------------------
lmer_1 = lme4::lmer(Sepal.Length ~ (1 | Species), data = iris)
lmer_2 = lme4::lmer(Sepal.Length ~ (1 | Species) + Petal.Length, data = iris)
lmer_combined = stack_metrics(lmer_1, lmer_2)
lmer_combined
}
