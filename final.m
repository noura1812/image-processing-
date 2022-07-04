function varargout = final(varargin)
% FINAL MATLAB code for final.fig
%      FINAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
%
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 24-Dec-2021 15:33:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ww=get(handles.edit1,'string');
if isempty(ww)
x1=handles.img;
else 
    x1=imread(ww);
    imshow(x1, [], 'Parent', handles.axes1);
end
v=get(handles.popupmenu1,'value');
if v==1
    %imshow(x1);
    imshow(x1, [], 'Parent', handles.axes2);
%rgb2gray
elseif v==2
x=x1;
[h w l]=size (x);
gray=zeros(h,w);
gray=double(gray);
for i=l:h
    for j=l:w
        gray(i,j)=(x(i,j,1)+x(i,j,2)+x(i,j,3))/3;
    end
end
gray=uint8(gray);
%imshow(gray);
imshow(gray, [], 'Parent', handles.axes2);

%gray2binaty
elseif v==3
    
img=x1;
[h,w]=size(img);
bin=zeros(h,w);

for i=1:h
    for j=1:w
        if(img(i,j)>128)
            bin(i,j)=1;
        end
        if(img(i,j)<128)
            bin(i,j)=1;
        end
    end
end
bin=logical(bin);
%imshow(bin);
imshow(bin, [], 'Parent', handles.axes2);

%rgb2binary
elseif v==4
    img=x1;
[h, w, l]=size(img);
gray=zeros(h,w);
gray=double(gray);
for i=l:h
    for j=l:w
        gray(i,j)=(img(i,j,1)+img(i,j,2)+img(i,j,3))/3;
    end
end
gray=uint8(gray);
[h,w]=size(gray);
bin=zeros(h,w);

for i=1:h
    for j=1:w
        if(img(i,j)>128)
            bin(i,j)=1;
        end
        if(img(i,j)<128)
            bin(i,j)=0;
        end
    end
end
bin=logical(bin);
%imshow(bin);
imshow(bin, [], 'Parent', handles.axes2);
%negative
elseif v==5
    imag=x1;
   [h,w,l]=size(imag);

negativ_gray=zeros(h,w);

for i=1:h
    for j=1:w     
         if l==3
                    
               negativ_gray(i,j,1)=(255-imag(i,j,1));
               negativ_gray(i,j,2)=(255-imag(i,j,2));
               negativ_gray(i,j,3)=(255-imag(i,j,3));
                else
               negativ_gray(i,j)=255-imag(i,j);
              
         end
    end
end
negativ_gray=uint8(negativ_gray);
%imshow(negativ_gray);
imshow(negativ_gray, [], 'Parent', handles.axes2);

%brightness
elseif v==6
       imag=x1;
   [h,w,l]=size(imag);

negativ_gray=zeros(h,w);

for i=1:h
    for j=1:w     
         if l==3
                    
               negativ_gray(i,j,1)=(100+imag(i,j,1));
               negativ_gray(i,j,2)=(100+imag(i,j,2));
               negativ_gray(i,j,3)=(100+imag(i,j,3));
                else
               negativ_gray(i,j)=100+imag(i,j);
              
                end
    end
end
negativ_gray=uint8(negativ_gray);
%imshow(negativ_gray);
imshow(negativ_gray, [], 'Parent', handles.axes2);
%histogram
elseif v==7
    img=x1;
    hist=zeros(256,1);
    [H W L]=size(img);
    for i=1:H
        for j=1:W
            if L==3
                hist(img(i,j,1)+1)=hist(img(i,j,1)+1)+1;
                hist(img(i,j,2)+1)=hist(img(i,j,2)+1)+1;
                hist(img(i,j,3)+1)=hist(img(i,j,3)+1)+1;
            end
            hist(img(i,j)+1)=hist(img(i,j)+1)+1;
        end
    end
    bar(hist)
    %imshow(hist, [], 'Parent', handles.axes2);
    %stritching
