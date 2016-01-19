# K-Means
---

## 1. The result of K-Means on Human Hereditary Disease Data    

### 1.1 Upload the Data.
    
    data = load('3d_filtered_outfile');

According to the 'labels' file, we consider the K to be 10, and plot it.        

	label = importdata('labels');
	K = length(unique(label));
	skmeansPlot3DwithStatus(data, label);
    
![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/HumHerDiseaseOriginalLablePlot.jpg)

### 1.2 Using Euclidean Distance Metrics

Implement the K-Means using Euclidean distance to data set.

    % k-means with Euclidean distance
    [status, cluster, centroid, sumDist] = skmeansEu(data,K); %#ok<*ASGLU>
 
Plot the sum of square distance by iterations. (The sum of square distance decrease by increasing iteration)
   
    % plot the sum of square distance by iterations
    sumSquDistByIter(sumDist);
  
![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/HumHerDiseaseEuDistByIterationPlot.jpg)    
    
The result store in the 'Result/HumHerDiseaseEuText.txt' with text format.
    
    % save the result to text file
    saveAsText(cluster, 'Result/HumHerDiseaseEuText.txt');

And plot it.

    % plot the result
    skmeansPlot3D(data, cluster, centroid);

![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/HumHerDiseaseEuPlot.jpg)

The different colouring circles reflect the different cluster, the Five-pointed stars means the centroid of each cluster.

### 1.3 Using Modified Pearson correlation coefficient

Implement the K-Means using Modified Pearson correlation coefficient to data set.

    % k-means with correlation distance
    [status, cluster, centroid, sumDist] = skmeansCo(data,K);
    
Plot the sum of square distance by iterations. (The sum of square distance decrease by increasing iteration)
   
    % plot the sum of square distance by iterations
    sumSquDistByIter(sumDist);
  
![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/HumHerDiseaseCoDistByIterationPlot.jpg)

The result store in the 'Result/HumHerDiseaseCoText.txt' with text format.
    
    % save the result to text file
    saveAsText(cluster, 'Result/HumHerDiseaseCoText.txt');

And plot it.

    % plot the result
    skmeansPlot3D(data, cluster, centroid);

![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/HumHerDiseaseCoPlot.jpg)

The different colouring circles reflect the different cluster, the Five-pointed stars means the centroid of each cluster.        

### 1.4 Compare the results of different distance metrics

As we can observe from two clustered picture generated by K-means algorithm, the picture using euclidean distance metric got a more reasonable result than using Pearson correlation coefficient. Because the data point in the picture using euclidean distance are more compact and similar with given labeled cluster than using correlation coefficient.

There are two reason I thought. In kinds of this data set like Human Hereditary Disease Data which each data point of the data set have several characteristics without direct correlation between them. Firstly, The label of data point should be considered about the similarity in each characteristic, the Euclidean distance metric could give more information about the similarity between different data point in specifically characteristic. Secondly, there are no clear correlation inside each characteristic, like time change or causality, the Pearson correlation coefficient could not provide a good result.

---

## 2. The result of K-Means on Gene expression Data 

