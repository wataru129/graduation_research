function [add_point] = Neighborhood(Times,good,Area_x,add_point)
%%%%%%%%%%%%%%%%%Sprinkle a point near goood solution %%%%%%%%%%%%%%%%%
global dimension
    add_tmp=[];
    for J=1:Times
        for i=1:dimension
            add_tmp(i,J)=(good(i)+2*rand*Area_x(i))-Area_x(i);
        end
    end
    add_point=[add_point add_tmp];
end