elseif v==8
    img=x1;
    [H W L]=size(img);
    if L==3
        img = rgb2gray(img);
    end
    new_min=1;
    new_max=255;
    new_img=zeros(H,W);
    new_img=double(new_img);
    old_min=min(min(img));
    old_max=max(max(img));
    
    for i=1:H
        for j=1:W
            new_img(i,j)= ((img(i,j)-old_min)./(old_max-old_min))*(new_max-new_min)+new_min;
        end
    end
    
    new_img=uint8(new_img);
    %imshow(new_img);
    imshow(new_img, [], 'Parent', handles.axes2);
    %log
elseif v==9
    imag=x1;
    [h,w,l]=size(imag);
loge_gray=zeros(h,w);
imag=im2double(imag);
    for i=1:h
    for j=1:w
       
           if l==3
               loge_gray(i,j,1)=10*log(imag(i,j,1)+1);
               loge_gray(i,j,2)=10*log(imag(i,j,2)+1);
               loge_gray(i,j,3)=10*log(imag(i,j,3)+1);
           else
                loge_gray(i,j)=2*log(imag(i,j)+1);
           end 
    end
    end
    %imshow(loge_gray);
    imshow(loge_gray, [], 'Parent', handles.axes2);
    %gamma
elseif v==10
     imag=x1;
    [h,w,l]=size(imag);
power_rgb=zeros(h,w);
imag=im2double(imag);
    for i=1:h
    for j=1:w
       
           if l==3
              power_rgb(i,j,1)=power(imag(i,j,1),2);
               power_rgb(i,j,2)=power(imag(i,j,2),2);
               power_rgb(i,j,3)=power(imag(i,j,3),2);
              else
               power_rgb(i,j)=power(imag(i,j),2);
           end
    end
    end
   % imshow(power_rgb);
     imshow(power_rgb, [], 'Parent', handles.axes2);
     
     %equalization
elseif v==11
    img=x1;
    [h, w, k]=size(img);
gray=zeros(1,256);
re=zeros(1,256);
ge=zeros(1,256);
be=zeros(1,256);
p=zeros(1,256);
p1=zeros(3,256);
s=zeros(1,256);
s1=zeros(3,256);
mn=h*w;
l=255;
d=0;
rr=0;
gg=0;
bb=0;
for i=1:h
    for j=1:w
        if k==3
          re(img(i,j,1)+1)=re(img(i,j,1)+1)+1;
          ge(img(i,j,2)+1)=re(img(i,j,2)+1)+1;
          be(img(i,j,3)+1)=re(img(i,j,3)+1)+1;
        else
        gray(img(i,j)+1)=gray(img(i,j)+1)+1;
        end
    end
end

for i=1:256
    if k==3
    p1(1,i)=re(i)/mn;
    p1(2,i)=ge(i)/mn;
    p1(3,i)=be(i)/mn;
    else
    p(i)=gray(i)/mn;
    end  
end

for i=1:256
    if k==3
    rr=rr+p1(1,i);
    s1(1,i)=l*rr;
    
    gg=gg+p1(2,i);
    s1(2,i)=l*rr;
    
    bb=bb+p1(3,i);
    s1(3,i)=l*rr;
    else
    d=d+p(i);
    s(i)=l*d;
    end
end
if k==3
    fix(s1);
bar(s1)
else
fix(s);
bar(s)
%imshow(s, [], 'Parent', handles.axes2);
end

%mean
elseif v==12
    img=x1;
    [h, w, mm]=size(img);
g=ones(7);
g=g*(1/49);
imag=zeros(h+3,w+3);
imag=double(imag);
rr=0;
gg=0;
bb=0;
mask=zeros(h+3,w+3);
mask=double(mask);
for i=1:h+3
    for j=1:w+3
       
        if(i>3&&i<=h)
            if(j>3&&j<=w)
                if mm==1 
            imag(i,j)=img(i,j);
                else
                    imag(i,j,1)=img(i,j,1);
                    imag(i,j,2)=img(i,j,2);
                    imag(i,j,3)=img(i,j,3);
                end
            end
        end  
    end
