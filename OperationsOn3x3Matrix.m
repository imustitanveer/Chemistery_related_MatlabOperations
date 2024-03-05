% Operations on a 3x3 Matrix
A = [4, 3, 5; 2, 5, 8; 6, 3, 9];  % The Matrix

% Intercharge Column 2 and 3
A(:, [2, 3]) = A(:, [3, 2]);

% Transpose 
B = A';

% Adding all Columns 
columnSum = sum(A);

% Adding all Rows 
rowSum = sum(A, 2);

% Add Numbers Diagonally 
diagonalSum = sum(diag(A));

