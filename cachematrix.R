## Written on July 9, 2014
## R Programming on Coursera

## These two functions cache an inverted matrix in order to same time and
## memory. Inputed matrices are assumed to be invertible.

## This is an extremely simple programming assignment that is closely
## modelled by the example for caching the mean of a vector. The example
## utilizes a vector, but the code is written in such a way that a vector
## can be easily replaced by a matrix. Then, rather than the mean function,
## I utilized the solve function. Otherwise, the program below and the example
## are identical program.

## The first function, makeCacheMatrix, creates a list of functions that
## sets the matrix, gets the matrix, sets the inverted matrix, and gets the
## inverted matrix.

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  
  set <- function(y) {
    
    x <<- y
    m <<- NULL
    
  }
  
  get <- function() x
  
  setsolve <- function(solve) m <<- solve
  
  getsolve <- function() m
  
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
  
}

## The second function inverts the matrix created by makeCacheMatrix.
## If the matrix has already been inverted, the functions gets it from
## the cache. If not, then it inverts the matrix and sets it into cache.

cacheSolve <- function(x, ...) {

  m <- x$getsolve()
  
  if(!is.null(m)) {
    
    message("getting cached data")
    return(m)
    
  }
  
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)

  m
  
}
