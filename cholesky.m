function [R,t] = cholesky(A,opt)
% This function is for testing performance of different methods for calculating cholesky factorization
% Input      A    : a symmetric positive definite matrix
%            opt  : option choice for method used
%                   When opt == 1, doing basic linear algebra process
%                   When opt == 2, doing Cholesk update process by using recursive functions
%                   When opt == 3, using MATLAB's own function 'chol()'
% Output     R    : an upper triangular matrix satisfying R'*R = A           
%            t    : time used for getting R from A


% Calculate dimension size of A
n = size(A,1);

% When opt == 1, doing basic linear algebra process
if opt == 1
    
    % Initial upper triangular matrix R
    R = zeros(n);
    
    % begin timer
    tic;
        
    for j = 1:n

        R(j,j) = sqrt(A(j,j) - R(1:j-1,j)'*R(1:j-1,j));
            
        for k = j+1:n
            R(j,k) = (A(j,k) - R(1:j-1,j)'*R(1:j-1,k))/R(j,j);
        end
            
    end
            
        
    % end timer
    t = toc;



% When opt == 2, doing Cholesk update process by using recursive functions
else if opt == 2
        
        % begin timer
        tic;
        
        % use Cholesky recursive update process
        R = recur(A);
        
        % end timer
        t = toc;

% When opt == 3, using MATLAB's own function 'chol()'
        else if opt == 3
    
            % begin timer
            tic;
            
            % use MATLAB's own function
            R = chol(A);
    
            % end timer
            t = toc;
    
        end
        
    end
    
end

end