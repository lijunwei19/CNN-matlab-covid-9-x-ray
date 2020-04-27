function [accuracy] = test_model(model_name)
    load(model_name);
    load test_features.mat
    load test_labels.mat
    pre_val_y = net.predict(res_features);
    accuracy = sum(sign(pre_val_y)==res_labels)/numel(res_labels);    
end