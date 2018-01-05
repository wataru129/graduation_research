currentCharacterEncoding = slCharacterEncoding();
slCharacterEncoding('UTF-8')
clear
global plotx  f_number count;
T   = 50;   %Max of challenge
for S=1:T
  load InitialPoints_300_100_100
  f_number=3;
%%%PSO-parameter%%%
  %w   = 0.729;
  %w   = 0.665;
  c1  = 1.4955;
  c2  = 1.4955;
  count=0;
%%%%%%%%%%%%%%%%%%
%%%PSO-Algolism%%%%%
%%%Step 0%%%Prepare
  n       = 50;   %dimension
  m       = 20;   %The number of Particle
  k_max   = 100;  % Max of reiteration
  k       = 1;    %initial value of reiteration
%%%Step 1%%%%Reset of initial value
  [r1,r2] = region(f_number);   %Area of x
  x       = r2*IP(1:m,1:n).';    %initial point r2=(|r1|+|r2|)/2
  v       = IP(1:m,1:n).';       %initial velocity
  pbest   = x;               %Best x in the diviual particle
  plotx   = zeros(n,m,k);
  i=1;
  fpbest=zeros(1,m);
  gbest=pbest(:,1);
  fgbest  = benchi_f(gbest);
  while i<m+1
    fpbest(1,i)=benchi_f(pbest(:,i));
    if fpbest(1,i)<fgbest
        gbest=pbest(:,i);
        fgbest=fpbest(1,i);
    end
    i=i+1;
  end

%%%Step 2%%%%x,v[update]

  while(k<k_max+1)
      w=1/(2*k)+0.6;
    i=1;
    while(i<m+1)
      j=1;
      while(j<n+1)
        v(j,i)=w*v(j,i)+c1*rand*(pbest(j,i)-x(j,i))+c2*rand*(gbest(j)-x(j,i));
        x(j,i)=x(j,i)+v(j,i);
        j=j+1;
      end
    i=i+1;
    end
%%%Step 3%%%%pbest,gbest[update]
    i=1;
    temp_fpbest=zeros(1,m);
    while(i<m+1)
      plotx(:,i,k)=x(:,i);
      temp_fpbest(1,i)=benchi_f(x(:,i));
      if(temp_fpbest(1,i)<fpbest(1,i))
        pbest(:,i)=x(:,i);
        if fgbest>temp_fpbest(1,i)
          gbest=x(:,i);
          fgbest=temp_fpbest(1,i);
        end
      end
      i=i+1;
    end
%%%For plot%%%%
    Act(k)=0;
    for i=1:m
        tmp=0;
        for j=1:n
            tmp=tmp+v(j,i).^2;
        end
        Act(k)=Act(k)+tmp;
    end
    plot_gbest(k)=benchi_f(gbest);
    Act(k)=sqrt(Act(k)/(m*n));
%%%Step 4%%%%k addition
    k=k+1;
  end
most=benchi_f(gbest);
good(S)=most;
end
%%%%%OUTPUT%%%%
disp(f_number);
disp(n);
disp(count);
heikin  = mean2(good)
nice    = min(good)
bad     = max(good)
hennsa  = std(good)

figure(1)
    z=1:k_max;
    %ax1 = subplot(2,1,1);
    subplot(2,1,1);
    plot(z,plot_gbest)
    set(0,'DefaultTextInterpreter','latex');
    %%%%%軸の設定%%%%%%
    ylabel('$f(gbest)$');
    set(gca,'Fontname','Times New Roman');
    set(gca,'FontSize',18);
    %ylim([0 1000]);
    %%%%%軸の設定%%%%%%
    subplot(2,1,2)
    %hold(ax1,'on')
    %hold on
    plot(z,Act)
    set(0,'DefaultTextInterpreter','latex');
    %%%%%軸の設定%%%%%%
    xlabel('$k$ ');
    ylabel('$Act$');
    set(gca,'Fontname','Times New Roman');
    set(gca,'FontSize',18);
    ylim([0 10]);
    %%%%%サイズ指定%%%%%
    set(gca,'Fontname','Times New Roman')
    width  = 700;
    height = 600;
    set(gcf,'PaperPositionMode','auto')
    pos=get(gcf,'Position');
    pos(3)=width-1; % なぜか幅が1px増えるので対処
    pos(4)=height;
    set(gcf,'Position',pos);
    %%%%%サイズ指定%%%%%
    %}