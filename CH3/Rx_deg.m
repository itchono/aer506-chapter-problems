function R = Rx_deg(theta)
R = [1 0 0;
    0 cosd(theta) -sind(theta);
    0 sind(theta) cosd(theta)];
end