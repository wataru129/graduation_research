function  value  = func_response_surface(x, cur_sample_num, omega, r, sample_point)
%    global dimension cur_sample_num omega r sample_point
    value=0;
    %d =zeros(10,cur_sample_num);
    for g=1:cur_sample_num
        value = value + omega(g) * ...
            exp(- sum((x - sample_point(:,g)).^2) / (r^2));
    end
    %value = sum(omega * exp(- sum((x - sample_point).^2) / (r^2)));
    %d = x - sample_point;
    %d = d / r^2;
    %value = sum(omega.'*(exp(-sum(d))).');
    
end
