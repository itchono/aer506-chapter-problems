G_G_I = [10 0 0; 0 20 0; 0 0 30];
[G_omega_IG, G_dI_omega_IG] = omega(3);
net_torque_cm = G_G_I * G_dI_omega_IG + cross(G_omega_IG, G_G_I * G_omega_IG);

disp(net_torque_cm)
disp(norm(net_torque_cm))

function [w, dw] = omega(t)
    w = [2.*t.^2; 4; 3.*t];
    dw = [4.*t; 0; 3];

end
