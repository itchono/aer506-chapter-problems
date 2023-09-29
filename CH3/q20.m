% Compute a net inertia tensor of cylinder + rod, figure out which axes are
% stable as a result
m_cylinder = 300;
h_cylinder = 1;
r_cylinder = 0.5;
m_rod = 30;
l_rod = 2;

I_cylinder = diag([1/12 * m_cylinder * h_cylinder^2 + 1/4 * m_cylinder * r_cylinder^2; ...
                   1/12 * m_cylinder * h_cylinder^2 + 1/4 * m_cylinder * r_cylinder^2; ...
                   1/2 * m_cylinder * r_cylinder^2]);

I_rod = 1/12 * m_rod * l_rod^2 * diag([1; 0; 1]);

I_total = I_rod + I_cylinder
% I1 is largest, so it is the only stable one, so x.