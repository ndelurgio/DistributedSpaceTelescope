function Bd = getMatrixBdiscrete(OE,mu,dt)
% ASSUMES CONSTANT CONTROL INPUT OVER DT
B = getMatrixB(OE,mu);
A = getMatrixA(OE,mu);
Bd = (eye(6) + 0.5*dt^2*A)*B;
end

