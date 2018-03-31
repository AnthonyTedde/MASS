## Calling library

library(MASS)
library(purrr)
library(methods)

a <- 5
.Last.value

## Managing S objets
search()

###################################################
## Get the names hold in the current environment ##
###################################################

objects()
objects(2)
ls("package:MASS")


## List all object from all workspace

allNames <- map(search(), ls)

## attach and detach object.
## 1. Attach a database.
## 1.1 From a data.frame

df <- data.frame(lowerCase = letters[1:26], upperCase = LETTERS[1:26])
## Now the database is attach to the search path in order to access the variables in it directly:
attach(df)
lowerCase                               # It Works!
rm(list = 'df')
lowerCase
search()                                # The newly created DB appears as second items and can be directly removed by using
lowerCase <- "Create a variable lowerCase in the .GlobalEnv"
find("lowerCase")                       # It is now find at two different places.
conflicts()                             # Vector all possible conflicts between differents names.

map(conflicts(), find)

## How dealt with conflicts names.
lowerCase                               # It calls the one stored in the .GlobalEnv.
get("lowerCase", pos = 2)               # calls the one at position 2.

environment <- find("lowerCase", numeric = T)          # Numeric TRUE give the number identifying the environment
map(environment, ~ get("lowerCase", pos = .x ))

#######################
## More on S objects ##
#######################

l <- list(a = letters[1:26])
l <- list(a = LETTERS[1:26])
ls()

## Concatenation

l <- list(a = letters[1:4])
L <- list(a = LETTERS[1:4])

c(l, L)
c(l, L, recursive = T)

## Coercion
v <- structure(1:26, names = letters[1:26])
is.vector(v)                            # Surprisingly it returns true.
names(v)



##################################
## 3.3 Arithmetical Expressions ##
##################################
page 47 - (56)
