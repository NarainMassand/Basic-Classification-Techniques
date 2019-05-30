%-----knn by Narain Massand-----%
%test=[;];
sizeoftest=size(test,1);
sizeofdata=size(ss,1);
dist=0;
Euclidsq=0;
distind=[];
final=[;];
sorted=[;];
finlabel=0;
label=0;
for i=1:sizeoftest
    finlabel=0;
    sorted=[;];
    final=[;];
    %distind=[];
    for j=1:sizeofdata
      disint=[];
      Euclidsq=((test(i,1)-ss(j,1))^2)+((test(i,2)-ss(j,2))^2);
      dist=sqrt(Euclidsq);
      %distind(end+1)=dist;
      %distind(end+1)=ss(j,3);
      final=[final;dist ss(j,3)];
    end
   sorted=sortrows(final);
finlabel=sorted(1,2)+sorted(2,2)+sorted(3,2)+sorted(4,2)+sorted(5,2);
if finlabel>=3
    label=1;
elseif finlabel<=2
    label=0;
    end 
test(i,3)=label;
ss=[ss;test(i,:)];
end

a=0;
b=0;


for diff=1:1:size(ss,1)
a=ss(diff,1);
b=ss(diff,2);
if ss(diff,3)==1
scatter(a,b,'.b');
hold on;
else 
scatter(a,b,'.r');
hold on;
end

end
