% plot the result with status
function [] = skmeansPlot3DwithStatus(data, status)
    [nrow, ncol] = size(data); %#ok<ASGLU>
    statusVector = unique(status);
%     cluster = {};
%     cluster{length(statusVector)} = [];
    cluster = cell(1,length(statusVector));
    p = [];
    colour = jet(length(cluster));
    for k=1:length(statusVector)
        for i = 1:nrow
            if isequal(status{i},statusVector{k})
                cluster{k} = [cluster{k},i];
            end
        end
        p(k) = plot3(data(cluster{k},1),data(cluster{k},2),data(cluster{k},3),'o','Color', colour(k,:));
        hold on;
%         plot3(centroid(k,1),centroid(k,2),centroid(k,3),'p')
        hold on;
    end
    grid on;
    legend(p,statusVector);
end