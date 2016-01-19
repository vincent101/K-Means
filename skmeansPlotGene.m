% plot the result
function [] = skmeansPlotGene(data, cluster, centroid)
    colour = jet(length(cluster));
    for k = 1:length(cluster)
        x = plot(data(cluster{k},:)', 'LineStyle', '-', 'Color', colour(k,:));
        hold on;
        plot(centroid(k,:)', 'LineStyle', '-', 'Color', 'k');
        hold on;
        plot(centroid(k,:)', '*', 'Color', 'k');
        hold on;
    end
    grid on;
    
    % subplot
    figure();
    colour = jet(length(cluster));
    for k = 1:length(cluster)        
        subplot(ceil(sqrt(length(cluster))),ceil(sqrt(length(cluster))),k);
        plot(data(cluster{k},:)', 'LineStyle', '-', 'Color', colour(k,:));
        hold on;
        plot(centroid(k,:)', 'LineStyle', '-', 'Color', 'k');
        hold on;
        plot(centroid(k,:)', '*', 'Color', 'k');
        hold on;
    end
    grid on;
end
