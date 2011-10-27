function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h_x = sigmoid(X*theta);
temp1 = -1.*y.*log(h_x) - (1-y).*log(1 - h_x);
J = (1./m)*sum(temp1) +  (lambda/(2*m))*( sum(theta.^2) - theta(1)^2);

temp2 = h_x - y;
grad(1) = sum(temp2.*X(:,1))./m;
for i=2:size(theta,1)
	grad(i) = ( sum(temp2.*X(:,i)) + lambda*theta(i) )./m;
end

% =============================================================

end
