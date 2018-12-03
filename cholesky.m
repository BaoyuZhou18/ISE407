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

% When opt == 1, doing basic linear algebra process
if opt == 1
    
    % Initial upper triangular matrix R
    R = zeros(n);
    
    % begin timer
    tic;
        
    R(1,1) = sqrt(A(1,1));
    R(1,2:n) = A(1,2:n)/R(1,1);
    R(2,2) = sqrt(A(2,2) - R(1,2)^2);
        
    for j = 1:n

        R(j,j) = sqrt(A(j,j) - R(1:j-1,j)'*R(1:j-1,j));
            
        for k = j+1:n
            R(j,k) = (A(j,k) - R(1:j-1,j)'*R(1:j-1,k))/R(j,j);
        end
            
    end
            
        
    % end timer
    toc;



% When opt == 2, doing Cholesk update process by using recursive functions
else if opt == 2
        




% When opt == 3, using MATLAB's own function 'chol()'
        else if opt == 3
    
            % begin timer
            tic;
            
            % use MATLAB's own function
            R = chol(A);
    
            % end timer
            toc;
    
        end
        
    end
    
end

end