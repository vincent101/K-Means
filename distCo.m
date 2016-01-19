function distance = distCo(x,y)
    xc = x-mean(x);
    yc = y-mean(y);
    distance = 1-xc*yc'/(sqrt(sum(xc.^2))*sqrt(sum(yc.^2)));
end
