## Functions for caching the inverse of a matrix

## Usage:
## source("cachematrix.R")
## matrixObject <- makeCacheMatrix()
## my_matrix <- matrix(rnorm(9), 3, 3)
## matrixObject$set(matrixObject)
## cacheSolve(matrixObject)
## cacheSolve(matrixObject)

## Comment: Input matrix is assumed to be square and invertible

## use makeCacheMatrix to create your matrix, then set the matrix object before 
## calling cacheSolve() on the matrix you created

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function(){
    x
  }
  setinv <- function(inv){
    m <<- inv
  }
  getinv <- function(){
    m
  }
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)){
    message("getting cached value")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinv(m)
  m
}
