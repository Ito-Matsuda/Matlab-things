# Matlab-things
Pls no this is for CISC 271 (I just wanted to back it up)

Description of Assignment

As described in the course notes, and text, a linear equation of the form A~x = ~b can have
more than one solution. The notes discuss these as the sum of a basic solution from the
bound variables plus solutions from the null space of the matrix.
Write a Matlab function as a file a1.m that has as its first line
function [Bspace, Nspace] = a1(A, b)
The function takes as input a matrix A and a vector ~b. You can assume, without checking,
that the matrix A is square (size m × m) and that the vector ~b has the correct number of m
entries. The test suite will ensure that m ≥ 1, so absurd inputs will not be used. The test
suites will also be small, with m ≤ 10, so memory or speed will not be causes for concern.
Your code must return two values: the basic solution as a column vector Bspace and the
null solution as a matrix Nspace; the columns of Nspace are a basis of the null space of
the matrix A.
To implement your function, you may or may not find it useful to use auxiliary or “helper”
functions. You must include all necessary helper function as individual m-files in the zip
file. If your code does not run the first time, you will not receive a warning and will be
assigned a failing mark.
You should verify that your code returns a complete and correct result. By correct, we mean
that when A operates on Bspace plus any vector in Nspace, the result is numerically very
close to ~b. (The instructor recommends using random weights of null-space vectors to test
the output of your code.)
By complete, we mean that there is no solution that is not specified as the linear combination
of the basic solution and some vector from the null space.
