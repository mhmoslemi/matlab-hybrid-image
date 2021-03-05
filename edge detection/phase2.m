
%% part a & b
clear all
clc
close all

v=[-1;1;-1;-1;1;1];

w=  [1     0     0     0     0    -1;
-1     1     0     0     0     0;
0    -1     1     0     0     0;
0     0    -1     1     0     0;
0     0     0    -1     1     0;
0     0     0     0    -1     1];

v_dif=w*v;


subplot(211)
plot(v); grid on
title(' vector v');

subplot(212)
stem(v_dif,'linewidth',1.1) ; grid on; 
title(' differential of vector v')

%% part c
close all
clc

v_p=v+abs(v);
v_dp=logical(v_dif+abs(v_dif));

subplot(211)
imagesc(v');  colormap(gray)
title(' vector v');
subplot(212)
imagesc(v_dp');  colormap(gray)
title(' differential of vector v')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% d
clear all
clc
close all

img=imread('zebra.jpg');
img_b=myimagebinary(img);  
subplot(121)
imshow(img)
subplot(122)
imshow(img_b)


%% e 
close all
clc

[m,n]=size(img_b);

W1=eye(n); W1(1,end)=-1;
tmp=-eye(n-1); tmp=[tmp; zeros(1,n-1);];
tmp=tmp'; tmp=[zeros(1,n); tmp];
W1=W1+tmp;


horizontal=[];
for i=[1:m]
   s=img_b(i,:);
   s=s';
   s_dif=W1*s;
   s_dif=s_dif';
   horizontal=[horizontal; s_dif];
   
end

%% f


W2=eye(m); W2(1,end)=-1;
tmp=-eye(m-1); tmp=[tmp; zeros(1,m-1);];
tmp=tmp'; tmp=[zeros(1,m); tmp];
W2=W2+tmp;


vertical=[];
for i=[1:n]
   s=img_b(:,i);
   s_dif=W2*s;
   vertical=[vertical s_dif];
end

%% g
close all
edge= sqrt(vertical.^2+horizontal.^2);
imshow(edge)



