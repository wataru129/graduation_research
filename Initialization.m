%global  cur_sample_num sample_point
%%%%%%%%%%%%%%% Initialization %%%%%%%%%%%%%%%
%////////////// Integration ////////////////
sample_point           = []; % This is vector of sample point
sample_val             = []; % The value of sample point
add_point              = []; % This is vector of sample point
add_val                = []; % The value of sample point
best_val               = [];  % Best value in all sample point
best_num               = [];  % The index of best

C                      = 1;
count_sample_add       = 1;  % The count of additional sample point
up_status              = ones(clusta,1);
cur_sample_num         = ini_sample_num;
C_total                = ceil((max_sample_num-ini_sample_num) ...
                                /add_sample_num);
case_box=zeros(C_total,1);
suii=zeros(C_total,clusta);
result_pso =zeros(dimension,clusta,C_total);
Cr               = ones(clusta)*1;    %Concentrated Search parameter

%%%%%%%%%%%%%%% Finish initialization %%%%%%%%%%%%%%%