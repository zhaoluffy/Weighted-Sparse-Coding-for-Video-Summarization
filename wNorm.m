function sparse = wNorm( weight, X )

sparse=0;
WX=X*diag(weight);
for i=1:size(X, 1)
    sparse=sparse + norm(WX(i,:));
end

end

