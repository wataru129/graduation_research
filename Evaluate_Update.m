%global  cur_sample_num sample_point
%%%%%%%%%%%%%%%%% Evaluate of additional point %%%%%%%%%%%%%%%%%%%%%%%
add_val = [];
for c_index =1:clusta
    %/// caluculate value only addtional point ///%
    for h = 1:per_clusta
        add_val(h,c_index) = Calculate_value(add_point(:,h,c_index),f_number);
    end
    [add_val_min index] = min(add_val(:,c_index)); %Find best in add point
    if  best_val(c_index) > add_val_min
    %/// Case of addition is beeter ///%
        best_sample_point(:,c_index) = add_point(:,index,c_index);
        best_val(c_index)            = add_val_min;
        up_status(c_index)           = 1;
    else
    %/// Case of addition is worse ///%
        up_status(c_index) = 0;
    end
    sample_point         = [sample_point add_point(:,:,c_index)];   %Combine point
    sample_val           = [sample_val add_val(:,c_index).']; %Combine point value
end

cur_sample_num       = cur_sample_num ...
                       + add_sample_num;       %Update point number
C                    = C+1;