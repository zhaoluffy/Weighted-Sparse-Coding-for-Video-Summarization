
%% Get the objective function
function p = objective( lamda, weight, X, S )
%
%  inputs: 
%     lamda    : spatial salient weight score 
%     B        : object like weight score 
%     fusionW  : object like weight score 
%     X        : SparseCoding
%  output
%     p        : objective function
%


p=(lamda/2) * norm(X-X*S, 'fro')^2 + ((1-lamda)/2) * wNorm(weight, S);

end

