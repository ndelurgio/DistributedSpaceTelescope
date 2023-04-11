function cartesianStateDerivative = cartesianPropagatorPerturbed(cartesianState_J2000,accelPerturbed_J2000_mps2,gravitationParameter_m3_s2)

cartesianStateDerivative = zeros(6,1);
cartesianStateDerivative(1:3,1) = cartesianState_J2000(4:6,1);

r = norm(cartesianState_J2000(1:3));
cartesianStateDerivative(4:6,1) = -gravitationParameter_m3_s2/r^3*cartesianState_J2000(1:3,1) + accelPerturbed_J2000_mps2;
end