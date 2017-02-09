% Written by Jose Manuel Matsuda 10150406
% I verify that this is of my own work 
function [Bspace, Nspace] = a1(A,b)
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
Nspace = [1];
% % Void function that just affects answer
% function recurse(height,width,matrix,resultVector)
% % Answer the "bottommost" one
% % Go in a loop to go through the row --> work from right to left
% % Right to left because the leftmost values would be zero (rref)
% n = width - 1; % This is correct
% total = 0
% while n > height
%     % Just height because we are looking at square matrices and the values
%     % affected by back substitution are only up to the pivots take for
%     % example in a 4x4 for val (2,2) -which is y- you need to look at (2,3)
%     % and (2,4) and use their values to get your "y"
%     total = total + resultVector(n)*matrix(height,n) % Stay at the current
%     % row, just go down to the left
%     n = n-1 % Increment
% end
% % Take the right most and bottom most (that is the "b") and subtract
% % whatever you got as the total and set that to that part in the "x" vector
% % Like before, leading co-efficient is one so you can just set it
% answer(height) = (matrix(height,width) - total)
% %Recurse with one row taken from the bottom (so from 3 to 2)
% recurse((height-1), width,matrix,answer)