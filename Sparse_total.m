candidate=[];
sample_distance_max = [];
total_point = [];
sparse_rand_num =100;
sample_distance=zeros(sparse_rand_num,1);
total_point = [sample_point add_temp];

%Create random point for additional point
candidate= -5 + (5 - (-5))*rand(dimension,sparse_rand_num);

%Caluculate total distance
for J=1:sparse_rand_num
    candidate_ex    = repelem(candidate(:,J) ,1,cur_sample_num+size(add_temp,2));
    sample_distance(J) = sum(sqrt(sum((candidate_ex-total_point).*2)));
end

%Select max distance point
[sample_distance_max index] = max(sample_distance);
selected_point              = candidate(:,index);
add_temp(:,S+N_good)        = selected_point;
%sp_count             = sp_count + 1;

