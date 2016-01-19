% implement k-means with Correlative metric
function [status, cluster, centroid,sumDist] = skmeansCo(data, K)
    [nrow, ncol] = size(data); %#ok<*ASGLU>
    % initial K point
    sample = randi([1,nrow],1,K);
    centroid = data(sample,:);
    eachDist = zeros(1,K);
    sumDist = [];
    count = 0;
    while 1
        pre_cen = centroid;  
        cluster = cell(1,K);
        count = count+1;
        sumDist(count) = 0;
        for i = 1:nrow      
            for k = 1:K
                eachDist(k) = distCo(centroid(k,:), data(i,:));
            end
            [minDist, minDistIndex] = min(eachDist);
            sumDist(count) = sumDist(count)+minDist;
            cluster{minDistIndex} = [cluster{minDistIndex},i]; 
        end
        % update the centroid 
        for k = 1:K
            centroid(k,:) = mean(data(cluster{k},:));
        end
        % check void cluster
        [minClusterValue, minClusterIndex] = min(cellfun('length',cluster)) ;
        if minClusterValue == 0
            [maxClusterValue, maxClusterIndex] = max(cellfun('length',cluster));
            centroid(minClusterIndex,:) = centroid(maxClusterIndex,:)*1.01;
        end
        % check if the position change
        if pre_cen==centroid
            break;
        end
    end

    status = zeros(nrow,1);
    for k = 1:K
        status(cluster{k}) = k;
    end

end
