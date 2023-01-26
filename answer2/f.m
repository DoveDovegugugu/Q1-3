function Enzyme = f(t, S_SE)

Einit = 1;
k1 = 100/60;
k2 = 600/60;
k3 = 150/60;

S = S_SE(1);
SE = S_SE(2);

Vs = -k1 .* (Einit - SE) .* S + k2 .* SE;
Vse = k1 .* S .* (Einit - SE) - (k2+k3) .* SE;
Enzyme = [Vs, Vse];

% S(i+1)  = S(i)  + (m1(1,1)+2*m2(1,1)+2*m3(1,1)+m4(1,1)) / 6;
%     SE(i+1) = SE(i) + (m1(2,1)+2*m2(2,1)+2*m3(2,1)+m4(2,1)) / 6;
%     E(i+1) = Einit - SE(i+1);
%     P(i+1) = P(i) + k3*h*SE(i);