% Written by Jose Manuel Matsuda 10150406
% I verify that this is of my own work 
function [Bspace, Nspace] = a1(A,b);
%Augment the matrix with the result vector
augmented = [A,b];
%Find RREF
reduced = rref(augmented);
totalSize = size(reduced);
sizeOfA = size(A);
% Must go through matrix from bottom up 
% to find each part of the 'x'
% First base case where we know that the last "variable"
Bspace = zeros(totalSize(1),1); %make a vector to match the height of A
Bspace(totalSize(1)) = reduced(totalSize(1),totalSize(2));
% We can say the above because the rref is such that each
% leading co-efficient is one. totalSize(1) = bottommost vector value
% reduced(...) is the right most and bottommost value (last value in 'b')

% Reduce the size of the matrix because we already found the value in the
% bottom area
%recurse((totalSize(1)-1),totalSize(2),reduced,answer)
finished = false;
currentRow = (totalSize(1)-1); % Height of matrix go "up" matrix one row
total = 0;
while (finished == 0) % ie) while false
    % Must now go through the current row (not including the augmented b 
    % up until the pivot (1) and add em up  
    whichColumn = (sizeOfA(2)); % Width of matrix
    rowFinished = false;
    while (rowFinished == 0)
        if (whichColumn == currentRow) % You hit the pivot
            break;
        else
            total = total + (Bspace(whichColumn)*(A(currentRow,whichColumn)));
            whichColumn = whichColumn-1; % Move a column space to the left
        end
        total = 0; % Reset the total
    end % End going through the row
    Bspace(currentRow) = (reduced(currentRow,totalSize(2)) - total);
    % reduced(currentRow,totalSize(2)) --> The corresponding 'b'
    % Again we can do this because it changes into rref meaning leading
    % Co-effs are 1
    if (currentRow == 1) % We are at the top so cant go up further
        finished = true;
    else
        currentRow = currentRow - 1;
    end
end
disp('Bspace is')
disp(Bspace)
% Begin finding null space, useful link
% Look at http://www.math.odu.edu/~bogacki/cgi-bin/lat.cgi?c=null
% My way of finding a basis of the null space of the matrix is based off
% patterns found in the link above
% Checked with example solution given 

% Step 1) Reduce matrix A to RREF
% Step 2) The zero rows will have a solution of just 1
% Step 3) Non-zero rows will have a solution of the negative of the 
%         Negative value in the last column
Nspace = zeros(sizeOfA(1),1); % Instantiate the vector to be used later
zeroCounter = 0;
Arref = rref(A);
for whatRow = 1:sizeOfA(1) % Iterate through rows
    for whatColumn = 1:sizeOfA(2)
        if (Arref(whatRow,whatColumn) == 0)
           zeroCounter = zeroCounter + 1;
        end 
    end
    % Finish iterating through columns
    % If the number of columns = number of zeros, then you know that the
    % value at that row must be a '1' or anything else for that matter
    if (zeroCounter == sizeOfA(2))
        Nspace(whatRow) = 1;
        zeroCounter = 0;
    elseif (zeroCounter < sizeOfA(2)) % There was a one 
        Nspace(whatRow) = (-1) * Arref(whatRow,whatColumn);
        zeroCounter = 0;
    end
end 
disp('Nspace is');
disp(Nspace);
