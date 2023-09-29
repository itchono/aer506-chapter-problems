syms theta d_theta d w N

% Frames: {O} - spacecraft, {S} - solar panel
% {S} shall have its origin coincident with {O}

%% Velocity
O_omega_IO = [0; 0; N];
O_omega_OS = [0; -d_theta; 0];

O_omega_IS = O_omega_OS + O_omega_IO;

O_r_S = [cos(theta), 0, -sin(theta);
        0 1 0;
        sin(theta), 0, cos(theta)];
S_rho_SA = [0; d; w/2];
O_rho_SA = O_r_S * S_rho_SA;

O_v_S = simplify(cross(O_omega_IS, O_rho_SA), "Steps", 10)

%% Find acceleration of panel
% it's always just differentiating the last frame's rate wrt inertial
% I think it's because the particle is in the last frame
O_d_omega_OS = cross(O_omega_IO, O_omega_OS);

O_a_S = simplify(cross(O_d_omega_OS, O_rho_SA) + cross(O_omega_IS, cross(O_omega_IS, O_rho_SA)), "Steps", 10)