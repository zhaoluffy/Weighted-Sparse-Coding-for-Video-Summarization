function fusionW = fusion( r1, signatures, motions )
%
%  inputs: 
%     spatialW    : spatial salient weight score 
%     objW        : object like weight score 
%
%  output
%     fusionW     : fusion score
%

N=length(signatures);
fusionW=zeros(N,1);

for i=1:length(signatures)
    d=motions(i, 2);
    wt=d*exp(1-d);
    ws=1-wt;
    w=[ws, wt];
    As=signatures(i);
    At=motions(i, 1);
    A=[As, At];
    
    W=1+1/(2*(1+r1)) * (abs(1-2*ws)+abs(1-2*wt));
    
    fusionW(i)=(w*A'+1/(2*(1+r1)) * ...
        (abs(2*ws*As-w*A')+abs(2*wt*At-w*A')))/W;
end

fusionW = 1 ./ fusionW;

end

