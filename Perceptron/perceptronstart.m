%%----Perceptron code by Narain Massand----%%
threshold=0;
activation=0;
tempresult=[];
lr=0.5;
c=0;
e=0;
error=[];
x=0;
y=0;
slope=0;
learninglabel=[;];
allweights=[;];

for iteration=1:10000
    tempresult=[];
   for i=1:size(data,1)
       activation=data(i,1)*weight(1)+data(i,2)*weight(2)+data(i,3)*weight(3);
       if activation>=threshold
           tempresult(end+1)=1;
       else 
           tempresult(end+1)=0;
       end
%         if iteration>=10000
%             lr=0.2;
%         end
        if i>=10000
            lr=0.2;
        end
       if tempresult(i)~=data(i,4)
           weight(1)=weight(1)+(lr*(data(i,4)-tempresult(i)));
           weight(2)=weight(2)+(lr*(data(i,4)-tempresult(i))*data(i,2));
           weight(3)=weight(3)+(lr*(data(i,4)-tempresult(i))*data(i,3));
           e=e+1;       
       end
       
   end
error(end+1)=e;
allweights=[allweights;weight];
learninglabel=[learninglabel;tempresult];
e=0;
end
slope=(-weight(1)/weight(3))/(weight(1)/weight(2));
intercept=-weight(1)/weight(3);
x=1:1:100;
y=(slope*x)+intercept;

hold on;
%a=data(:,2);
%b=data(:,3);
for c=1:300
  a=data(c,2);
  b=data(c,3);
  
if data(c,4)==1
  scatter(a,b,'.b');
  hold on;
else
    %data(c,4)==0
    scatter(a,b,'.r');
    hold on;
end
end
plot(x,y);
axis([-10 40 -10 40]);
%scatter(a,b);
hold off;
