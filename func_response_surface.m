function  value  = func_response_surface(x, cur_sample_num, omega, r, sample_point)
    value=0;
    x_ex = repelem(x,1,cur_sample_num) ;
    value = exp(-sum((x_ex - sample_point).^2) / (r^2)) * omega;
end
