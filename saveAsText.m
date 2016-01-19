function [] = saveAsText(cluster, fileName)
    [nrow, ncol] = size(cluster);
    fid = fopen(fileName, 'w');
    for item = 1:ncol
        fprintf(fid, ['The ', num2str(item), ' cluster:\n']);
        fprintf(fid, '%d\t', cluster{item});
        fprintf(fid, '\n\n');
    end
    fclose(fid);
end