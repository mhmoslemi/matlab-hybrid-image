%%
close all
clc
clear all

order=31
w_ap=zeros(order);
w_ap((order+1)/2,(order+1)/2)=1;
w_lp=ones(order)/order^2;
w_hp=w_ap-w_lp;



cat_pic=(imread('hw2matlab\cat.jpg'));
gray_cat=rgb2gray(cat_pic);

ch1=cat_pic(:,:,1);
ch2=cat_pic(:,:,2);
ch3=cat_pic(:,:,3);
ch1f_cat=imfilter(ch1,w_lp);
ch2f_cat=imfilter(ch2,w_lp);
ch3f_cat=imfilter(ch3,w_lp);
gray_cat_filtered=imfilter(gray_cat,w_lp);


dog_pic=(imread('hw2matlab\dog.jpg'));
gray_dog=rgb2gray(dog_pic);

ch1=dog_pic(:,:,1);
ch2=dog_pic(:,:,2);
ch3=dog_pic(:,:,3);
ch1f_dog=imfilter(ch1,w_hp);
ch2f_dog=imfilter(ch2,w_hp);
ch3f_dog=imfilter(ch3,w_hp);
gray_dog_filtered=imfilter(gray_dog,w_hp);

final=imadd(gray_dog_filtered,gray_cat_filtered);

ch1=imadd(ch1f_cat,ch1f_dog);
ch2=imadd(ch2f_cat,ch2f_dog);
ch3=imadd(ch3f_cat,ch3f_dog);
recover=cat(3,ch1,ch2,ch3);



set(gcf, 'Position',  [300, 200, 600, 600])



near = imresize(final, 8);
far=imresize(final, .2);
%subplot(2,1,1)
imshow(far)
title('far')
%subplot(2,1,2)
imshow(near)
title('near')

