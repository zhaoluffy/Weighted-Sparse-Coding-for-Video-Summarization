function fusionW = fusion( r1, signatures, motions )
%
%  inputs: 
%     spatialW    : spatial salient weight score 
%     objW        : object like weight score 
%
%  output
%     fusionW     : fusion score
%

fusionW = 1 ./ (r1.*signatures'  + (1-r1).*motions(:,1));

end

