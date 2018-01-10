%%%%%%%%%%%%%%Setting for checking program%%%%%%%%%%%
load InitialPoints_300_100_100
clusta           = 3;
dimension        = 10;   %The dimension of program
ini_sample_num   = 50;   %The number of initial sample point
per_clusta       = 10;   %The number of addtional sample point for clusta
add_sample_num   = clusta * per_clusta;   %The number of addtional sample point
max_sample_num   = 300;  %The number of max sample point
upper_limit    = 5;
low_limit      = -5;
up_status              = ones(3) ;
cur_sample_num = ini_sample_num;
normal         = IP(1:cur_sample_num,1:dimension,1).';
for i = 1:cur_sample_num
    for j = 1:dimension
        sample_point(j,i) = upper_limit*normal(j,i);
    end
end
C         =1;
Cr        = ones(clusta)*10;    %Concentrated Search parameter
C_total   = ceil((max_sample_num-ini_sample_num) ...
                                /add_sample_num);
x_pso       = ones(dimension,clusta);
best_sample_point = ones(dimension,clusta);
%%%%%%%%%%%%%%Setting for checking program%%%%%%%%%%%


%%%%%%%%%%%%%          Initial setting         %%%%%%%%%%%%%
add_point  = [];  %Init additional sample point
N_sparse        = floor((1-(C/C_total))*per_clusta+0.5) -1; %Number of sparse area
N_good          = per_clusta - N_sparse - 1;  %Number of good area
%%%%%%%%%%%%%          Initial setting         %%%%%%%%%%%%%%

%%%%%%%%%%%%% Main program of additional point %%%%%%%%%%%%%%%%%%%%%%
for c_index =1:clusta
    add_temp   = [];  %Init temporary sample point
    add_temp_b = [];  %Init temporary sample point near best
    add_temp_p = [];  %Init temporary sample point near pso
    for i = 1:dimension
        Area_x(i,1) = (upper_limit-low_limit)/Cr(c_index);
    end
    if up_status(c_index) == 1
    %%/////////// Case of update best solution ///////////%
        Cr(c_index) = Cr(c_index) + 1;
        add_temp_p = Neighborhood(N_good,best_sample_point(:,c_index),Area_x);
        disp(size(add_temp_p));
        best_case = 1;

    else
    %%/////////// Case of NOT update best solution ///////////%
        distance_p_b = sqrt(sum((x_pso-best_sample_point).^2)); %distance pso and xbest
        Area_x_pb = sum(Area_x);                          %distance Area_x
        if Area_x_pb >= distance_p_b
        %/// xbest neighborhood ///%
            Cr(c_index) = Cr(c_index) + 1;
            add_temp_b =  Neighborhood(N_good,best_sample_point(:,c_index),Area_x);
            best_case = 1;
        else
            x_best_times = floor(N_good/2);
        %/// xbest neighborhood ///%
            add_temp_b = Neighborhood(x_best_times,best_sample_point(:,c_index),Area_x);
        %/// pso neighborhood ///%
            add_temp_p = Neighborhood(N_good-x_best_times,x_pso(:,c_index),Area_x);
            best_case  = 2;
        end
    end
%}
    add_temp =[add_temp_b add_temp_p];
    %Sparse_area
    only_total
    add_point(:,:,c_index)=[ add_temp  x_pso(:,c_index)];
%%%%%%%%%%%%% Judgement of additional sample point %%%%%%%%%%%%%
%/// If it is outside the range, return it to the end point ///%
    for i = 1:per_clusta
        for j = 1:dimension
            if add_point(j,i,c_index) > upper_limit
                add_point(j,i,c_index) = upper_limit;
            elseif add_point(j,i,c_index) < low_limit
                add_point(j,i,c_index) = low_limit;
            end
        end
    end
end