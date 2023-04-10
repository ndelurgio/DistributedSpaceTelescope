out = sim('simulation');

time = out.tout;
telem = extractTimetable(out.logsout);