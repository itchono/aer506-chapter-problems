I_G = [10 0 0; 0 20 0; 0 0 30];
[w, dw] = omega(3);
net_torque_cm = I_G * dw + cross(w, I_G * w);


disp(net_torque_cm)
disp(norm(net_torque_cm))

function [w, dw] = omega(t)
    w = [2.*t.^2; 4; 3.*t];
    dw = [4.*t; 0; 3];

end
