function [V ] = QMV(x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%V=((x-10*10^-9)^2)*(20*exp(-(x-10*9^-9)^2/2)+1);
V=((x-10*10^(-9))^2)*(20*exp(-((x-9*10^(-9))^2)/(2*10^-18))+1)*(1.6*10^-19);


end

