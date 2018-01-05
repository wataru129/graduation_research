global omega r
%%%%%%%%%%%%%%%%%%%%%% Initial setting  %%%%%%%%%%%%%%%%%%%%%%%
H=zeros(cur_sample_num,cur_sample_num);
d_max=0;
%////////////////////Parameter setting////////////////////%
ramuda=10.^(-2)*eye(cur_sample_num,cur_sample_num);
%//////////////////// Create rbf midle and teaching data ////////////////////%

for h=1:cur_sample_num
    sample_val(h)=Calculate_value(sample_point(:,h));
end
%%%%%%%%%%%%%%%%%%%%%% RBFN main program  %%%%%%%%%%%%%%%%%%%%%%%
%//////////////////// caluculate_dmax ////////////////////%
for j = 1:cur_sample_num
    for j1=j+1:cur_sample_num
        RBFN_distance(j,j1-1)=sum((sample_point(:,j)-sample_point(:,j1)).^2);
    end
end
d_max=sqrt(max(max((RBFN_distance))));
%//////////////////// caluculate r ////////////////////%
if dimension == 2
    r=d_max/(sqrt(cur_sample_num*dimension)^(1/dimension));
else
    r=d_max/(sqrt(dimension)*(sqrt(cur_sample_num).^(1/dimension)));
end
if r==0
    r=0.5;
end
%////////////////////caluculate H ////////////////////%
for j=1:cur_sample_num
    for j1=1:cur_sample_num
        H(j,j1)=exp(-(sum((sample_point(:,j)-sample_point(:,j1)).^2))/(r.^2));
    end
end
%////////////////////caluculate w ////////////////////%
A=H'*H+ramuda;
A_inv =inv(A);
omega=A_inv*H'*sample_val.';