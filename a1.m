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
% Begin finding null space, useful link
% http://math.stackexchange.com/questions/598508/basis-of-a-null-space-of-a-matrix
% When finding the Null Space, ALWAYS reduce to Reduced Row Echelon Form (RREF). From There, it is just 
% finding the solution to Ax = 0. where x and zero are vectors.

% Or use this link http://math.stackexchange.com/questions/88301/finding-the-basis-of-a-null-space
% Augment A with zero vector then reduce to RREF
zeroVector = zeros(sizeOfA(1),1); % Make the zero vector using the height of 'A'
augmentZero = [A,zeroVector];
rrefAugZero = rref(augmentZero);
Nspace = zeros(sizeOfA(1),1); % Instantiate the thing to be used later

% Another way of doing this is to just take the rref of A, look for leading
% entries, any zero rows it doesnt matter what you put there (so say 1)
% for the ones that are have a one as the leading co -eff, take the
% negative of the other value (likely in the very last column)
% Look at http://www.math.odu.edu/~bogacki/cgi-bin/lat.cgi?c=null
disp('Nspace is');
disp(Nspace);


% If you use the following code (or re-use the above one) you get Null
% Space of zero
% Nspace = zeros(totalSize(1),1); %make a vector to match the height of A
% Nspace(totalSize(1)) = rrefAugZero(totalSize(1),totalSize(2));
% finished = false;
% currentRow = (totalSize(1)-1); % Height of matrix go "up" matrix one row
% total = 0;
% while (finished == 0) % ie) while false
%     % Must now go through the current row (not including the augmented b 
%     % up until the pivot (1) and add em up  
%     whichColumn = (sizeOfA(2)); % Width of matrix
%     rowFinished = false;
%     while (rowFinished == 0)
%         if (whichColumn == currentRow) % You hit the pivot
%             break;
%         else
%             total = total + (Nspace(whichColumn)*(A(currentRow,whichColumn)));
%             whichColumn = whichColumn-1; % Move a column space to the left
%         end
%         total = 0; % Reset the total
%     end % End going through the row
%     Nspace(currentRow) = (rrefAugZero(currentRow,totalSize(2)) - total);
%     if (currentRow == 1) % We are at the top so cant go up further
%         finished = true;
%     else
%         currentRow = currentRow - 1;
%     end
% end