function [sunPosition,time] = generateSunEphemeris(t_epoch,t_final,time_step)

% CREATE SUN EPHEMERIS USING SPICE (Kernals:
% https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/aa_summaries.txt)
cspice_furnsh('kernals/de432s.bsp')
cspice_furnsh('kernals/naif0012.tls')

frame = 'ECLIPJ2000';
abcorr = 'NONE';
t_epoch = convertTo(t_epoch,'epochtime', 'Epoch','2000-01-01');
t_final = convertTo(t_final,'epochtime', 'Epoch','2000-01-01');
time = t_epoch:time_step:t_final;
[sunPosition,~] = cspice_spkezr('SUN',time,frame,abcorr,'EARTH');
sunPosition = sunPosition(1:3,:)*1000;
time = double(time - t_epoch);
end

