function [ out ] = OutputImageGen(width, height, baseNum, dilate)
%GETMOVE outputs moving image imNum from scan

%check inputs
if((width ~= round(width)) || (width < 0))
    TRACE_ERROR('width must be a positive integer, returning');
    return;
end
if((height ~= round(height)) || (height < 0))
    TRACE_ERROR('height must be a positive integer, returning');
    return;
end
if((baseNum ~= round(baseNum)) || (baseNum < 0))
    TRACE_ERROR('moveNum must be a positive integer, returning');
    return;
end
if((dilate ~= round(dilate)) || (dilate < 0))
    TRACE_ERROR('dilate must be a positive integer, returning');
    return;
end

%ensures the library is loaded
CheckLoaded();

%get image
numCh = calllib('LibCal','getMoveNumCh', baseNum);
out = calllib('LibCal','outputImageGen', width, height, dilate);


setdatatype(out,'singlePtr',width*height*numCh);

%get data
out = get(out);
out = out.Value;

out = reshape(out,width,height,numCh);
out = permute(out, [2 1 3]);

end

