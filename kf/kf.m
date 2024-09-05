clc;
close all;
clear;

Z = (1:100);
noise = randn(1,100);
Z = Z + noise;

% % 初始化
X = [0, 0]';
F = [1 1; 0 1];
P = [1 0; 0 1];
Q = [0.0001 0; 0 0.0001];
% Q = [0.01 0; 0 0.01];
H = [1 0];
% R = 1;
R = 100;

figure;
hold on;



for i = 1:100

% 状态预测
    X_ = F*X;
    P_ = F*P*F' + Q;
% 状态更新    
    K = P_*H'/(H*P_*H'+R);
    innov(i) = Z(i) - H*X_;
    X = X_ + K*innov(i);
    P = (eye(2) - K*H)*P_;

    plot(X(1), X(2), '*');

end


xlabel('position');
ylabel('velocity');


