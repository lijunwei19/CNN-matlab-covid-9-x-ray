function [output]= Mean_Squared_Loss_prime(y_true, y_pred)
output = 2*(y_pred- y_true)/length(y_true);
end

