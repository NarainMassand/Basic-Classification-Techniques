tp=0;
tn=0;
fp=0;
fn=0;
for i=1:1:99
    if test(i,3)==1
        if test(i,3)==actualdata(i)
            tp=tp+1;
        else fp=fp+1;
        end
    elseif test(i,3)==0
        if test(i,3)==actualdata(i)
            tn=tn+1;
        else fn=fn+1;
        end
    end
end

hitrate=(tp+tn)/i;
sensitivity=tp/(tp+fn);
specificity=tn/(fp+tn);
PPV=tp/(tp+fp);
NPV=tn/(tn+fn);
knn=categorical({'Hit-Rate','Sensitivity','Specificity','PPV','NPV'});
values=[hitrate sensitivity specificity PPV NPV];
bar(knn,values);