end
q=1;
dd=0;
    for i=4:h
        for j=4:w
            for m=-3:3
                for k=-3:3
                    if mm==3
                    rr=rr+imag(i+m,j+k,1)*g(q);
                    gg=gg+imag(i+m,j+k,2)*g(q);
                    bb=bb+imag(i+m,j+k,3)*g(q);
                    q=q+1;
                    else
                    dd=dd+imag(i+m,j+k)*g(q);
                    q=q+1;
                    end
                end      
            end
            if mm==3
                mask(i,j,1)=rr;
            mask(i,j,2)=gg;
            mask(i,j,3)=bb;
            rr=0;
            gg=0;
            bb=0;
            q=1;
            else
            mask(i,j)=dd;
            dd=0;
            q=1;
            end
        end 
    end
mask=uint8(mask);
%imshow(mask);   
imshow(mask, [], 'Parent', handles.axes2);
%pont detection
elseif v==13
     img=x1;
    [h, w, mm]=size(img);
imag=zeros(h+3,w+3);
imag=double(imag);
mask=zeros(h+3,w+3);
mask=double(mask);
for i=1:h+3
    for j=1:w+3
       
        if(i>3&&i<=h)
            if(j>3&&j<=w)
                if mm==1 
            imag(i,j)=img(i,j);
                else
                    imag(i,j,1)=img(i,j,1);
                    imag(i,j,2)=img(i,j,2);
                    imag(i,j,3)=img(i,j,3);
                end
            end
        end  
    end
end
for i=4:h
        for j=4:w   
            if mm==3
                mask(i,j,1)=imag(i+1,j,1)+imag(i-1,j,1)+imag(i,j+1,1)+imag(i,j-1,1)-4*imag(i,j,1); 
                mask(i,j,2)=imag(i+1,j,2)+imag(i-1,j,2)+imag(i,j+1,2)+imag(i,j-1,1)-4*imag(i,j,2); 
                mask(i,j,3)=imag(i+1,j,3)+imag(i-1,j,3)+imag(i,j+1,3)+imag(i,j-1,3)-4*imag(i,j,3); 

            else
                
            mask(i,j)=imag(i+1,j)+imag(i-1,j)+imag(i,j+1)+imag(i,j-1)-4*imag(i,j);    
            end
        end 
end   
mask=uint8(mask);
%imshow(mask);
imshow(mask, [], 'Parent', handles.axes2);
 %line detection
 
elseif v==14
  img=x1;
    [h, w, mm]=size(img);
imag=zeros(h+3,w+3);
imag=double(imag);
mask=zeros(h+3,w+3);
mask=double(mask);
for i=1:h+3
    for j=1:w+3
       
        if(i>3&&i<=h)
            if(j>3&&j<=w)
                if mm==1 
            imag(i,j)=img(i,j);
                else
                    imag(i,j,1)=img(i,j,1);
                    imag(i,j,2)=img(i,j,2);
                    imag(i,j,3)=img(i,j,3);
                end
            end
        end  
    end
