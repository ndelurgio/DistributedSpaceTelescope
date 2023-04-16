out = sim('dynamics');

time = out.tout;
telem = extractTimetable(out.logsout);