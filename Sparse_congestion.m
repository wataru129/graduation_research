add_point_temp_c=[];
sample_point_ex = sample_point;
sample_point_ex = [sample_point_ex add_point_temp];
sort_point = sort(sample_point_ex,1);
for i = 1:size(sample_point_ex,2)-1
    for j = 1:dimension
        add_point_temp_c(j,i) = abs(sort_point(j,i+1)-sort_point(j,i));
    end
end

[distance_max index] = max(add_point_temp_c);
for j = 1:dimension
    selected_point(j) = sort_point(index(j),j)+distance_max(j)./2;
end
add_point_temp(:,sp_count)=selected_point;
%sp_count             = sp_count + 1;