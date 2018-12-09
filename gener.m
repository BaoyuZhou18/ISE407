function [A] = gener(n,seed,opt,cond)
% This function is for generating testcases for calculating cholesky factorization
% Input      n    : dimension size for matrices
%            seed : random seed number
%            opt  : option choice for method used
%                   When opt == 1, doing basic random generation
%                   When opt == 2, doing random generation with specific condition number and eigenvalues with same ratio
%                   When opt == 3, doing random generation with specific condition number and eigenvalues with same difference
%            cond : condition number for matrix A
% Output     A    : a symmetric positive definite matrix for doing Cholesky factorization

% Set random seed
rng(seed);

% When opt == 1, doing basic random generation
if opt == 1
    
    % generate random symmetric positive definite matrix A
    A = randn(n);
    A = A'*A;
 
% When opt == 2, doing random generation with specific condition number and eigenvalues with same ratio
else if opt == 2
        
        % generate random symmetric positive definite matrix A
        A = randn(n);
        A = A'*A;
        
        % do eigendecomposition process for A
        [V,D] = eig(A);
        
        % Set eigenvalues vector
        value = zeros(1,n);
        for i = 1:n
            value(i) = cond^((i-1)/(n-1));
        end
        
        % update matrix D
        D = diag(value);
        
        % update matrix A with specific condition number
        A = V*D*V';
    
    % When opt == 3, doing random generation with specific condition number and eigenvalues with same difference    
    else if opt == 3
            % generate random symmetric positive definite matrix A
            A = randn(n);
            A = A'*A;
        
            % do eigendecomposition process for A
            [V,D] = eig(A);
        
            % Set eigenvalues vector
            value = zeros(1,n);
            for i = 1:n
                value(i) = 1 + (i-1) * (cond-1)/(n-1);
            end
        
            % update matrix D
            D = diag(value);
        
            % update matrix A with specific condition number
            A = V*D*V';
            
        end
    end
end
        
        


end