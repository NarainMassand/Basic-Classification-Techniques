close all;
x1=linspace(0,25);
y1=linspace(0,25);
[grid1,grid2]=meshgrid(x1,y1);
planedata=[grid1(:) grid2(:)];

sizeofdata=size(ss,1);
dist=0;
Euclidsq=0;
final=[;];
sorted=[;];
finlabel=0;
label=0;
r=2;

for i=1:1:10000
    for j=1:1:sizeofdata
    Euclidsq=((planedata(i,1)-ss(j,1))^2)+((planedata(i,2)-ss(j,2))^2);
    final=[final;Euclidsq ss(j,3)];
    end
    sorted=sortrows(final);   
    inrange=0;
    sumoflabels=0;

   for t=1:1:size(sorted,1)
    if sorted(t,1)<=r
       inrange=inrange+1;
       sumoflabels=sumoflabels+sorted(t,2);
    end
   end
   
   if sumoflabels>=inrange/2
       planedata(i,3)=1;
   else
       planedata(i,3)=0;
   end
  
final=[;];    
end

plot(planedata(planedata(:,3)==1,1),planedata(planedata(:,3)==1,2),'.r');
hold on;
plot(planedata(planedata(:,3)==0,1),planedata(planedata(:,3)==0,2),'.b');
hold on;
