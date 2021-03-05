cm=1;gNa=120;gk=36;gl=0.3;ENa=55;Ek=-72;El=-49.4;vr=-60;i=20;Em=0; st=0.05;ttotal=100;
%%
%%ﬁ”„  Ã
f={ @(t,v,n,m,h) (gk*n^4*(Ek-v)+gNa*m^3*h*(Em-v)+gl*(El-v)+i)/cm                , 
    @(t,v,n,m,h) (0.01*(10+vr-v))/exp((vr-v)/10)*(1-n)-0.125*exp((vr-v)/80)*n   , 
    @(t,v,n,m,h) (0.1*(25+vr-v))/exp((vr-v)/10+1.5)*(1-m)-4*exp((vr-v)/18)*m    ,
    @(t,v,n,m,h) 0.07*exp((vr-v)/10)*(1-h)-h/exp(4+(vr-v)/10) };
%%

%%ﬁ’„  œ
 v=linspace(-80,10,ttotal/st);
 nn=(0.01*(10+vr-v))./exp((vr-v)/10)./((0.01*(10+vr-v))./exp((vr-v)/10)+0.125*exp((vr-v)/80));
 mm=(0.1*(25+vr-v))./exp((vr-v)/10+1.5)./((0.1*(25+vr-v))./exp((vr-v)/10+1.5)+4*exp((vr-v)/18));
 hh=0.07*exp((vr-v)/10)./(0.07*exp((vr-v)/10)+1./exp(4+(vr-v)/10)) ;
 plot(v,nn);
 hold on;
 plot(v,mm);
 hold on;
 plot(v,hh);
 legend('n','m','h');
%%
%ﬁ”„  Â
  g0=[-60 ; 00 ; 00 ; 0];
  g = solver1(f,st,g0,ttotal);
  tplot= linspace(0,ttotal,ttotal/st);
  plot(tplot,g(1,:));
%%
%ﬁ”„  Ê
  g0=[-60 ; 00 ; 00 ; 0];
  g = solver2(f,st,g0,ttotal);
  tplot= linspace(0,ttotal,ttotal/st);
  plot(tplot,g(1,:));
%%
%ﬁ”„  Ê
  g0=[-60 ; 00 ; 00 ; 0];
  g = solver2(f,st,g0,ttotal);
  plot(g(2,1501:2000),g(1,1501:2000));

%%
%functions
%«Ê?·—
function g = solver1(f,st,g0,ttotal)
g=zeros(4,ttotal/st);
g(1,1)=g0(1,1);
g(2,1)=g0(2,1);
g(3,1)=g0(3,1);
g(4,1)=g0(4,1);
for i=2:ttotal/st
   for j=1:4
      g(j,i)=g(j,i-1)+st*f{j}((i-1)*st,g(1,i-1),g(2,i-1),g(3,i-1),g(4,i-1));
   end
end
end
%—Ê‰êÂ òÊ «
function g = solver2(f,h,g0,ttotal)
g=zeros(2,ttotal/h);
g(1,1)=g0(1,1);
g(2,1)=g0(2,1);
g(3,1)=g0(3,1);
g(4,1)=g0(4,1);
for i=2:ttotal/h
       k1=h*f{1}((i-1)*h,g(1,i-1),g(2,i-1),g(3,i-1),g(4,i-1));
       l1=h*f{2}((i-1)*h,g(1,i-1),g(2,i-1),g(3,i-1),g(4,i-1));
       s1=h*f{3}((i-1)*h,g(1,i-1),g(2,i-1),g(3,i-1),g(4,i-1));
       q1=h*f{4}((i-1)*h,g(1,i-1),g(2,i-1),g(3,i-1),g(4,i-1));
       k2=h*f{1}((i)*h,g(1,i-1)+k1,g(2,i-1)+l1,g(3,i-1)+s1,g(4,i-1)+q1);
       l2=h*f{2}((i)*h,g(1,i-1)+k1,g(2,i-1)+l1,g(3,i-1)+s1,g(4,i-1)+q1);
       s2=h*f{3}((i)*h,g(1,i-1)+k1,g(2,i-1)+l1,g(3,i-1)+s1,g(4,i-1)+q1);
       q2=h*f{4}((i)*h,g(1,i-1)+k1,g(2,i-1)+l1,g(3,i-1)+s1,g(4,i-1)+q1);
       g(1,i)=g(1,i-1)+0.5*(k1+k2);
       g(2,i)=g(2,i-1)+0.5*(l1+l2);
       g(3,i)=g(3,i-1)+0.5*(s1+s2);
       g(4,i)=g(4,i-1)+0.5*(q1+q2);
end
end