A=textread('training.data.txt','%c');
X=textread('test.data.txt','%c');
X=double(X);
A=double(A);
B=num2cell(A);
B=cell2mat(B);
Y=num2cell(X);
Y=cell2mat(Y);
row1=size(B,1)/62;
num1=1;
C=[row1,62];
for i=1:row1 
    for j=1:62
        C(i,j)=B(num1,1);
        num1=num1+1;
    end
end
lable=C(:,1);
for i=1:row1
    lable(i,1)=lable(i,1)-48;
end
data=C;
data(:,[1,2])=[];
num2=1;
row2=size(Y,1)/60;
test=[row2,60];
for m=1:row2
    for n=1:60
        test(m,n)=Y(num2,1);
        num2=num2+1;
    end
end
%P = cvpartition(lable,'Holdout',0.3); 
%svmStruct = fitcecoc(data(P.training,:),lable(P.training)); 
svmStruct=fitcecoc(data,lable);
prediction=predict(svmStruct,test);        
%CP= classperf(lable(P.test), prediction);
fileID = fopen( 'HW5 results.txt', 'wt' );
fprintf(fileID,'%d\n',prediction);
fclose(fileID);



