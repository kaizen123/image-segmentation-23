clc;
clear;
close all;
imtool close all;
workspace;
fontSize=16;
sdirectory = 'DynamicImages';
tifffiles = dir([sdirectory '/*.jpg']);
for totalimage = 1:length(tifffiles)
filename = [sdirectory '/' tifffiles(totalimage).name];
I=imread(filename);
I=rgb2gray(I);
Iblur=imgaussfilt(I,1.4);
Input=imsharpen(Iblur);
figure,imshow(Input);title('SharpenedImage');
cropped=imcrop(Input);
figure,imshow(cropped);
matfileC=sprintf('C:/Users/OPDBPGL-3/Documents/MATLAB/SVIP/Featuresfull/Cropped/%s.mat',tifffiles(totalimage).name);
 save(matfileC,'cropped')
 cropped=histeq(cropped);
midpointforsegment=fix(size(cropped,2)/2);
Leftsegment=cropped(:,1:midpointforsegment,:);
Rightsegment=cropped(:,midpointforsegment+1:end,:);
matfileL=sprintf('C:/Users/OPDBPGL-3/Documents/MATLAB/SVIP/Featuresfull/Left/%s.mat',tifffiles(totalimage).name);
 save(matfileL,'Leftsegment');
 matfileR=sprintf('C:/Users/OPDBPGL-3/Documents/MATLAB/SVIP/Featuresfull/Right/%s.mat',tifffiles(totalimage).name);
 save(matfileR,'Rightsegment');
 close all;
end
