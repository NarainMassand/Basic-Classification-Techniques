%%--Perceptron Test code by Narain Massand--%%
threshold=0;
testresult=[];

for i=1:size(testdata,1)
       activation=1*weight(1)+testdata(i,1)*weight(2)+testdata(i,2)*weight(3);
       if activation>=threshold
           testresult(i)=1;
       else 
           testresult(i)=0;
       end
end