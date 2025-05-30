## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}
cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
# Create a special matrix object
m <- matrix(c(2, 2, 3, 4), 2, 2)
special_matrix <- makeCacheMatrix(m)

# Compute and cache the inverse
inv1 <- cacheSolve(special_matrix)
print(inv1)

# Retrieve the cached inverse
inv2 <- cacheSolve(special_matrix)
print(inv2)
