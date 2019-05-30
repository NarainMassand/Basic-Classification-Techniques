%%--Variable K based NN classification with random selection of data by Narain Massand--%%
dist=0;
Euclidsq=0;
final=[;];
sorted=[;];
finlabel=0;
label=0;

HIT=[;];
SEN=[;];
SPEC=[;];
PPVO=[;];
NPVO=[;];
tp=0;
tn=0;
fp=0;
fn=0;

for k=3:2:21
for trial=1:1:10
test=[];
ss=[];
[random,~]=size(data);
randomRowIdxs = randperm(random);
shuffled = data(randomRowIdxs,:);
m1=1:1:300;
ss=shuffled(m1,[1 2 3]);
m2=301:1:399;
test=shuffled(m2,[1 2]);
for i=1:size(test,1)
    finlabel=0;
    sorted=[;];
    final=[;];
    inrange=0;
    sumoflabels=0;
       
    for j=1:size(ss,1)
     
      Euclidsq=((test(i,1)-ss(j,1))^2)+((test(i,2)-ss(j,2))^2);
      dist=sqrt(Euclidsq);
      final=[final;dist ss(j,3)];
    end
   sorted=sortrows(final);
a1=1;
sum=0;
for o=1:1:k
    sum=sum+sorted(o,2);
    a1=a1+1;
end
   %finlabel=sorted(1,2)+sorted(2,2)+sorted(3,2)+sorted(4,2)+sorted(5,2);
if sum>=((k+1)/2)
    label=1;
elseif sum<=((k-1)/2)
    label=0;
    end 
test(i,3)=label;
   
%    for t=1:1:size(sorted,1)
%     if sorted(t,1)<=r
%        inrange=inrange+1;
%        sumoflabels=sumoflabels+sorted(t,2);
%     end
%    end
%    
%    if sumoflabels>=inrange/2
%        label=1;
%    else
%        label=0;
%     end
% 
%    test(i,3)=label;
% 

if test(i,3)==1
        if test(i,3)==shuffled(300+i,3)
            tp=tp+1;
        else fp=fp+1;
        end
    elseif test(i,3)==0
        if test(i,3)==shuffled(300+i,3)
            tn=tn+1;
        else fn=fn+1;
        end
    end


end

hitrate(trial)=(tp+tn)/i;
sensitivity(trial)=tp/(tp+fn);
specificity(trial)=tn/(fp+tn);
PPV(trial)=tp/(tp+fp);
NPV(trial)=tn/(tn+fn);


tp=0;
tn=0;
fp=0;
fn=0;

end
HIT=[HIT;hitrate];
SEN=[SEN;sensitivity];
SPEC=[SPEC;specificity];
PPVO=[PPVO;PPV];
NPVO=[NPVO;NPV];

end

HITmean=mean(HIT,2);
SENmean=mean(SEN,2);
SPECmean=mean(SPEC,2);
PPVOmean=mean(PPVO,2);
NPVOmean=mean(NPVO,2);

HITsd=std(HIT,0,2);
SENsd=std(SEN,0,2);
SPECsd=std(SPEC,0,2);
PPVOsd=std(PPVO,0,2);
NPVOsd=std(NPVO,0,2);
K=3:2:21;
figure(1)
errorbar(K,HITmean,HITsd)
title('Fig 2.2(a) HIT rate vs. K'); xlabel('K'); 
ylabel('Mean HIT rate with standard deviation '); 
figure(2)
errorbar(K,SENmean,SENsd)
title('Fig 2.2(b) Sensitivity vs. K'); xlabel('K'); 
ylabel('Mean sensitivity with standard deviation '); 
figure(3)
errorbar(K,SPECmean,SPECsd)
title('Fig 2.2(c) Specificity vs. K'); xlabel('K'); 
ylabel('Mean Specificity with standard deviation '); 
figure(4)
errorbar(K,PPVOmean,PPVOsd)
title('Fig 2.2(d) PPV(Precision) vs. K'); xlabel('K'); 
ylabel('Mean PPV with standard deviation '); 
figure(5)
errorbar(K,NPVOmean,NPVOsd);
title('Fig 2.2(e) NPV vs. K'); xlabel('K'); 
ylabel('Mean NPV with standard deviation '); 

