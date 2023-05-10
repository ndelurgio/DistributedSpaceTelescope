function [pseudoState, maneuverLocations, maneuverFlag] = mode2maneuver(mode, chiefOE, ROE, desiredInclination, prev_maneuverFlag)
% Find the maneuver that suits the mode described by a pseudostate

pseudoState = zeros(6, 1);
maneuverLocations = zeros(50,1);
maneuverFlag = 0;

if prev_maneuverFlag == 1
    maneuverFlag = 1;
    return
end

if mode == "formationBreak"
    nu = chiefOE(6);
    if abs(ROE(1)) > eps
        pseudoState(1) = -ROE(1);
        maneuverLocations(1) = nu;
        maneuverFlag = 1;
    elseif abs(ROE(5) - desiredInclination(1)) > eps || abs(ROE(6) - desiredInclination(2)) > eps
        pseudoState(5) = desiredInclination(1);
        pseudoState(6) = desiredInclination(2);
        maneuverLocations(1) = nu;
        maneuverFlag = 1;
    end
end
% TODO: other modes
