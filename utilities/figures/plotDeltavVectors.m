% Plots the Delta V vector in RTN space

nonzero_indx_R = find(telem.("Data")(:, 1));
if isempty(nonzero_indx_R)
    deltaV_R = 0
else
    deltaV_R = telem.("Data")(nonzero_indx_R, 1)
end

nonzero_indx_T = find(telem.("Data")(:, 2));
if isempty(nonzero_indx_T)
    deltaV_T = 0
else
    deltaV_T = telem.("Data")(nonzero_indx_T, 2)
end

nonzero_indx_N = find(telem.("Data")(:, 3));
if isempty(nonzero_indx_N)
    deltaV_N = 0
else
    deltaV_N = telem.("Data")(nonzero_indx_N, 3)
end

figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
hold on
grid on
title("Delta V in T-R Plane")
plot(telem.("Data")(:, 2), telem.("Data")(:, 1))
scatter(deltaV_T, deltaV_R, 'blue', 'filled')
xlabel("\Delta v_T [m/s]")
ylabel("\Delta v_R [m/s]")
% xLimits = [min([0, deltaV_T]), max([0, deltaV_R])];
xLimits = [-0.02, 0.02];
axis([xLimits(1), xLimits(2), xLimits(1), xLimits(2)])

subplot(3, 1, 2)
hold on
grid on
title("Delta V in N-R Plane")
plot(telem.("Data")(:, 3), telem.("Data")(:, 1))
scatter(deltaV_N, deltaV_R, 'blue', 'filled')
xlabel("\Delta v_N [m/s]")
ylabel("\Delta v_R [m/s]")
xLimits = [-0.02, 0.02];
axis([xLimits(1), xLimits(2), xLimits(1), xLimits(2)])

subplot(3, 1, 3)
hold on
grid on
title("Delta V in T-N Plane")
plot(telem.("Data")(:, 2), telem.("Data")(:, 3))
scatter(deltaV_T, 0, 'blue', 'filled')
scatter(0, deltaV_N, 'blue', 'filled')
xlabel("\Delta v_T [m/s]")
ylabel("\Delta v_N [m/s]")
xLimits = [-0.02, 0.02];
axis([xLimits(1), xLimits(2), xLimits(1), xLimits(2)])
