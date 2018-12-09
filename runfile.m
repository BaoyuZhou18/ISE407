clear,clc

% % This script is the run file for the final project
% 
% % Set time record and correction examination variables
% t1 = zeros(3,1024);
% d1 = zeros(3,1024);
% 
% for i = 1:1024
%     i
%     for j = 1:3
%         A = gener(i,0,1,1);
%         [R,t] = cholesky(A,j);
%         t1(j,i) = t;
%         d1(j,i) = norm(A - R'*R);
%     end
% end

% % Set time record and correction examination variables
% t2 = zeros(3,1024,3);
% d2 = zeros(3,1024,3);
% 
% for i = 2:1024
%     i
%     for j = 1:3
%         for k = 1:3
%             cond = 10^k;
%             A = gener(i,0,2,cond);
%             [R,t] = cholesky(A,j);
%             t2(j,i,k) = t;
%             d2(j,i,k) = norm(A - R'*R);
%         end
%     end
% end

% Set time record and correction examination variables
t3 = zeros(3,1024,3);
d3 = zeros(3,1024,3);

for i = 2:1024
    i
    for j = 1:3
        for k = 1:3
            cond = 10^k;
            A = gener(i,0,3,cond);
            [R,t] = cholesky(A,j);
            t3(j,i,k) = t;
            d3(j,i,k) = norm(A - R'*R);
        end
    end
end

