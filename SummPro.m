function sparseVal = SummPro(filename, skip, lamda, wmin, wmax) 

    [fpath, fname, fext] = fileparts(filename);
    
    imdir = [fpath '/' fname  '/'];
    outdir=[imdir 'sparse/'];
    if ~exist(outdir)
        mkdir(outdir);
    end
    
    load([imdir 'visual/signatures.mat']);
%     load([imdir 'visual/motions.mat']);
    load([imdir 'visual/motionsCSV.mat']);
    load([imdir 'feature/fisherVecs.mat']);
    load([imdir 'feature/fisherVecsPro.mat']);
    load([imdir 'feature/gistVecs.mat']);
    
    load([imdir 'feature/deepfeat.mat']);
    deepfeat=deepfeat./norm(norm(deepfeat));
    deepfeat=deepfeat(:,1:5:end);

    %X=fisherVecs./norm(norm(fisherVecs));
    %X=cat(1, fisherVecsPro, gistVecs);
    %X=fisherVecsPro;
    %X=gistVecs;
    
    %X=deepfeat;
    X=cat(1, deepfeat, gistVecs);
    
    n=size(X, 2);

    fusionW=fusion(0.2, signatures, motionsCSV);
    fusionW=fusionW./max(fusionW);
    fusionW=imadjust(fusionW, [min(fusionW), max(fusionW)], [wmin wmax]);
 %   fusionW=imadjust(fusionW, [min(fusionW), max(fusionW)], [1 1]);
    
    sparseVal=sparsePro(lamda, fusionW, X);
    figure;
    plot(1:skip:skip*n, sparseVal);
    
%     nkey=10;
%     nkey=nkey+fix(n/200);
    
%    summ=summarization(sparseVal, skip, nkey);

    
    if exist([outdir 'summarization.mat'])
        delete([outdir 'summarization.mat']);
    end
    save([outdir 'summarization.mat'], 'sparseVal');

end