end
for i=4:h
        for j=4:w  
            if mm==3
             mask(i,j,1)=abs((imag(i-1,j+1,1)+2*imag(i,j+1,1)+imag(i+1,j+1,1))-(imag(i-1,j-1,1)+2*imag(i,j-1,1)+imag(i+1,j-1,1)))+abs((imag(i+1,j-1,1)+2*imag(i+1,j,1)+imag(i+1,j+1,1))-(imag(i-1,j-1,1)+2*imag(i-1,j,1)+imag(i-1,j-1,1)));  
             mask(i,j,2)=abs((imag(i-1,j+1,2)+2*imag(i,j+1,2)+imag(i+1,j+1,2))-(imag(i-1,j-1,2)+2*imag(i,j-1,2)+imag(i+1,j-1,2)))+abs((imag(i+1,j-1,2)+2*imag(i+1,j,2)+imag(i+1,j+1,2))-(imag(i-1,j-1,2)+2*imag(i-1,j,2)+imag(i-1,j-1,2))); 
             mask(i,j,3)=abs((imag(i-1,j+1,3)+2*imag(i,j+1,3)+imag(i+1,j+1,3))-(imag(i-1,j-1,3)+2*imag(i,j-1,3)+imag(i+1,j-1,3)))+abs((imag(i+1,j-1,3)+2*imag(i+1,j,3)+imag(i+1,j+1,3))-(imag(i-1,j-1,3)+2*imag(i-1,j,3)+imag(i-1,j-1,3))); 
             
            else
                
            mask(i,j)=abs((imag(i-1,j+1)+2*imag(i,j+1)+imag(i+1,j+1))-(imag(i-1,j-1)+2*imag(i,j-1)+imag(i+1,j-1)))+abs((imag(i+1,j-1)+2*imag(i+1,j)+imag(i+1,j+1))-(imag(i-1,j-1)+2*imag(i-1,j)+imag(i-1,j-1)));  
            end
        end 
 end      
mask=uint8(mask);
%imshow(mask);
imshow(mask, [], 'Parent', handles.axes2);
    %median
    
elseif v==15
    
img=x1;
    [h, w, mm]=size(img);
imag=zeros(h+3,w+3);
imag=double(imag);
mask=zeros(h+3,w+3);
mask=double(mask);
for i=1:h+3
    for j=1:w+3
       
        if(i>3&&i<=h)
            if(j>3&&j<=w)
                if mm==1 
            imag(i,j)=img(i,j);
                else
                    imag(i,j,1)=img(i,j,1);
                    imag(i,j,2)=img(i,j,2);
                    imag(i,j,3)=img(i,j,3);
                end
            end
        end  
    end
end
ww1=1;
 for i=4:h
        for j=4:w
            for m=-3:3
                for k=-3:3
                    if mm==3
                    mid(ww1)=imag(i+m,j+k,1);
                    mid2(ww1)=imag(i+m,j+k,2);
                    mid3(ww1)=imag(i+m,j+k,3);
                    ww1=ww1+1;
                    else
                    mid(ww1)=imag(i+m,j+k);
                    ww1=ww1+1;
                    end
                end      
            end
            if mm==3
            mid=sort(mid);
            mask(i,j,1)=mid(25);
            mid2=sort(mid2);
            mask(i,j,2)=mid2(25);
            mid3=sort(mid3);
            mask(i,j,3)=mid3(25);
            else
            mid=sort(mid);
            mask(i,j)=mid(25);
            end
            ww1=1;
        end 
 end
mask=uint8(mask);
%imshow(mask);   
imshow(mask, [], 'Parent', handles.axes2);
 %ideal low pass
 
elseif v==16
    image=x1;
    D0=10;
    [R C D]=size(image);
FT_img=fft2(image);
FT_img=fftshift(FT_img);
if(D==3)
    filter=zeros(R,C,3);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        if(dis<=D0)
            filter(i,j,1)=1;
            filter(i,j,2)=1;
            filter(i,j,3)=1;
        else
            filter(i,j,1)=0;
            filter(i,j,2)=0;
            filter(i,j,3)=0;
        end
        
    end
end
else
    filter=zeros(R,C);
    for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        if(dis<=D0)
            filter(i,j)=1;
            filter(i,j)=1;
            filter(i,j)=1;
        else
            filter(i,j)=0;
            filter(i,j)=0;
            filter(i,j)=0;
        end
        
    end
    end

end
    
G=filter.*FT_img;
output_img=fftshift(G);
output_img=ifft2(output_img);
output_img=abs(output_img);
 output_img=log(1+output_img);
