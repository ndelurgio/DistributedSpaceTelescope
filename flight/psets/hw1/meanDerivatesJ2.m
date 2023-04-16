function doeVector = meanDerivatesJ2(oeVector, J2, Re, n)

a = oeVector(1);
e = oeVector(2);
i = oeVector(3);

da = 0;
de = 0;
di = 0;
ratioR = (Re / a / (1 - e^2))^2; % Intermediate value
dOm = -3/2 * n * J2 * ratioR * cos(i);
dw = 3/4 * n * J2 * ratioR * (5 * cos(i)^2 - 1);
dM = n + 3/4 * n * J2 * ratioR * sqrt(1 - e^2) * (3 * cos(i)^2 -1);

doeVector = [da, de, di, dOm, dw, dM];

end