### 2.1 Upload the Data and transformed into a 3500 by 6 numerical matrix.

    % load Gene Data
    gene = importGene('EcoliDatasetCW5810_truncated.txt', 1, 3500);
    % transformed the data
    [nrow, ncol] = size(gene);
    data = zeros(nrow,6);
    for i = 1:6
        data(:,i) = mean(gene(:,3*i-1:3*i+1)')';
    end
    label = gene(:,1);
    
According to tests in different K, we found that 5 is a good K.
    
    K = 5;
    
### 2.2 Using Euclidean Distance Metric

Implement the K-Means using Euclidean distance to data set.

    % k-means with Euclidean distance
    [[status, cluster, centroid, sumDist] = skmeansEu(data,K);
    
Plot the sum of square distance by iterations. (The sum of square distance decrease by increasing iteration)
   
    % plot the sum of square distance by iterations
    sumSquDistByIter(sumDist);
  
![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/GeneEuDistByIterationPlot.jpg)

The result store in the 'Result/HumHerDiseaseEuText.txt' with text format.

    % save the result to text file
    saveAsText(cluster, 'Result/GeneEuText.txt');
    
And plot it.
    
    % plot the result
    skmeansPlotGene(data, cluster, centroid);
   
![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/GeneEuPlot1.jpg)    
The different colouring lines reflect the different cluster, the black Asterisks and lines means the centroid of each cluster.
![image](https://raw.githubusercontent.com/vincent101/K-MeansMeans/master/Result/GeneEuPlot2.jpg)



### 2.3 Using Modified Pearson correlation coefficient

Implement the K-Means using Modified Pearson correlation coefficient to data set.

    % k-means with Euclidean distance
    [status, cluster, centroid, sumDist] = skmeansCo(data,K);
    
Plot the sum of square distance by iterations. (The sum of square distance decrease by increasing iteration)
   
    % plot the sum of square distance by iterations
    sumSquDistByIter(sumDist);
  
![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/GeneCoDistByIterationPlot.jpg)

The result store in the 'Result/HumHerDiseaseCoText.txt' with text format.

    % save the result to text file
    saveAsText(cluster, 'Result/GeneCoText.txt');
    
And plot it.
    
    % plot the result
    skmeansPlotGene(data, cluster, centroid);
   
![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/GeneCoPlot1.jpg)    
The different colouring lines reflect the different cluster, the black Asterisks and lines means the centroid of each cluster.
![image](https://raw.githubusercontent.com/vincent101/K-Means/master/Result/GeneCoPlot2.jpg)

### 2.4 Compare the results of different distance metrics

As we can know from two clustered picture generated by K-means algorithm, the picture using Pearson correlation coefficient got a more reasonable result than using euclidean distance metric. Because the data point in the picture using correlation coefficient have a more obvious alike trend in each cluster than using euclidean distance.

The reasons I thought could be these. In kinds of this data set like Gene Data which part of characteristics change by time in each data point of the data set. First of all, The label of data point should be considered about the correlation between characteristics in each data point, using Pearson correlation coefficient could give more information about the similar trend between different data point by characteristics. Moreover, using euclidean distance would focus on the similarity on specifically characteristic rather than the changed trend between features, like change by time, which has significant influence in this data set.    

---

## 3. Discussion
### 3.1 Considerations on the influence of the different distance metrics on the results.

Consider about the different results on two data sets using different distance metrics, we found that, methods with specifically distance metric would get a better result than other depend on different data sets with different character. For example, using euclidean distance metric when implement K-means on data set would focus on distance between any two objects is not affected by the addition of new objects to the analysis, which may be outliers. Nevertheless, Using Pearson correlation coefficient method measure similarity in shape between two profiles, but can also capture inverse relationships.[2]

### 3.2 Considerations on the influence of the different algorithm initialisations on the results.

1. Different K value cause different result. It is important to initialised with the correct number of centres to make k-means algorithm stable, and unstable if it is initialised with too many centres.[3]
2. Different initialization methods to select start point for K-means have different performance, like intelligent or random.[4]

In this program, initial centroid points are chosen from the sample of data point. It could decrease the number of iteration than just random initialisations.

    sample = randi([1,nrow],1,K);
    centroid = data(sample,:);
    

### 3.3 Considerations on the empty cluster during running the program

In case the empty cluster during running the algorithm, we split the cluster with maximum number of data point into two cluster when occur the empty cluster.

    % check void cluster
    [minClusterValue, minClusterIndex] = min(cellfun('length',cluster)) ;
    if minClusterValue == 0
        [maxClusterValue, maxClusterIndex] = max(cellfun('length',cluster));
        centroid(minClusterIndex,:) = centroid(maxClusterIndex,:)*1.01;
    end

### Reference

1. A.K. Jain, M. N. Murty, P.J. Flynn, “Data Clustering: A Review”, *ACM Computing Surveys, vol. 31*, pp. 264-323, Sep. 1999.
2. D.J. Bora, A.K. Gupta "Effect of Different Distance Measures on the Performance of K-Means Algorithm: An Experimental Study in Matlab",  *(IJCSIT) International Journal of Computer Science and Information Technologies, Vol. 5 (2)* , 2014, 2501-2506    
3. S.Bubeck, M. Meila, U.V. Luxburg, "HOW THE INITIALIZATION AFFECTS THE STABILITY OF THE k-MEANS ALGORITHM", *ESAIM: Probability and Statistics PS 16*, 2012, 436–452
4. S.S. Khana, A. Ahmadb, "Cluster center initialization algorithm for K-means clustering", *Pattern Recognition Letters 25*, 2004, 1293–1302
