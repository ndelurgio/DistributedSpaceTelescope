function y_imu = imuMeasurement(d_SRP,a_control,b,R)

rng('default');
y_imu = d_SRP + a_control + b + mvnrnd([0;0;0],R)';

end

