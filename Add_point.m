%%%%%%%%%%%%%          Initial setting         %%%%%%%%%%%%%
add_point      = [];  %Init additional sample point
add_point_temp = [];  %Init temporary sample point
N_sparse        = floor((1-(C/C_total))*add_sample_num+0.5); %Number of sparse area
N_good          = add_sample_num - N_sparse - 3;  %Number of good area

%{
if N_good < clusta
    N_good   = clusta;
    N_sparse = add_sample_num - clusta;
end
%}

for i = 1:dimension
   % Area_x(i)=((1-(-1))/2)*(1-(Cr/(C_total+1)));
    Area_x(i,1) = (upper_limit-low_limit)/Cr;
end

%%%%%%%%%%%%%          Initial setting         %%%%%%%%%%%%%%

%%%%%%%%%%%%% Main program of additional point %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Case of update best solution %%%%%%%%%%%%%
if up_status == 1
    Cr = Cr + 1;
    case_box(C)=1;
    best_case = 1;
    add_point = Neighborhood(N_good,best_sample_point,Area_x,add_point);
    if N_sparse ~=0
        Sparse_areas
    else
        add_point=[add_point x_pso];
    end
%%%%%%%%%%%%% Case of NOT update best solution %%%%%%%%%%%%%
else
    distance_p_b = sqrt(sum((x_pso-best_sample_point).^2)); %distance pso and xbest
    Area_x_pb = sum(Area_x);                          %distance Area_x
    if Area_x_pb >= distance_p_b
        Cr = Cr + 1;
        case_box(C)=2;
    %/// xbest neighborhood ///%
        best_case = 1;
        add_point = Neighborhood(N_good,best_sample_point,Area_x,add_point);
        if N_sparse ~=0
            Sparse_area
        else
            add_point=[add_point x_pso];
        end
    else
        case_box(C)=3;
    %/// pso neighborhood ///%
        x_best_times = floor(N_good/2);
        add_point = Neighborhood(x_best_times,best_sample_point,Area_x,add_point);
        best_case  = 2;
        add_point = Neighborhood(N_good-x_best_times,x_pso,Area_x,add_point);
        if N_sparse ~=0
            Sparse_area
        else
            add_point=[add_point x_pso];
        end
    end
end

%%%%%%%%%%%%% Judgement of additional sample point %%%%%%%%%%%%%
%/// If it is outside the range, return it to the end point ///%
for i = 1:add_sample_num
    for j = 1:dimension
        if add_point(j,i) > upper_limit
            add_point(j,i) = upper_limit;
        end
        if add_point(j,i) < low_limit
            add_point(j,i) = low_limit;
        end
    end
end
