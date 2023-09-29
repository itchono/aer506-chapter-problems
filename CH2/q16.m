% Frames
% {G} body-fixed
% {O} inertial

[G_v_G, G_dG_v_G] = velocity(2);
[G_omega_OG, G_dG_omega_OG] = angular_velocity(2);

% take derivative of velocity wrt frame G (because that's what we express
% in)
G_dI_v_G = G_dG_v_G + cross(G_omega_OG, G_v_G);

disp(G_dI_v_G)
disp(norm(G_dI_v_G))


function [G_v_abs, G_a_abs] = velocity(t)
    G_v_abs = [t.^3; 4; 0];
    G_a_abs = [3.*t.^2; 0; 0];
end


function [G_omega_OG, G_d_omega_OG] = angular_velocity(t)
    G_omega_OG = [0; 0; 2.*t.^2];
    G_d_omega_OG = [0; 0; 4.*t];
end