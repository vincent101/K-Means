clear all;
close all;
clc;
% load Disease Data
data = load('3d_filtered_outfile');
label = importdata('labels');
K = length(unique(label));
% plot the result with given classify
skmeansPlot3DwithStatus(data, label);

% k-means with Euclidean distance
[status, cluster, centroid, sumDist] = skmeansEu(data,K); %#ok<*ASGLU>
% plot the sum of square distance by iterations
sumSquDistByIter(sumDist);
% save the result to text file
saveAsText(cluster, 'Result/HumHerDiseaseEuText.txt');
% plot the result
skmeansPlot3D(data, cluster, centroid);

% k-means with correlation distance
[status, cluster, centroid, sumDist] = skmeansCo(data,K);
% plot the sum of square distance by iterations
sumSquDistByIter(sumDist);
% save the result to text file
saveAsText(cluster, 'Result/HumHerDiseaseCoText.txt');
% plot the result
skmeansPlot3D(data, cluster, centroid);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;
% load Gene Data
gene = importGene('EcoliDatasetCW5810_truncated.txt', 1, 3500);
[nrow, ncol] = size(gene);
data = zeros(nrow,6);
for i = 1:6
    data(:,i) = mean(gene(:,3*i-1:3*i+1)')';
end
label = gene(:,1);
K = 5;

% k-means with Euclidean distance
[status, cluster, centroid, sumDist] = skmeansEu(data,K);
% plot the sum of square distance by iterations
sumSquDistByIter(sumDist);
% save the result to text file
saveAsText(cluster, 'Result/GeneEuText.txt');
% plot the result
skmeansPlotGene(data, cluster, centroid);

% k-means with Correlation distance
[status, cluster, centroid, sumDist] = skmeansCo(data,K);
% plot the sum of square distance by iterations
sumSquDistByIter(sumDist);
% save the result to text file
saveAsText(cluster, 'Result/GeneCoText.txt');
% plot the result
skmeansPlotGene(data, cluster, centroid);



