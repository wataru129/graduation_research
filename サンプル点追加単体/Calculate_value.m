function f_out=Calculate_value(x)
%ベンチマーク問題
global f_number;
n=length(x); %xの次元
%disp(n);
%disp(f_number);
f_out=0;
    switch f_number
        case 1 %%% 対象1 %%%
            for i=1:n
                f_out=f_out+x(i)^2;
            end
        case 2 %%% 対象2 %%%
            for i=1:n-1
                f_out=f_out+(100*((x(i)^2-x(i+1))^2)+(1-x(i))^2);
            end
        case 3 %%% 対象3 %%%
            for i=1:n
                f_out=f_out+(x(i)^4-16*x(i)^2+5*x(i));
            end
        case 4 %%% 対象4 %%%
            for i=1:n
                f_out=f_out+(x(i)^2-10*cos(2*pi*x(i))+10);
            end
        case 5 %%% 対象5 %%%
            for i=1:n
                tmp=0;
                for j=1:i
                    tmp=tmp+x(j);
                end
                f_out=f_out+tmp^2;
            end
    end
end
