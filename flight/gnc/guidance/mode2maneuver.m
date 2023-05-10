function pseudoState = mode2maneuver(mode, ROE, desiredInclination)
% Find the maneuver that suits the mode described by a pseudostate

pseudoState = zeros(6, 1);

if mode == "formationBreak"
    if abs(ROE(1)) > eps
        pseudoState(1) = -ROE(1);
    elseif abs(ROE(5) - desiredInclination(1)) > eps
        pseudoState(5) = desiredInclination(1);
    elseif abs(ROE(6) - desiredInclination(2)) > eps
        pseudoState(6) = desiredInclination(2);
    end
end
% TODO: other modes
