## Saving informations about my matrix...

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
     set <- function(y) {
       x <<- y
       m <<- NULL
       }
     get <- function() {x}
     setsolve <- function(inversa) {m <<- inversa}
     getsolve <- function() m
     list(set = set, get = get,
          setsolve = setsolve,
          getsolve = getsolve)
}


##Creating a matrix and applying the function above

a <- makeCacheMatrix(rbind(c(1, -1/4), c(-1/4, 1)))
a

## Creating and appling solve function

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve
  m  ## Return a matrix that is the inverse of 'x'
}
cacheSolve(a)

