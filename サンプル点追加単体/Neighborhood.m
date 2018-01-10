function [tmp] = Neighborhood(Times,good,Area_x)
%%%%%%%%%%%%%%%%%Sprinkle a point near goood solution %%%%%%%%%%%%%%%%%
global dimension clusta
    tmp=[];
    for J=1:Times
        target=randi(clusta);
        if size(good,2) >1
            for i=1:dimension
                tmp(i,J)=(good(i,target)+2*rand*Area_x(i))-Area_x(i);
            end
        else
            for i=1:dimension
                tmp(i,J)=(good(i)+2*rand*Area_x(i))-Area_x(i);
            end
        end
    end
end