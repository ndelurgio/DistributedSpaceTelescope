function A = getMatrixA(OE, mu)

a = OE(1);
e = OE(2);
e_x = OE(2) * cos(OE(5));
e_y = OE(2) * sin(OE(5));
eta = sqrt(1 - e^2);
n = meanMotion(mu, a);

A = zeros(6,6);
A(2, 1) = -3/2 * n / eta^3;
A(3, 1) = -3/2 * e_y * n / eta^3;
A(4, 1) = 3/2 * e_x * n / eta^3;
end

