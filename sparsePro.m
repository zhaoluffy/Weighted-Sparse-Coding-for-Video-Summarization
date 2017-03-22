function sparseVal = sparsePro( lamda, fusionW, X)
%SPARSE Summary of this function goes here
%   Detailed explanation goes here

frames=size(X, 2);

S=rand(frames);

while 1  
    D=zeros(frames,1);
    for i=1:frames
        D(i)=(fusionW(i))/(norm(S(i,:),2));
    end
    D=diag(D);
    A=lamda.*(X'*X)+(1-lamda).*D;
    C=X'*X;
    S_new=A\C;

    o=objective(lamda, fusionW, X, S);
    o_new=objective(lamda, fusionW, X, S_new);
    erro=o-o_new;

    if abs(erro)<10e-5
        S=S_new;
        break;
    else
        S=S_new;
    end    
end

sparseVal=zeros(frames,1);
for i=1:frames
    sparseVal(i)=norm(S(i,:),2);
end

end

