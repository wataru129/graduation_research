global  cur_sample_num sample_point
%%%%%%%%%%%%%%%%% Evaluate of additional point %%%%%%%%%%%%%%%%%%%%%%%
add_val = [];
for h = 1:add_sample_num
%/// caluculate value only addtional point ///%
    add_val(h) = Calculate_value(add_point(:,h));
end
[add_val_min index] = min(add_val); %Find best in add point
if  best_val > add_val_min
    %/// Case of addition is beeter ///%
    best_sample_point   = add_point(:,index);
    best_val            = add_val_min;
    up_status           = 1;
else
    %/// Case of addition is worse ///%
    up_status = 0;
end

sample_point         = [sample_point add_point];   %Combine point
sample_val           = [sample_val add_val]; %Combine point value
cur_sample_num       = cur_sample_num ...
                       + add_sample_num;       %Update point number
C                    = C+1;