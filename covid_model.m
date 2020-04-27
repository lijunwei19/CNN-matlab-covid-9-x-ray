
clear all
close all
addpath Activation\
addpath Layer\
addpath Loss\
addpath Network\

% load data for training total 
load('res_features.mat')
load('res_labels.mat')

% shuffle data 
index= randperm(numel(res_labels));
res_features = res_features(index, :);
res_labels = res_labels(index,:);


% 80% training , 20% validation
num = int16(numel(res_labels)/5*4);
x_tr = res_features(1:num, :);
y_tr = res_labels(1:num, :);

x_val = res_features(num+1:end,:);
y_val = res_labels(num+1: end,:);

[m,d] = size(x_tr);

net = Network();
net.add(FCLayer(25088, 512));
net.add(ActLayer(@Tanh, @Tanh_prime));
net.add(FCLayer(512, 1));
net.add(ActLayer(@Tanh, @Tanh_prime));

% train
learning_rate= 0.0005;
epochs = 40;

net.use(@Mean_Squared_Loss, @Mean_Squared_Loss_prime);
hisroty = net.fit(x_tr, y_tr, x_val, y_val, epochs, learning_rate);

%plot 
plot(history(1,:))
hold on
plot (history(2,:))
xlabel('epochs')
ylabel('accuracy')

