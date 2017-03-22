function summ = summarization( sparseVal, param, nFrames )
%SUMMARIZATION Summary of this function goes here
%   Detailed explanation goes here

% Compute number and length of superframes
[~,bestLength]=getLengthPrior(-1,param.lognormal);
delta=round(param.DeltaInit*param.FPS);
bestLength=round(bestLength*param.FPS);

nkey=round(nFrames*0.15/bestLength);
n=length(sparseVal);
[M,I]=sort(sparseVal,'descend');

skip=param.skip;
num=1;
i=1;
summ=[];
while 1

    if(I(i)>1 && I(i)<n)
        if M(i)>sparseVal(I(i)-1) && M(i)>sparseVal(I(i)+1)
            index=(I(i)-1).*skip+1;
            summ=[summ; index];
            num=num+1;
        end
    end

    i=i+1;
   
    if(length(summ)>=nkey)
        break;
    end
end
    
end

