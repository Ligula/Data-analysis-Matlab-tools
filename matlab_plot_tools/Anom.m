function outliers = anom(Data_stand);

outliers = find(Data_stand > 3 | Data_stand < -3);

 
figure
subplot(1,1,1)
plot(Data_stand(:,2), Data_stand(:,4), 'o')
hold on
plot(outliers, 'ro')
legend('Standard Data');
title('Windspeed mph, Precipitation mm');

[row, col] = find(Data_stand > 3 | Data_stand < -3);
outliers = [row, col];