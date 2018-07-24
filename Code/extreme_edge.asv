function []=extreme_edge(n,Points)
% n=100;%Number of point
% Points=rand(n,2);
scatter(Points(:,1),Points(:,2))
Convex=[];
for ii=1:n-1
    for jj=ii+1:n
        temp=Points;
        temp([ii,jj],:)=[];
        
        for kk=1:n-2
            det1(kk)=det([1 Points(ii,1) Points(ii,2);1 Points(jj,1) Points(jj,2);1 temp(kk,1) temp(kk,2)]);
        end
        t1=find(det1<0);
        t2=find(det1>0);
        if length(t1)==n-2 || length(t2)==n-2
            Convex=[Convex,ii,jj];
            hold on;
            line([Points(ii,1) Points(jj,1)],[Points(ii,2) Points(jj,2)]);
        end
    end
end
% Convex= unique(Convex)
%  
% for ii=1:n
% %text(Points(ii,1),Points(ii,2),int2str(ii))
% scatter(Points(ii,1),Points(ii,2))
% a=find(Convex==ii);
% if a<=n
%     hold on
%     scatter(Points(Convex(a),1),Points(Convex(a),2),'filled');
% end
% end

        