function [x] = Area_back(x)
global dimension upper_limit low_limit
    number = size(x,2)
    for i=1:number
        for j = 1:dimension
            if x(j,i) > upper_limit(j)
                x(j,i) = upper_limit(j);
            elseif x(j,i) > low_limit(j)
                x(j,i) = low_limit(j);
            end
        end
    end
end