function [op_img] = min_max_func(ip_img)
%MIN&MAX Summary of this function goes here
%   Detailed explanation goes here

minf=@(x) min(x(:));                %set 'min()' filter
maxf=@(x)max(x(:));                 %set 'max()' filter
min_img=nlfilter(ip_img,[2 2],minf);  %Apply over 3 x 3 neighbourhood
%max_img=nlfilter(ip_img,[3 3],maxf);
min_max_img=nlfilter(min_img,[2 2],maxf);  %Apply over 3 x 3 neighbourhood

op_img = min_max_img;
end

