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

% xi = x/r_12, so choose: L1 -> xi = [0, 0.9999], L2 -> xi = [1.0001, 2], L3 -> x = -1

xi_L1 = fzero(f, [0, 0.9999]);
xi_L2 = fzero(f, [1.0001, 2]);
xi_L3 = fzero(f, -1);

x_L1 = xi_L1 * r_12
x_L2 = xi_L2 * r_12
x_L3 = xi_L3 * r_12

% for fun, L4 and L5
pos_L4 = [r_12 / 2 - pi_2 * r_12; sqrt(3)/2 * r_12];
pos_L5 = [r_12 / 2 - pi_2 * r_12; -sqrt(3)/2 * r_12];


plot(-pi_2 * r_12, 0, "ko")
hold on
plot(pi_1 * r_12, 0, "bo")
plot(x_L1, 0, "go")
plot(x_L2, 0, "go")
plot(x_L3, 0, "go")
plot(pos_L4(1), pos_L4(2), "go")
plot(pos_L5(1), pos_L5(2), "go")

% Lines
plot([pos_L4(1), -pi_2 * r_12, pos_L5(1), pi_1 * r_12, pos_L4(1)],...
    [pos_L4(2), 0, pos_L5(2), 0, pos_L4(2)], "r--")
plot([x_L3, pi_1 * r_12], [0, 0], "r--")
grid

legend("Sun", "Earth", "L1", "L2", "L3", "L4", "L5")
