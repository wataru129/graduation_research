%%%PSO-parameter%%%%%%%
particle  = 300;   %The number of Particle
Iteration = 1000;  % Max of reiteration
w_pso     = 0.729;
%%%%%%%%%%%%%%%%%%%%%%

x_init          = 5*IP(1:particle,1:dimension,T).';
v_init          = IP(1:particle,1:dimension,T).';
idx             = kmeans(x_init.',clusta);
class =zeros(clusta,1);
x_pso =zeros(dimension,clusta);
for c_index=1:clusta
%%%%%%%%%%%%%%%%%%%%%%Initialization%%%%%%%%%%%%%%%%%%%%%%%%%
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
    c1     = 1.4955 * ones(class(c_index),1);
    c2     = 1.4955 * ones(class(c_index),1);
    alpha             = zeros(class(c_index),1);
    flag              = 0;
    update_particle   = zeros(class(c_index),dimension);
    pbest   = x_p;
    fpbest=zeros(1,class(c_index));
    gbest=pbest(:,1);
    fgbest  = func_response_surface(gbest, cur_sample_num, omega, r, sample_point);
    for i=1:class(c_index)
        fpbest(i)=func_response_surface(pbest(:,i), cur_sample_num, omega, r, sample_point);
        if fpbest(i)<fgbest
            gbest=pbest(:,i);
            fgbest=fpbest(i);
        end
    end
%%%%%%%%%%%%%%%%%%%%%%Initialization%%%%%%%%%%%%%%%%%%%%%%%%%
    for k=1:Iteration
        temp_fpbest=zeros(1,class(c_index));
        for i=1:class(c_index)
            v_p(:,i)=w_pso*v_p(:,i)+c1(i)*rand*(pbest(:,i)-x_p(:,i))+c2(i)*rand*(gbest-x_p(:,i));
            x_p(:,i)=x_p(:,i)+v_p(:,i);
            %x_p(:,i)=Area_back(x_p(:,i));
            %v_p(:,i)=Area_back(v_p(:,i));
        end
            x_p(x_p>5)=5;
            x_p(x_p<-5)=-5;
            v_p(v_p>5)=5;
            v_p(v_p<-5)=-5;
        for i=1:class(c_index)
            temp_fpbest(i)=func_response_surface(x_p(:,i), cur_sample_num, omega, r, sample_point);
            if(temp_fpbest(i)<fpbest(i))
                pbest(:,i)=x_p(:,i);
                fpbest(i) = temp_fpbest(i);
            end
        end
        [now_best , ig] = min(fpbest);
        if now_best<fgbest
            flag= 1;
            update_particle(ig) = update_particle(ig) +1;
            gbest=pbest(:,ig);
            fgbest=fpbest(ig);
        end
        if flag ==0
            alpha = zeros(class(c_index),1);
        else
            for i=1:class(c_index)
                if update_particle(i) < update_particle(ig)
                  alpha(i) = 1/k;
                else
                  alpha(i) = 0;
                end
            end
        end
        flag = 0;
        c1 = c1 + alpha.* (c1(ig)*ones(1,class(c_index)) -c1);
        c2 = c2 + alpha.* (c1(ig)*ones(1,class(c_index)) -c2);
    end
    x_pso(:,c_index) = gbest;
end