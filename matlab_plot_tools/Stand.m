function Data_stand = Stand(Data);

[L,W] = size(Data);

Miu=mean(Data); 
Sigma=std(Data); 

Data_stand=zeros(L,W); 

for i=1:1:W
	Data_stand(:,i)=(Data(:,i)-Miu(i))./Sigma(i);
end