output_img=mat2gray(output_img);
 %imshow(output_img)
imshow(output_img, [], 'Parent', handles.axes2);
     %ideal high pass
elseif v==17
     image=x1;
    D0=10;
    [R C D]=size(image);
FT_img=fft2(image);
FT_img=fftshift(FT_img);
if(D==3)
    filter=zeros(R,C,3);
    for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        if(dis>=D0)
            filter(i,j,1)=0;
            filter(i,j,2)=0;
            filter(i,j,3)=0;
        else
            filter(i,j,1)=1;
            filter(i,j,2)=1;
            filter(i,j,3)=1;
        end
        
    end
    end
else
    filter=zeros(R,C);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        if(dis>=D0)
            filter(i,j)=0;
        else
            filter(i,j)=1;
        end
        
    end
end
end
filter=1-filter;
G=filter.*FT_img;
output_img=fftshift(G);
output_img=ifft2(output_img);
output_img=abs(output_img);
 output_img=log(1+output_img);
output_img=mat2gray(output_img);
% imshow(output_img)
imshow(output_img, [], 'Parent', handles.axes2);
%gaussian low pass
elseif v==18
    image=x1;
    D0=10;
    [R C D]=size(image);
FT_img=fft2(image);
FT_img=fftshift(FT_img);
if(D==3)
    filter=zeros(R,C,3);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        
            filter(i,j,1)=(exp(1))^(-(dis*dis)/(2*D0*D0));
            filter(i,j,2)=(exp(1))^(-(dis*dis)/(2*D0*D0));
            filter(i,j,3)=(exp(1))^(-(dis*dis)/(2*D0*D0));
        
    end
end
else
filter=zeros(R,C);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        
            filter(i,j)=(exp(1))^(-(dis*dis)/(2*D0*D0));
        
    end
end
end

G=filter.*FT_img;
output_img=fftshift(G);
output_img=ifft2(output_img);
output_img=abs(output_img);
 output_img=log(1+output_img);
output_img=mat2gray(output_img);
 %imshow(output_img)
imshow(output_img, [], 'Parent', handles.axes2);
%gaussian high pass
elseif v==19
    image=x1;
    D0=10;
    
    [R C D]=size(image);
FT_img=fft2(image);
FT_img=fftshift(FT_img);
if(D==3)
    filter=zeros(R,C,3);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        
            filter(i,j,1)=(exp(1))^(-(dis*dis)/(2*D0*D0));
            filter(i,j,2)=(exp(1))^(-(dis*dis)/(2*D0*D0));
            filter(i,j,3)=(exp(1))^(-(dis*dis)/(2*D0*D0));
    end
end
else
filter=zeros(R,C);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        
            filter(i,j)=(exp(1))^(-(dis*dis)/(2*D0*D0));
        
    end
end
end

filter=1-filter;

G=filter.*FT_img;
output_img=fftshift(G);
output_img=ifft2(output_img);
output_img=abs(output_img);
 output_img=log(1+output_img);
output_img=mat2gray(output_img);
% imshow(output_img)
imshow(output_img, [], 'Parent', handles.axes2);
%butterworth lowpass
elseif v==20
     image=x1;
    D0=10;
    [R C D]=size(image);
FT_img=fft2(image);
FT_img=fftshift(FT_img);
if(D==3)
    filter=zeros(R,C,3);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        
            filter(i,j,1)=1/(1+(dis/D0)^2);
            filter(i,j,2)=1/(1+(dis/D0)^2);
            filter(i,j,3)=1/(1+(dis/D0)^2);
        
    end
end
else
filter=zeros(R,C);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        
            filter(i,j)=1/(1+(dis/D0)^2);
        
    end
end
end

G=filter.*FT_img;
output_img=fftshift(G);
output_img=ifft2(output_img);
output_img=abs(output_img);
 output_img=log(1+output_img);
