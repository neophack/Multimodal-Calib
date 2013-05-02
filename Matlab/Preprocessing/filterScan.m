function [ out ] = filterScan( scan, metric, tform)
%FILTERSCAN filters scan ready for use with metric

if(strcmp(metric,'MI'))
    out = single(scan);
elseif(strcmp(metric,'GOM'))   
    out = single(scan);
    [mag,phase] = get2DGradient( out, tform );
    mag = mag - min(mag(:));
    mag = mag / max(mag(:));
    mag = histeq(mag);
    out = [out(:,1:3),mag,phase];
else
    error('Invalid metric type');
end

out(:,4) = out(:,4) - min(out(:,4));
out(:,4) = out(:,4) / max(out(:,4));
    
end

