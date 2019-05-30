%%----Perceptron code by Narain Massand----%%
close all;
threshold=0;
activation=0;
activationt=0;
% tempresult=zeros(1,300);
% testresult=zeros(1,99);
% weight=[-0.5 0.5 0];
lr=1;
c=0;
e=0;
error=[];
x=0;
y=0;
slope=0;
learninglabel=[;];
allweights=[;];
TER=[];
ER=[];
% testresult=[];
for iteration=1:10000
tpt=0;
tnt=0;
fpt=0;
fnt=0;
tp=0;
tn=0;
fp=0;
fn=0;
for i=1:size(data,1)
      
   if tempresult(i)==1
        if tempresult(i)==data(i,4)
            tpt=tpt+1;
        else fpt=fpt+1;
        end
    elseif tempresult(i)==0
        if tempresult(i)==data(i,4)
            tnt=tnt+1;
        else
            fnt=fnt+1;
        end
    end
       
       activation=data(i,1)*weight(1)+data(i,2)*weight(2)+data(i,3)*weight(3);
       if activation>=threshold
           tempresult(i)=1;
       else 
           tempresult(i)=0;
       end
      
       if iteration>=100 && iteration<=1000
             lr=0.5;
       else
             lr=0.25;
       end
%         if iteration>=10000
%             lr=0.2;
%         end
       if tempresult(i)~=data(i,4)
           weight(1)=weight(1)+(lr*(data(i,4)-tempresult(i)));
           weight(2)=weight(2)+(lr*(data(i,4)-tempresult(i))*data(i,2));
           weight(3)=weight(3)+(lr*(data(i,4)-tempresult(i))*data(i,3));
           %e=e+1;       
       end

    
           
end


for q=1:size(testdata,1)
       activationt=1*weight(1)+testdata(q,1)*weight(2)+testdata(q,2)*weight(3);
       if activationt>=threshold
           testresult(q)=1;
       else 
           testresult(q)=0;
       end
       
        if testresult(q)==1
            if testresult(q)==testdata(q,3)
            tp=tp+1;
            else fp=fp+1;
            end
        elseif testresult(q)==0
            if testresult(q)==testdata(q,3)
            tn=tn+1;
            else
            fn=fn+1;
            end
        end
end




hitrate=(tp+tn)/99;
sensitivity=tp/(tp+fn);
specificity=tn/(fp+tn);
PPV=tp/(tp+fp);
NPV=tn/(tn+fn);
errorrate=1-hitrate;
ER(end+1)=errorrate;

thitrate=(tpt+tnt)/300;
tsensitivity=tpt/(tpt+fnt);
tspecificity=tnt/(fpt+tnt);
tPPV=tpt/(tpt+fpt);
tNPV=tnt/(tnt+fnt);
terrorrate=1-thitrate;
TER(end+1)=terrorrate;
%error(end+1)=e;
allweights=[allweights;weight];
%learninglabel=[learninglabel;tempresult];
%e=0;


end

slope=(-weight(1)/weight(3))/(weight(1)/weight(2));
intercept=-weight(1)/weight(3);
x=1:1:100;
y=(slope*x)+intercept;
hold off;
hold on;

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
hold on;
plot(testdata(testdata(:,3)==1,1),testdata(testdata(:,3)==1,2),'.b');
hold on;
plot(testdata(testdata(:,3)==0,1),testdata(testdata(:,3)==0,2),'.r');
hold on;