output_img=mat2gray(output_img);
% imshow(output_img)
imshow(output_img, [], 'Parent', handles.axes2);
%butterworth highpass

elseif v==21
    image=x1;
    D0=10;
    [R C D]=size(image);
FT_img=fft2(image);
FT_img=fftshift(FT_img);
if(D==3)
    filter=zeros(R,C,3);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        
            filter(i,j,1)=1/(1+(dis/D0)^2);
            filter(i,j,2)=1/(1+(dis/D0)^2);
            filter(i,j,3)=1/(1+(dis/D0)^2);
        
    end
end
else
filter=zeros(R,C);
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
        
            filter(i,j)=1/(1+(dis/D0)^2);
        
    end
end
end
 filter=1-filter;
G=filter.*FT_img;
output_img=fftshift(G);
output_img=ifft2(output_img);
output_img=abs(output_img);
 output_img=log(1+output_img);
output_img=mat2gray(output_img);
 %imshow(output_img)
 imshow(output_img, [], 'Parent', handles.axes2);
 
 %salt and pepper
elseif v==22
    img=x1;
    ps=str2double(get(handles.edit2,'string'));
    pp=str2double(get(handles.edit3,'string'));
    [h,w]=size (img);

aum_of_salt=round (ps*w*h);

num_of_pepr=round (pp*w*h);

for i=1:aum_of_salt
row=ceil(rand (1, 1) *h);

colm=ceil(rand (1,1) *w);

img (row,colm)=255;

end

for i=1:num_of_pepr
    
    row=ceil(rand (1,1) *h);
    colom= ceil (rand(1, 1) *w);
    img (row, colom)=0;

end
newimg=img;
newimg=uint8(newimg);
%imshow(newimg);
imshow(newimg, [], 'Parent', handles.axes2);
%gussion
elseif v==23
    img=x1;
    m=str2double(get(handles.edit2,'string'));%.6;
    v1=str2double(get(handles.edit3,'string'));%.3;
   img=double(img);
[h, w,l]=size (img);
for vm=1:l
for i=1:255
%nom_of_pixel=round (((exp(-((i-m)^2/(2*v1*v1))))/(sqrt (2*3.14*v1)))*w*h)
m1=(i-m)^2/(2*v1*v1);
    m11=exp(-m1);
    m2=sqrt(2*3.14)*v1;
    nom_of_pixel=round((m11/m2)*w*h);
for x=1: nom_of_pixel 
    row=ceil (rand (1,1) *h);
    colom=ceil (rand (1, 1) *w);
    img(row,colom,vm)=img(row,colom,vm)+i;
    
   
end
end
end

img=uint8 (img);
%imshow(img);
imshow(img, [], 'Parent', handles.axes2);
%uniform noise
elseif v==24
    img=x1;
     a=str2double(get(handles.edit2,'string'));%.3;
    b=str2double(get(handles.edit3,'string'));%.6;
img=double (img);

[h, w,l ]=size (img);

num_of_pixel=round ((1/ (b-a)) *w*h);

for i=1:l
for x=1: num_of_pixel

row=ceil(rand (1,1) *h);
colom=ceil (rand (1,1) *w); 

img (row, colom)=img (row, colom) +10;
if (img (row, colom)>255)
    img (row, colom)=255;
end
end
end

img=uint8 (img);
%imshow(img);
imshow(img, [], 'Parent', handles.axes2);
%rayling noise
elseif v==25
    img=x1;
    a=str2double(get(handles.edit2,'string'));%10;
    b=str2double(get(handles.edit3,'string'));%.5;
    [w,h,l]=size(img);
new_image=img;
for k=1:l
for i=0:255
    ns=(2*(i-a)*exp(power(i-a,2)/b))/b;
 
    ns=uint8(ns);
    for j=1:ns
    x=randi(w,1,1);
    y=randi(h,1,1);
    new_image(x,y,k)=new_image(x,y,k)+i;
    end
