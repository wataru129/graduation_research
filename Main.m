clear
global dimension f_number
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Explain using Calculate_valuetion or Script %%%%%%%%%%%
%{
********** These are method of using for elemnts **********
ceil(x)              => Return the nearest x positive integer
Initialization       => Initialization of parameter
Range                => Make existing area respond to problem
Calculate_value      => Return value respond to argument
Create_initial_point => Create initial point from setting

********** Elemnts of Integreation Optimization **********
RBFN                 => This is modeling method we used this time
PSO                  => This is optimization method we used this time
Add_sample_point     => This is add samle point
Evaluate_Update      => This is evaluation and updating for add point
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% Parameter setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dimension        = 10;   %The dimension of program
ini_sample_num   = 50;   %The number of initial sample point
add_sample_num   = 10;   %The number of addtional sample point
max_sample_num   = 300;  %The number of max sample point
Cr               = 10;    %Concentrated Search parameter
f_number         = 3;
T_max            = 10;
result_point = zeros(dimension,T_max);
result = zeros(T_max,1);
%%%%%%%%%%%%%%%%%%%% Finish parameter setting %%%%%%%%%%%%%%%
Range

for T=1:T_max
    disp(T);
    Initialization
    Create_initial_point
%%%%%%%%%%%%%%% START MAIN PROGRAM %%%%%%%%%%%%%%%
    while max_sample_num > cur_sample_num
        RBFN
        pso_kmeans_xclusta
        Add_point
        Evaluate_Update
        suii(C)=Calculate_value(best_sample_point);
    end
    result_point(:,T) = best_sample_point;
    result(T) = Calculate_value(best_sample_point);
end
%%%%%%%%%%%%%%% FINISH MAIN PROGRAM %%%%%%%%%%%%%%%

heikin  = mean2(result)
nice    = min(result)
bad     = max(result)
hennsa  = std(result)