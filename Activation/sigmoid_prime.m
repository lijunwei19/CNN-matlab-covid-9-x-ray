function [output] = sigmoid_prime(x)
a = sigmoid(x);
output = a.*(1-a);
end
