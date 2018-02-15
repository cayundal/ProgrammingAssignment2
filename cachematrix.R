## Example procedure adapted to solve function and matrix object. Only works on 3x3 matrices.

## same structure as vector but adapted for matrix object

makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(solve) i <<- solve
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)

}


## Again, the code is adapted to the solve function and matrix object.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  i <- x$getinv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  n = nrow(data)
  b<-diag(,n)
  i <- solve(data, b, ...)
  x$setinv(i)
  i
  
}
