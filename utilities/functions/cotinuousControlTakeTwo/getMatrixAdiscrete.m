function Ad = getMatrixAdiscrete(OE,mu,dt)

A = getMatrixA(OE,mu);
Ad = eye(6) + dt*A;

end

