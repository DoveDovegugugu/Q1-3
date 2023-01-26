clc;
clear;
close all;

step = 0.01;
t_length = 40;
t = 0:step:t_length;


k1 = 100/60;
k2 = 600/60;
k3 = 150/60;

Einit = 1;
S(1) = 10;
SE(1) = 0;
P(1) = 0;
E(1) = 0;

S_SE(1:2, length(t)+1) = 0;
S_SE(1,1) = 10;

for i = 1:length(t)-1
    m1 = step * f(t(i),S_SE(1:2,i));
    m2 = step * f(t(i)+step/2,S_SE(1:2,i)+m1/2);
    m3 = step * f(t(i)+step/2,S_SE(1:2,i)+m2/2);
    m4 = step * f(t(i)+step,S_SE(1:2,i)+m3);
    
    S_SE(1, i+1)  = S_SE(1, i)  + (m1(1)+2*m2(1)+2*m3(1)+m4(1)) / 6;
    S_SE(2, i+1) = S_SE(2, i) + (m1(2)+2*m2(2)+2*m3(2)+m4(2)) / 6;
    E(i+1) = Einit - S_SE(2, i+1);
    P(i+1) = P(i) + k3*step*S_SE(2, i);
end

S = S_SE(1,1:length(t));
SE = S_SE(2,1:length(t));
figure;  % 1st picture
plot(t,E,'LineWidth',3);
title('molarity of E');
xlabel('time/s');

figure;
plot(t,P,'LineWidth',3);
title('molarity of P');
xlabel('time/s');

figure;
plot(t,S,'LineWidth',3);
title('molarity of S');
xlabel('time/s');

figure;
plot(t,SE,'LineWidth',3);
title('molarity of SE');
xlabel('time/s');



    