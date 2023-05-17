trajLengths = [50, 100, 150, 200, 250];
maxAccels = [4.2e-05*10, 4.2e-05*20, 4.2e-05*30, 4.2e-05*40, 4.2e-05*50];

deltaVs = zeros(length(trajLengths), length(maxAccels));

for i = 1:length(trajLengths)
    for j = 1:length(maxAccels)
        trajectoryLength = trajLengths(i);
        aMax = maxAccels(j);
        [cvx_optval, ~, dv] = simpleTrajectoryCVX(trajectoryLength, aMax, deputyROE, chiefOE);
        if isnan(cvx_optval)
            deltaVs(i, j) = Inf;
        else
            deltaVs(i, j) = dv;
        end
    end
end

imagesc(deltaVs);
% colormap('jet');
colorbar;

% Set axis labels
xticks(1:length(maxAccels));
yticks(1:length(trajLengths));
xticklabels(maxAccels);
yticklabels(trajLengths);

