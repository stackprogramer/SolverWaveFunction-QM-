function [ ] = QMCore(N,Xstart,Xend,deltaX )

m=(Xend-Xstart)/deltaX+1;
disp('m=');
disp(m);
global matrix;
 matrix=zeros(m,m);
c=zeros(1,m);
syms v(x);
dx=deltaX;
v(x)=QMV(x);
figure
subplot(2,1,1);

ezplot(v(x),[0,Xend]);
title('Potential plot ');

matrix=zeros(m,m);


c=[Xstart:dx:Xend];
k=((1.05*(10^(-34)))^2)/(((dx)^2)*(10^-32));
matrix(1,1)=k+v(Xstart);
matrix(1,2)=-k;

matrix(m,m-1)=-k;
matrix(m,m)=k+v(Xend);

for j=2:m-1
    
    matrix(j,j)=(k+v(c(j)));
    matrix(j,(j-1))=(-k/2);
    matrix(j,(j+1))=(-k/2);  
    
end

matrix3=matrix;
[V,D]=eig(matrix3);
disp('--');
figure

%disp(V);
subplot(4,1,1)
plot(c,V(:,1));
title('first wave');

figure


for l=1:m-1
    for i=1:m-1
        if D(i,i)>D(i+1,i+1)
            f=D(i,i);
            D(i,i)=D(i+1,i+1);
            D(i+1,i+1)=f;
            p=V(:,i);
            V(:,i)=V(:,i+1);
            V(:,i+1)=p;
        end
    end
end
subplot(2,2,1)
plot(c,V(:,1));
title('first ');
subplot(2,2,2)
plot(c,V(:,2));
title('second');
subplot(2,2,3)
plot(c,V(:,3));
title('third');
subplot(2,2,4)
plot(c,V(:,4));
title('third');
figure
subplot(1,2,1)
plot(c,V(:,N));
title('N th wave');
end

