global  cur_sample_num sample_point
%%%%%%%%%%%%%%% Initialization %%%%%%%%%%%%%%%
%////////////// Integration ////////////////
sample_point           = []; % This is vector of sample point
sample_val             = []; % The value of sample point
add_point              = []; % This is vector of sample point
add_val                = []; % The value of sample point
best_val               = [];  % Best value in all sample point
best_num               = [];  % The index of best
%up_status              = []; % The status of up
%upper_limit           = []; % Upper limit of sample point
%lower_limit           = []; % lower limit of sample point
%sample_best_val_trans = []; % For caluculation of best value transition
%y_rbf                 = []; % ??
%sa_trans              = []; % ??
%sa_max_trans          = []; % ??
%count                  = 0;  % The count of iteration
%ix                    = 1;  % ??
C                      = 1;
count_sample_add       = 1;  % The count of additional sample point
up_status              = 1;
cur_sample_num         = ini_sample_num;
C_total                = ceil((max_sample_num-ini_sample_num) ...
                                /add_sample_num);
case_box=zeros(C_total,1);
suii=zeros(C_total,1);
%////////////// RBFN ////////////////
A=[];
teaching_value=[];
omega =[];

%%%%%%%%%%%%%%% Finish initialization %%%%%%%%%%%%%%%