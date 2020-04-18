classdef ActLayer <Layer

    properties
        activation
        activation_prime
    end
    
    methods
        function obj = ActLayer(activation,activation_prime)
            obj.activation = activation;
            obj.activation_prime = activation_prime;
        end
        
        function output = forward_propagation(obj,input_data)
            obj.input = input_data;
            obj.output = obj.activation(obj.input);
            output = obj.output;
        end
        
        function input_error = backward_propagation(obj, output_error, learning_rate)
            input_error = obj.activation_prime(obj.input).*output_error;
        end
        
    end
end

