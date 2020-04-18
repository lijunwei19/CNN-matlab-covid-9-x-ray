classdef Network <handle

    properties
        layers={}
        loss=[]
        loss_prime=[]
    end
    
    methods
        %% add layer
        function obj = add(obj,layer)
            obj.layers{end+1}= layer;        
        end
        
        %% use method
        function obj = use(obj, loss, loss_prime)
           obj.loss = loss;
           obj.loss_prime = loss_prime;
        end
        
        
        %% Predite
        function result = predict(obj, input_data)
            samples = size(input_data,1);
            result =[];
            
            for i=1:samples
                output = input_data(i,:);
                for j=1:length(obj.layers)
                    layer = obj.layers{j};
                    output = layer.forward_propagation(output);      
                end
                result(i) = output;
            end
            return
        end
            
        %% Training the network
        function history = fit(obj, x_train, y_train, epochs, learning_rate)
            m = size(x_train,1);
           
            for i= 1: epochs
                err =0;
                for j=1:m
                    output = x_train(j,:);
                    for k=1:length(obj.layers)
                        layer = obj.layers{k};
                        output = layer.forward_propagation(output);
                    end

                    % compute loss (for display purpose only)
                    err = err + obj.loss(y_train(j), output);

                    % backward propagation
                    error = obj.loss_prime(y_train(j), output);
                    for k = length(obj.layers):-1:1
                        layer = obj.layers{k};
                        error = layer.backward_propagation(error, learning_rate);
                    end

                    % calculate average error on all samples
                    err= err/m;
              
                end
             
                printString = ['epoch',num2str(i),'/',num2str(epochs),'--------------','error=',num2str(err)];
                disp(printString)
            end
        end

                        
          
        
    end
end

