function f_out=Calculate_value(x,f_number)
    n=length(x); %xの次元
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

        case 6%Doublecone
            f_out = (1-1/(norm(x+2*ones(1,n))+1)) + (1-1/(2*norm(x-4*ones(1,n))+1));
        case 7%DoubleRosen
                fros1 = 0;
                fros2 = 0;
                x_hat = -2*(x+1);
                xl = x-0.5;
                I = 2;
                while I <= n
                fros1 = fros1 + 100*( x_hat(1)-x_hat(I).^2 ).^2 + ( x_hat(I)-1 ).^2;
                fros2 = fros2 + 100*( xl(1)-xl(I).^2 ).^2 + ( xl(I)-1 ).^2;
                I = I + 1;
                end
                f_out = f_out + min(fros1,fros2+0.1);
            case 8 %Six-hump Camelback (-0.0898,0.7126),(0.0898,-0.7126)
                f_out = (4-2.1.*(x(1).^2)+(1/3).*(x(1).^4)).*(x(1).^2)+x(1).*x(2)+(-4+4.*(x(2).^2)).*(x(2).^2);
            case 9 %Branin (-3.142,12.275) (3.142,12.275) (9.425,2.475)
                f_out = (x(2)-(5.1/(4*pi^2))*x(1).^2 + 5/pi*x(1)-6).^2 + 10*(1-(1/(8*pi)))*cos(x(1)) + 10;
            case 10 %Shubert
                f_out1 = 0;
                f_out2 = 0;
                for i = 1:5
                 f_out1 = f_out1 + i.*cos( (i+1).*x(1)+i );
                  f_out2 = f_out2 + i.*cos( (i+1).*x(2)+i );
              end
                 f_out = f_out1.*f_out2;
            case 11 %Ackley
                A = 0; B = 0;
                for i = 1:n
                 A = A + x(i)^2;
                    B = B + cos(2*pi*x(i));
                end
                f_out = -20*exp(-0.2*sqrt(0.5*(A)))-exp(0.5*(B))+20+exp(1);
            case 12 %Himmelblau's
                f_out = (x(1)^2+x(2)-11)^2 + (x(1)+x(2)^2-7)^2;
            case 13 %Double-Sphere
                fsph1 = sum((x-2.5).^2);
                fsph2 = sum((x+2.5).^2);
                f_out = f_out + min(fsph1,fsph2);
            case 14 %Triple-Sphere
                fsph0 = sum(x.^2);
                fsph1 = sum((x-2.5).^2);
                fsph2 = sum((x+2.5).^2);
                MIN = [fsph0,fsph1,fsph2];
                f_out = f_out + min(MIN);
            case 15 %Quadruple-Sphere
                A = zeros(1,n);
                A(1:2:n) =  2.5;
                A(2:2:n) = -2.5;
                fsph1 = sum((x-2.5).^2);
                fsph2 = sum((x+2.5).^2);
                fsph3 = sum((x-A).^2);
                fsph4 = sum((x+A).^2);
                MIN = [fsph1,fsph2,fsph3,fsph4];
                f_out = f_out + min(MIN);
            case 16 %Quintuple-Sphere
                A = zeros(1,n);
                A(1:2:n) =  2.5;
                A(2:2:n) = -2.5;
                fsph0 = sum(x.^2);
                fsph1 = sum((x-2.5).^2);
                fsph2 = sum((x+2.5).^2);
                fsph3 = sum((x-A).^2);
                fsph4 = sum((x+A).^2);
                MIN = [fsph0,fsph1,fsph2,fsph3,fsph4];
                f_out = f_out + min(MIN);
    end
end
