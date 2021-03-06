library(rpart) #classification and regression trees
library(partykit) #treeplots
library(MASS) #breast and pima indian data
library(ElemStatLearn) #prostate data
library(randomForest) #random forests
library(xgboost) #gradient boosting 
library(caret) #tune hyper-parameters

data(biopsy)
biopsy <- biopsy[, -1]
names(biopsy) <- c("thick", "u.size", "u.shape", "adhsn", "s.size",
                     "nucl", "chrom", "n.nuc", "mit", "class")
biopsy.v2 <- na.omit(biopsy)
set.seed(123) #random number generator
ind <- sample(2, nrow(biopsy.v2), replace = TRUE, prob = c(0.7, 0.3))
biop.train <- biopsy.v2[ind == 1, ] #the training data set
biop.test <- biopsy.v2[ind == 2, ] #the test data set
str(biop.test)

set.seed(123)
tree.biop <- rpart(class ~ ., data = biop.train)
tree.biop$cptable
cp <- min(tree.biop$cptable[3, ])
prune.tree.biop = prune(tree.biop, cp <- cp)
# plot(as.party(tree.biop))
plot(as.party(prune.tree.biop))
rparty.test <- predict(prune.tree.biop, newdata = biop.test,
                       type = "class")
table(rparty.test, biop.test$class)

