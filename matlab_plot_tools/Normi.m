function norm_values = normi(Data);

[L,W] = size(Data);

Data_min=min(Data);
Data_max=max(Data);

norm_values = zeros(L,W);

for i=1:1:W
	norm_values(:,i)=(Data(:,i)-min(Data(:,i)))/(max(Data(:,i))-min(Data(:,i)));
end