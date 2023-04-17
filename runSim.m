run('loadSimConfig.m');
out = sim('dynamics');

time = out.tout;
telem = extractTimetable(out.logsout);

% Save the updated timetable as a .dat file
writetimetable(telem, 'results/HW1/output_HW1.dat', 'Delimiter', '\t', 'FileType', 'text');
