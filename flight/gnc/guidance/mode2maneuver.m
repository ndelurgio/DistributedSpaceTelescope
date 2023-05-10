function [pseudoState, maneuverLocations] = mode2maneuver(mode, chiefOE, ROE, desiredInclination)
% Find the maneuver that suits the mode described by a pseudostate

pseudoState = zeros(6, 1);
maneuverLocations = [];

if mode == "formationBreak"
    nu = chiefOE(6);
    if abs(ROE(1)) > eps
        pseudoState(1) = -ROE(1);
        maneuverLocations = [maneuverLocations, nu];
    elseif abs(ROE(5) - desiredInclination(1)) > eps || abs(ROE(6) - desiredInclination(2)) > eps
        pseudoState(5) = desiredInclination(1);
        pseudoState(6) = desiredInclination(2);
        maneuverLocations = [maneuverLocations, nu];
    end
end
% TODO: other modes
