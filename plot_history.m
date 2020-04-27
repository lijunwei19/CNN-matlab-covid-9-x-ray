function plot_history(history)
a = history(1,:);
b = history(2,:);
plot(a, 'b')
hold on
plot (b, 'r')
xlabel('epochs')
ylabel('accuracy')
legend('val-acc','tr-acc')
end

