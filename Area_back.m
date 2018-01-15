function [x] = Area_back(x)
%global dimension upper_limit low_limit
%{
    dimension   = 10;
    upper_limit = 5;
    low_limit   = -5;
    number = size(x,2);

    for i=1:number
        for j = 1:dimension
            if x(j,i) > upper_limit
                x(j,i) = upper_limit;
            elseif x(j,i) < low_limit
                x(j,i) = low_limit;
            end
        end
    end
%}
x(x > 5)  = 5;
x(x < -5) = -5;
end