end
end
h=uint8(new_image);
%imshow(h);
imshow(h, [], 'Parent', handles.axes2);
%gamma noise
elseif v==26
    
    a=str2double(get(handles.edit2,'string'));%50;
    b=str2double(get(handles.edit3,'string'));%10;
   oldimg=x1;
[R C L]=size(oldimg);

    for i=1:255
       number_of_pixel=round((((a^b)*(i^(b-1)))/factorial(b-1))*(exp(-(a*i)))*R*C);
       for j=1:number_of_pixel
           row=ceil(rand(1,1)*R);
           column=ceil(rand(1,1)*C);
           for k=1:L
           newimg(row,column,k)=oldimg(row,column,k)+i;
           end
       end
    end

%imshow(h);
imshow(newimg, [], 'Parent', handles.axes2);
%exp noise
elseif v==27
    img=x1;
    a=str2double(get(handles.edit2,'string'));%.5;
    [w,h2,l2]=size(img);
new_image=img;
  
for k=1:l2
for i=1:255
    ns=a*exp(-a*i);
    for j=0:ns
    x=randi(w,1);
    y=randi(h2,1);
    new_image(x,y,k)=img(x,y,k)+i;
    end
end
end
h=uint8(new_image);
%imshow(h);
imshow(h, [], 'Parent', handles.axes2);
%point sharpening
elseif v==28
    img =x1;
    filtter=[ 0 -1 0;-1 5 -1;0 -1 0 ]; 
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);

imshow(output_image, [], 'Parent', handles.axes2);
%line sharpening horizontal
elseif v==29
    img = x1;
filtter=[ 0 1 0;0 1 0;0 -1 0 ]; 
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);
imshow(output_image, [], 'Parent', handles.axes2);
%line sharpening vertical
elseif v==30
    img = x1;
filtter=[ 0 0 0;1 1 -1;0 0 0 ]; 
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);
imshow(output_image, [], 'Parent', handles.axes2);
%line sharpening RD
elseif v==31
    img = x1;
filtter=[ 1 0 0 ;0 1 0;0 0 -1 ];
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);
imshow(output_image, [], 'Parent', handles.axes2);
%line sharpening LD
elseif v==32
    img = x1;
filtter=[ 0 0 1 ;0 1 0 ;-1 0 0 ];
[h,w,l] =size(img);
[fh,fw] = size(filtter);
NImg=zeros(h,w,l);
FImg=zeros(h+2,w+2,l);
for k=1:l
for i=1:h
    for j=1:w
        FImg(i+1,j+1,k)=img(i,j,k);
    end
end
end
m = zeros(fh,fw);
for k=1:l
for i=1:h
    for j=1:w
        m = FImg(i:i+fh-1, j:j+fh-1,k);
        NImg(i,j,k) = sum(sum(m .* filtter));
    end
end
end
output_image=uint8(NImg);
imshow(output_image, [], 'Parent', handles.axes2);
elseif v==33
    img=x1;
    [h, w, mm]=size(img);
g=randi(10,7,7);
g=g*(1/sum(sum(g)));
imag=zeros(h+3,w+3);
imag=double(imag);
rr=0;
gg=0;
bb=0;
mask=zeros(h+3,w+3);
mask=double(mask);
for i=1:h+3
    for j=1:w+3
       
        if(i>3&&i<=h)
            if(j>3&&j<=w)
                if mm==1 
            imag(i,j)=img(i,j);
                else
                    imag(i,j,1)=img(i,j,1);
                    imag(i,j,2)=img(i,j,2);
                    imag(i,j,3)=img(i,j,3);
                end
            end
        end  
    end
