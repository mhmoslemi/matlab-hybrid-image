function Y = myimagebinary(y)
y=rgb2gray(y);
Y=imbinarize(y);
end