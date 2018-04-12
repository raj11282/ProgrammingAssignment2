## The below program calculates the inverse of an invertible matrix. If the inverse of the
## matrix has already been calculated then the program reads the inverse from the cache and 
## prints it out. Otherwise it calculates the inverse, prints it out and stores in cache


## This function basically creates a list of 4 functions to set the value of the matrix, get
## the value of the matrix, set the inverse of the matrix and get inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(x)inverse <<- x
  getinverse <- function() inverse
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Below function calculates the inverse of the matrix created using the above function or 
## if the inverse has already been
## calculated, it reads the inverse from the cache and prints it out. It skips the computation 
## of the inverse if the inverse is found in cache. If it is not found, it calculates inverse
## and also stores it in cache 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse))
  {
    message ("Getting cached data")
    return(inverse)
  }
  data = x$get()
  inverse = solve(data)
  x$setinverse(inverse)
  inverse
}