end
q=1;
dd=0;
for i=4:h
        for j=4:w
            for m=-3:3
                for k=-3:3
                    if mm==3
                    rr=rr+imag(i+m,j+k,1)*g(q);
                    gg=gg+imag(i+m,j+k,2)*g(q);
                    bb=bb+imag(i+m,j+k,3)*g(q);
                    q=q+1;
                    else
                    dd=dd+imag(i+m,j+k)*g(q);
                    q=q+1;
                    end
                end      
            end
            if mm==3
                mask(i,j,1)=rr;
            mask(i,j,2)=gg;
            mask(i,j,3)=bb;
            rr=0;
            gg=0;
            bb=0;
            q=1;
            else
            mask(i,j)=dd;
            dd=0;
            q=1;
            end
        end 
end
mask=uint8(mask);

    imshow(mask, [], 'Parent', handles.axes2);
    
elseif v==34
    img=x1;
    [h, w, mm]=size(img);

imag=zeros(h+3,w+3);
imag=double(imag);

mask=zeros(h+3,w+3);
mask=double(mask);
for i=1:h+3
    for j=1:w+3
       
        if(i>3&&i<=h)
            if(j>3&&j<=w)
                if mm==1 
            imag(i,j)=img(i,j);
                else
                    imag(i,j,1)=img(i,j,1);
                    imag(i,j,2)=img(i,j,2);
                    imag(i,j,3)=img(i,j,3);
                end
            end
        end  
    end
end

mid=zeros(49);
mid2=zeros(49);
mid3=zeros(49);
ww=1;
for i=4:h
        for j=4:w
            for m=-3:3
                for k=-3:3
                    if mm==3
                    mid(ww)=imag(i+m,j+k,1);
                    mid2(ww)=imag(i+m,j+k,2);
                    mid3(ww)=imag(i+m,j+k,3);
                    ww=ww+1;
                    else
                    mid(ww)=imag(i+m,j+k);
                    ww=ww+1;
                    end
                end      
            end
            if mm==3
            
            mask(i,j,1)=max(max(mid));
            
            mask(i,j,2)=max(max(mid2));
           
            mask(i,j,3)=max(max(mid3));
            else
            
            mask(i,j)=max(max(mid));
            end
            ww=1;
        end 
end

    mask=uint8(mask);
    imshow(mask, [], 'Parent', handles.axes2);
elseif v==35
    img=x1;
    [h, w, mm]=size(img);

imag=zeros(h+3,w+3);
imag=double(imag);
mask=zeros(h+3,w+3);
mask=double(mask);
for i=1:h+3
    for j=1:w+3
       
        if(i>3&&i<=h)
            if(j>3&&j<=w)
                if mm==1 
            imag(i,j)=img(i,j);
                else
                    imag(i,j,1)=img(i,j,1);
                    imag(i,j,2)=img(i,j,2);
                    imag(i,j,3)=img(i,j,3);
                end
            end
        end  
    end
end

mid=zeros(49);
mid2=zeros(49);
mid3=zeros(49);
ww=1;
for i=4:h
        for j=4:w
            for m=-3:3
                for k=-3:3
                    if mm==3
                    mid(ww)=imag(i+m,j+k,1);
                    mid2(ww)=imag(i+m,j+k,2);
                    mid3(ww)=imag(i+m,j+k,3);
                    ww=ww+1;
                    else
                    mid(ww)=imag(i+m,j+k);
                    ww=ww+1;
                    end
                end      
            end
            if mm==3
             mid=sort(mid);
            mask(i,j,1)=mid(1);
            mid2=sort(mid2);
            mask(i,j,2)=mid2(1);
            mid3=sort(mid3);
            mask(i,j,3)=mid3(1);
            else
            mid=sort(mid);
            mask(i,j)=mid(1);
            end
            ww=1;
        end 
end

   mask=uint8(mask);
    imshow(mask, [], 'Parent', handles.axes2);
    
    
end


    


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=uigetimagefile();
img= imread(path);
imshow(img, [], 'Parent', handles.axes1);
handles.img = img;
guidata(hObject, handles);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
