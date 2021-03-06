function []=Graham_Scan(n,Points)
% n=50;%Number of point
% Points=rand(n,2);
scatter(Points(:,1),Points(:,2))
hold on;
% for ii=1:n
% text(Points(:,1),Points(:,2),int2str(ii))
% end
% hold on;
[SortedPoints SortedNum]=sort(Points(:,1));
L_Upper=[];L_Lower=[SortedNum(1)];
for ii=2:n-1
    det1=det([1 Points(SortedNum(1),1) Points(SortedNum(1),2);1 Points(SortedNum(n),1) Points(SortedNum(n),2);1 Points(SortedNum(ii),1) Points(SortedNum(ii),2)]);
    if det1>0
        L_Upper=[L_Upper SortedNum(ii)];
    else
        L_Lower=[L_Lower SortedNum(ii)];
    end
end
L_Lower=[L_Lower,SortedNum(n)];
L_Upper=[SortedNum(1),L_Upper,SortedNum(n)];
if length(L_Lower)>2
    CH_Lower=[L_Lower(1) L_Lower(2)];
    t1=2;
    for ii=3:length(L_Lower)
        CH_Lower=[CH_Lower L_Lower(ii)];
        t1=t1+1;
        %det1=det([1 Points(CH_Lower(t1-2),1) Points(CH_Lower(t1-2),2);1 Points(CH_Lower(t1-1),1) Points(CH_Lower(t1-1),2);1 Points(CH_Lower(t1),1) Points(CH_Lower(t1),2)]);
        for pp=1:10000
        det1=ccw(Points(CH_Lower(t1-2),1),Points(CH_Lower(t1-2),2),Points(CH_Lower(t1-1),1),Points(CH_Lower(t1-1),2),Points(CH_Lower(t1),1),Points(CH_Lower(t1),2));
        if det1<=0
           CH_Lower(t1-1)=[];
           t1=t1-1;
           if t1>2
                continue;
           else
               break;
           end
        else
            break;
        end
    end
    end
else
    CH_Lower=L_Lower;
end
if length(L_Upper)>2
    CH_Upper=[L_Upper(length(L_Upper)) L_Upper(length(L_Upper)-1)];
    t2=2;
    for ii=length(L_Upper)-2:-1:1
        CH_Upper=[CH_Upper L_Upper(ii)];
        t2=t2+1;
        %det1=det([1 Points(CH_Upper(t2-2),1) Points(CH_Upper(t2-2),2);1 Points(CH_Upper(t2-1),1) Points(CH_Upper(t2-1),2);1 Points(CH_Upper(t2),1) Points(CH_Upper(t2),2)]);
        for pp=1:10000
        det1=ccw(Points(CH_Upper(t2-2),1),Points(CH_Upper(t2-2),2),Points(CH_Upper(t2-1),1),Points(CH_Upper(t2-1),2),Points(CH_Upper(t2),1),Points(CH_Upper(t2),2));
        if det1<=0
           CH_Upper(t2-1)=[];
           t2=t2-1;
           if t2>2
                continue;
           else
               break;
           end
        else
            break;
        end
    end
    end
else
    CH_Upper=L_Upper;
end
CH_Upper(1)=[];
CH_Upper(end)=[];

CH=[CH_Lower,CH_Upper];
CH=[CH CH(1)];
line(Points(CH,1),Points(CH,2));



