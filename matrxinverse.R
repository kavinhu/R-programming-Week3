#Inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() return(x)
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() return(inv)
  return(list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse))
}

cacheSolve <- function(x, ...) {
  inverse <- makeCacheMatrix(x)$getInverse()
  if(!is.null(inverse)) {
    message("getting cached matrix data...")
    return(inverse)
  }
  matrix <- makeCacheMatrix(x)$get()
  inverse <- solve(matrix, ...)
  print(inverse)
  makeCacheMatrix(x)$setInverse(inverse)
  
}

A<-matrix(1:4,nrow=2,ncol=2)
cacheSolve(A)



