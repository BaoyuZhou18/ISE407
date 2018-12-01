function [R] = cholesky(n,seed,opt)
% This function is for testing performance of different methods for calculating cholesky factorization
% Input      n    : dimension size for matrices
%            seed : random seed number
%            opt  : option choice for method used
%                   When opt == 1, doing basic linear algebra process
%                   When opt == 2, doing Cholesk update process by using recursive functions
%                   When opt == 3, using MATLAB's own function 'chol()'
% Output     R    : an upper triangular matrix satisfying R'*R = A
%            t    : time used for getting R from A

% Set random seed
rng(seed);

% Set random square matrix A, which is symmetric positive definite
A = rand(n);
A = A'*A;



% When opt == 3, using MATLAB's own function 'chol()'
if opt == 3
    
    % begin timer
    tic;
    
    R = chol(A);
    
    % end timer
    toc;
    
end

end