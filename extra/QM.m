clc
clear
format long
%define constant
deltax=.2*10^-9;
m=9.109*10^-31;
hbar=6.63*10^-34/(2*pi);
k=(hbar)^2/(m*(deltax)^2);
N=input('enter Number eigen value for energy');
Xstart=input('enter Xstart');
Xend=input('enter Xend');
deltaX=input('enter deltaX');

%plot potential function V(x)
syms v(x)
v(x)=((x-10*10^(-9))^2)*(20*exp(-((x-9*10^(-9))^2)/2)+1);
subplot(1,2,1);
ezplot(v(x));

%%%%%%
m=(Xend-Xstart)/deltaX+1;
V(m,m)=0;
x=Xstart:deltaX:Xend;
for j=1:1:m
   V(j)=QMV(QMX(j,deltaX,Xstart));
    
end
figure
plot(x,V,'--');
msgbox('V(x) is plotted');

A(m,m)=0;
%create matrix A
for j=1:1:101
    if(j>1 && j<m)
        A(j,j)=k+QMV(QMX(j,deltaX,Xstart));
        A(j,j-1)=-k/2;
        A(j,j+1)=-k/2;
    end
    if(j==1)
        A(j,j)=k+QMV(QMX(j,deltaX,Xstart));
        A(j,j+1)=-k;
    end
    if(j==m)
        A(j,j)=k+QMV(QMX(j,deltaX,Xstart));
        A(j,j-1)=-k;
    end
    
    
end
%calculate eigen values and eigen vectors
[V,D]=eig(A);
disp('eigen value--------------');
disp(V);

disp('eigen vector-------------');

disp(D);
EV=V(N,:);
figure
x=Xstart:deltaX:Xend;
plot(x,EV);
%plot for tolal 
figure

for i=1:1:m
EV=V(i,:);
x=Xstart:deltaX:Xend;
plot(x,EV);
hold on
end





