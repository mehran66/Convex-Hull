function []=non_extreme_points(n,Points)
% n=5%Number of point
% Points=rand(n,2);
Convex=[];
for ii=1:n
    temp=Points;
    t=true;
    temp(ii,:)=[];
    for jj=1:n-3
        for kk=jj+1:n-2
            for ll=kk+1:n-1
                det1=det([1 temp(jj,1) temp(jj,2);1 temp(kk,1) temp(kk,2);1 Points(ii,1) Points(ii,2)]);
                det2=det([1 temp(kk,1) temp(kk,2);1 temp(ll,1) temp(ll,2);1 Points(ii,1) Points(ii,2)]);
                det3=det([1 temp(ll,1) temp(ll,2);1 temp(jj,1) temp(jj,2);1 Points(ii,1) Points(ii,2)]);
                if det1<0 &&det2<0&&det3<0
                    t=false;
                    break;
                elseif  det1>0&&det2>0&&det3>0
                    t=false;
                    break;
                end 
            end
            if t==false
                break;
            end
        end
        if t==false
            break;
        end
    end
    if t==true
        Convex=[Convex,ii];
    end
end
for ii=1:n
%text(Points(ii,1),Points(ii,2),int2str(ii))
scatter(Points(ii,1),Points(ii,2))
a=find(Convex==ii);
if a<=n
    hold on
    scatter(Points(Convex(a),1),Points(Convex(a),2),'filled');
end
end


                    
                    
    