function sunPos = getSunPosition(sunPosData,timeData,t)

sunPosX = interp1(timeData,sunPosData(1,:),t);
sunPosY = interp1(timeData,sunPosData(2,:),t);
sunPosZ = interp1(timeData,sunPosData(3,:),t);

sunPos = [sunPosX, sunPosY, sunPosZ];

end

