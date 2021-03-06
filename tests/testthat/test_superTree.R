context("superTree")

tree <- rtree(50, rooted=FALSE)

trees_simple <- nni(tree)

trees <- rNNI(tree, sample(10, 100, replace = TRUE))
trees <- .uncompressTipLabel(trees)
labels <- paste0("t", 1:50)
trees <- lapply(trees, function(x)drop.tip(x, sample(labels, 10)))
class(trees) <- "multiPhylo"

test_that("superTree", {
    ## check superTree
    skip_on_cran()
    simple_superTree <- superTree(trees_simple, rooted=FALSE)
    difficult_superTree <- superTree(trees, rooted=FALSE)
    expect_equal(RF.dist(simple_superTree, tree) , 0)
    expect_equal(RF.dist(difficult_superTree, tree) , 0)
})



