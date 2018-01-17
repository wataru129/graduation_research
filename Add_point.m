%%%%%%%%%%%%%          Initial setting         %%%%%%%%%%%%%
add_point  = [];  %Init additional sample point
N_sparse        = floor((1-(C/C_total))*per_clusta+0.5)-1; %Number of sparse area
if N_sparse < 0
    N_sparse = 0;
end
N_good          = per_clusta - N_sparse - 1;  %Number of good area
%%%%%%%%%%%%%          Initial setting         %%%%%%%%%%%%%%

%%%%%%%%%%%%% Main program of additional point %%%%%%%%%%%%%%%%%%%%%%
for c_index =1:clusta
    add_temp   = [];    %Init temporary adds point
    add_temp_b = [];    %Init temporary add point near best
    add_temp_p = [];    %Init temporary add point near pso
    Area_x     = [];    %Init temporary Arx
    Area_x_pb     = []; %Init temporary Arx
    for i = 1:dimension
        Area_x(i,1) = (upper_limit-low_limit)/Cr(c_index);
    end
    if up_status(c_index) == 1
        case_box(C,c_index)=1;
    %%/////////// Case of update best solution ///////////%
        Cr(c_index) = Cr(c_index) + 1;
        add_temp_p = Neighborhood(N_good,best_sample_point(:,c_index),Area_x,dimension,c_index);
    else
    %%/////////// Case of NOT update best solution ///////////%
        distance_p_b = sqrt(sum((x_pso(:,c_index)-best_sample_point(:,c_index)).^2)); %distance pso and xbest
        Area_x_pb = sum(Area_x);                          %distance Area_x
        if Area_x_pb >= distance_p_b
            case_box(C,c_index)=2;
            Cr(c_index) = Cr(c_index) + 1;
            %/// xbest neighborhood ///%
            add_temp_b =  Neighborhood(N_good,best_sample_point(:,c_index),Area_x,dimension,c_index);
        else
            case_box(C,c_index)=3;
            x_best_times = floor(N_good/2);
            %/// xbest neighborhood ///%
            add_temp_b = Neighborhood(x_best_times,best_sample_point(:,c_index),Area_x,dimension,c_index);
            %/// pso neighborhood ///%
            add_temp_p = Neighborhood(N_good-x_best_times,x_pso(:,c_index),Area_x,dimension,c_index);
        end
    end
    add_temp =[add_temp_b add_temp_p];s
    Only_total
    add_point(:,:,c_index)=[ add_temp  x_pso(:,c_index)];
    %/// If it is outside the range, return it to the end point ///%
    add_point(add_point > upper_limit)  = upper_limit;
    add_point(add_point < low_limit)    = low_limit;
end