n=3;%Number of point
Points=rand(n,2);
if n==1
    scatter(Points(1,1),Points(1,2))
elseif n==2
     scatter(Points(1:2,1),Points(1:2,2));
     hold on;
     line(Points(1:2,1),Points(1:2,2));
elseif n==3
        Points=[Points;Points(1,:)];
         scatter(Points(1:3,1),Points(1:3,2));
         hold on;
         line(Points(1:4,1),Points(1:4,2));
else
    order=[1 2];
    det1=ccw(Points(1,1),Points(1,2),Points(2,1),Points(2,2),Points(3,1),Points(3,2));
    if det1>0
        order=[1 3 2];
    else
        order=[1 2 3];
    end
    for ii=4:n
        
    end
end
