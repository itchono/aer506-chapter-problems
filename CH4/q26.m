% GIVENS
m_2 = 5.972e24;  % Earth
m_1 = 1.9891e30; % Sun
r_12 = 1.495978707e11;

pi_1 = m_1 / (m_1 + m_2);
pi_2 = m_2 / (m_1 + m_2);

% Function to solve for L1, L2, L3 (in a straight line)
f = @(xi) (1-pi_2) .* (xi + pi_2) ./ abs(xi + pi_2).^3 + pi_2 .* (xi + pi_2 - 1) ./ abs(xi + pi_2 - 1).^3 - xi;

% One solution will be positive and greater than x_2 (L2; beyond Earth)
% One solution will be positive and less than x_2 (L1; between CG and Earth)
% One solution will be negative (L3; on opposite side of CG)

% xi = x/r_12, so choose: L1 -> xi = 0.9, L2 -> xi = 1.1, L3 -> x = -1

xi_L1 = fzero(f, 0.9);
xi_L2 = fzero(f, 1.1);
xi_L3 = fzero(f, -1);

x_L1 = xi_L1 * r_12
x_L3 = xi_L2 * r_12
x_L3 = xi_L3 * r_12



