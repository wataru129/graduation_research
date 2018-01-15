function  value  = func_response_surface(x, cur_sample_num, omega, r, sample_point)
    value=0;
    %{
    for g=1:cur_sample_num
        value = value + omega(g) * ...
            exp(- sum((x - sample_point(:,g)).^2) / (r^2));
    end
    value = sum(tmp_value);
%}
    x_ex = x *ones(1,cur_sample_num);
    value = exp(-sum((x_ex - sample_point.^2)) / (r^2)) * omega;
end
