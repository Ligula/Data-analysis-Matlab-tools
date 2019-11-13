figure

top = subplot(1,3,1);
plot(StandData(:,1), StandData(:,5), '.', 'MarkerFaceColor','red');
title(top, "Standardized Data");
xlabel('Temperature')
ylabel('Humidity')

bottom = subplot(1,3,2);
plot(Data(:,1), Data(:,5), '.');
title(bottom, 'Source Data');
xlabel('Temperature')
ylabel('Humidity')

middle = subplot(1,3,3);
plot(NormData(:,1), NormData(:,5), '.');
title(middle, 'Normalized Data');
xlabel('Temperature')
ylabel('Humidity')