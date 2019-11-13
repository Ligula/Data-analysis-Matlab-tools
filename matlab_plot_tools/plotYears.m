[l,w] = size(StandData)

emmptyCol = zeros(l,1);
StandData = [StandData emmptyCol];

coldCount = 0;
hotCount = 0;
SumWinter = 1;




for i = 1:l
	if  StandData(i,1) < 0 
			StandData(i,6) = SumWinter;
			
		if i > 1
			if hotCount > 10 && StandData(i-1,1) < 0 && StandData(i+1,1) < 0
				SumWinter = SumWinter + 1;
				hotCount = 0;
			end
			if StandData(i-1,1) > 0 && StandData(i+1,1) > 0
				StandData(i,6) = SumWinter; 
			end
		end

		coldCount = coldCount + 1;

	end
	if StandData(i,1) > 0 
		 	StandData(i,6) = SumWinter;
		 	
		if i > 1
			if coldCount > 10 && StandData(i-1,1) > 0 && StandData(i+1,1) > 0
				SumWinter = SumWinter + 1;
				coldCount = 0;
			end
			if StandData(i-1,1) < 0 && StandData(i+1,1) < 0
				StandData(i,6) = SumWinter; 
			end
		end

		hotCount = hotCount + 1;
		
	end
end

Winter = zeros(478,6);
Summer = zeros(460,6);
WinCoun = 1;
SumCoun = 1;

for j = 1:l
	a = rem(StandData(j,6),2);
	
	if  a == 1
		Winter(WinCoun,:) = StandData(j,:);
		WinCoun = WinCoun +1;

	elseif a == 0
		Summer(SumCoun,:) = StandData(j,:);
		SumCoun = SumCoun +1;
	end
end

ColCount = 1;
for i =1: l
	if i < 478
		if Winter(i,6) ~= Winter(i+1,6);
			ColCount = ColCount +1;
		end

		Winter(i,6) = ColCount;

	end


end 


ColCount = 1;
for i =1: l
	if i < 460
		if Summer(i,6) ~= Summer(i+1,6);
			ColCount = ColCount +1;
		end

		Summer(i,6) = ColCount;

	end


end 


Winter(60,6) = ColCount;






csvwrite('winter.csv', Winter);
