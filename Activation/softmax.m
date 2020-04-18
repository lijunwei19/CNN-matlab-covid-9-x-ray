function [output] = softmax(x)
expo = exp(x);
expo_sum = sum(exp(x));
output = expo./expo_sum;
end
