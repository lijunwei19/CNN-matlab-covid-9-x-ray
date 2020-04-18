function [output] = Tanh_prime(x)
output = 1-tanh(x).*tanh(x);
end

