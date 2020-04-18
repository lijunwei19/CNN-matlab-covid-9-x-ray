function [output]= Mean_Squared_Loss(y_true, y_pred)
sub = y_true-y_pred;
output = mean(sub.*sub);
end

