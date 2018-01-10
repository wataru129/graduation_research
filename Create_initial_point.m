%%%%%%%%%%%%%%% Setting initial point %%%%%%%%%%%%%%%
global sample_point
load InitialPoints_300_100_100
normal = IP(1:cur_sample_num,1:dimension,T);
normal = normal.';
for i = 1:cur_sample_num
    for j = 1:dimension
        add_point(j,i) = upper_limit * normal(j,i);
    end
end
sample_point = add_point;

for h = 1:cur_sample_num
    add_val(h) = Calculate_value(sample_point(:,h));
end
sample_val                  = add_val;
[best_val,index]              = min(sample_val);   %find best val

best_val =ones(1,clusta)*best_val;
for c_index=1:clusta
    best_sample_point(:,c_index)            = sample_point(:,index); %find best sample point
end
%%%%%%%%%%%%%%% Finish setting %%%%%%%%%%%%%%%