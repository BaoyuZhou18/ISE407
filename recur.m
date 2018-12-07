function [R] = recur(A)

% check size of matrix A
n = size(A,1);

% check whether matrix A is 1*1 or not
if n == 1
    
    % if A is 1*1, solve the system easily
    R = sqrt(A);
    
else
    
    % if A is not 1*1, consider the submatrix and use Cholesky update to get the result
    A1 = A(1:n-1,1:n-1);
    
    % calculate Cholesky factorization for the submatrix
    R1 = recur(A1);
    
    % do the update process
    u = R1'\A(1:n-1,n);
    v = sqrt(A(n,n) - u'*u);
    R = [R1 u; zeros(1,n-1) v];
end
    



end