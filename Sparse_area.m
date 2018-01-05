if best_case == 1
%///Case of estimate near x_pso ///%
    iteration = ceil(N_sparse/3);
else
%///Case of estimate near x_best ///%
    iteration = ceil((add_sample_num-floor(N_good/2)-1)/3);
end
sp_count=1;
for J1=1:iteration
%Add point by 2 method
    Sparse_total
    %End determination of Sprinkle a point in sparse area
    if sp_count == N_sparse
        break
    end
    Sparse_total
    %End determination of Sprinkle a point in sparse area
    if sp_count == N_sparse
        break
    end
    Sparse_congestion
    %End determination of Sprinkle a point in sparse area
    if sp_count == N_sparse
        break
    end
end
%size(add_point)
add_point=[add_point add_point_temp x_pso];