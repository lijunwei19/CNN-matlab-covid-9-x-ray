
clear all
addpath Activation\
addpath Layer\
addpath Loss\
addpath Network\

% creat test data  XOR operation
x_train = [0 0; 0 1; 1 0; 1 1];
y_train = [0; 1; 1; 0];

net = Network();
net.add(FCLayer(25088, 512));
net.add(ActLayer(@Tanh, @Tanh_prime));
net.add(FCLayer(512, 1));
net.add(ActLayer(@Tanh, @Tanh_prime));

% train
learning_rate= 0.0005;
epochs = 100;

net.use(@Mean_Squared_Loss, @Mean_Squared_Loss_prime);
net.fit(x_train, y_train, epochs, learning_rate);
pre_y= net.predict(x_val);



