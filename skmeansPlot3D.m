% plot the result with cluster
function [] = skmeansPlot3D(data, cluster, centroid)
% function [] = kmeansPlot3D(data, status, centroid)
    % newdata = [date, status];
    % clusters = {};
    p = [];
    colour = jet(length(cluster));
    for k=1:length(cluster)
        % clusters{k} = newdata(newdata(:,4)==k,1:3);
        % plot3(clusters{k}(:,1),clusters{k}(:,2),clusters{k}(:,3),'o');
        p(k) = plot3(data(cluster{k},1),data(cluster{k},2),data(cluster{k},3),'o','Color', colour(k,:));
        hold on;
        plot3(centroid(k,1),centroid(k,2),centroid(k,3),'p','Color', colour(k,:))
        hold on;
    end
    grid on;
    legend(p,'1','2','3','4','5','6','7','8','9','10');
end
