function [tmp] = Neighborhood(Times,good,Area_x,dimension,c_index)
%%%%%%%%%%%%%%%%%Sprinkle a point near goood solution %%%%%%%%%%%%%%%%%
    tmp=[];
    for J=1:Times
        for i=1:dimension
            tmp(i,J)=(good(i,c_index)+2*rand*Area_x(i))-Area_x(i);
        end
    end
end