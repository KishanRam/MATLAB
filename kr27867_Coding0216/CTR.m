global k1 k2 tau c0;
k1 = 0.5;
k2 = 0.2;
tau = 3;
c0 = [1 1 0 0];
ct = fsolve('matbalf',c0);
disp(ct);