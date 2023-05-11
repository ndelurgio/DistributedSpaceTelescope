function [pseudoState, maneuverLocations,n_cmds_out] = mode2maneuver(mode, chiefOE, ROE, desiredInclination,mode_data,n_cmds)
% Find the maneuver that suits the mode described by a pseudostate

pseudoState = zeros(6, 1);
maneuverLocations = zeros(50,1);

% if prev_maneuverFlag == 1
%     maneuverFlag = 1;
%     return
% end
n_cmds_out = n_cmds;
if mode == "formationBreak"
    % mode_data
    nu1 = mode_data.formationBreak(1) + deg2rad(0.5);
    nu2 = mode_data.formationBreak(2) - deg2rad(0.5);
    curr_nu = M2nu(chiefOE(6),chiefOE(2));
    if curr_nu <= nu1 && n_cmds == 0
        pseudoState(1) = -ROE(1);
        maneuverLocations(1) = nu1;
        n_cmds_out = n_cmds_out + 1;
    elseif curr_nu >= nu1 && curr_nu <= nu2 && n_cmds == 1
        pseudoState(5) = desiredInclination(1);
        pseudoState(6) = desiredInclination(2);
        maneuverLocations(1) = nu2;
        n_cmds_out = n_cmds_out + 1;
    end
end
% TODO: other modes
