%%%PSO-parameter%%%%%%%
w_pso   = 0.729;
%w_pso   = 0.7;
c1      = 1.4955;
c2      = 1.4955;
m       = 300;   %The number of Particle
k_max   = 1000;  % Max of reiteration
%%%%%%%%%%%%%%%%%%%%%%

%%%PSO-Algolism%%%%%
x_init          = 5*IP(1:m,1:dimension,T).';
v_init          = IP(1:m,1:dimension,T).';
idx             = kmeans(x_init.',clusta);
for c_index=1:clusta
    ct             = 1;
    class(c_index) = size(find(idx == c_index),1);
    x_p              = zeros(dimension,class(c_index));
    v_p              = zeros(dimension,class(c_index));
    for i=1:class(c_index)
        if idx(i)==c_index
            x_p(:,ct)= x_init(:,i);
            v_p(:,ct)= v_init(:,i);
            ct     = ct + 1;
        end
    end
    pbest   = x_p;
    fpbest=zeros(1,m);
    gbest=pbest(:,1);
    fgbest  = func_response_surface(gbest, cur_sample_num, omega, r, sample_point);
    for i=1:class(c_index)
        fpbest(i)=func_response_surface(pbest(:,i), cur_sample_num, omega, r, sample_point);
        if fpbest(i)<fgbest
            gbest=pbest(:,i);
            fgbest=fpbest(i);
        end
    end
    for k=1:k_max
        w_pso=1/(8*k)+0.7;
        temp_fpbest=zeros(1,m);
        for i=1:class(c_index)
            v_p(:,i)=w_pso*v_p(:,i)+c1*rand*(pbest(:,i)-x_p(:,i))+c2*rand*(gbest-x_p(:,i));
            x_p(:,i)=x_p(:,i)+v_p(:,i);
            for j = 1:dimension
                if x_p(j,i) > upper_limit
                    x_p(j,i) = upper_limit;
                elseif v_p(j,i) > upper_limit
                    v_p(j,i) = upper_limit;
                elseif x_p(j,i) < low_limit
                    x_p(j,i) = low_limit;
                elseif v_p(j,i) < low_limit
                    v_p(j,i) = low_limit;
                end
            end
%%%Step 3%%%%pbest,gbest[update]
            temp_fpbest(i)=func_response_surface(x_p(:,i), cur_sample_num, omega, r, sample_point);
            if(temp_fpbest(i)<fpbest(i))
                pbest(:,i)=x_p(:,i);
                fpbest(i) = temp_fpbest(i);
                if pbest(i)<fgbest
                    gbest=pbest(:,i);
                    fgbest=fpbest(i);
                end
            end
        end
    end
    x_pso(:,c_index) = gbest;
end
result_pso(:,:,C)    = x_pso;