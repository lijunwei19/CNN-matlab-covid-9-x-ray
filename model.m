
clear all
addpath Activation\
addpath Layer\
addpath Loss\
addpath Network\

% creat test data  XOR operation
x_train = [0 0; 0 1; 1 0; 1 1];
y_train = [0; 1; 1; 0];

net = Network();
net.add(FCLayer(2, 3));
net.add(ActLayer(@Tanh, @Tanh_prime));
net.add(FCLayer(3, 1));
net.add(ActLayer(@Tanh, @Tanh_prime));

% train
learning_rate= 0.1;
epochs = 1000;

net.use(@Mean_Squared_Loss, @Mean_Squared_Loss_prime);
net.fit(x_train, y_train, epochs, learning_rate);


