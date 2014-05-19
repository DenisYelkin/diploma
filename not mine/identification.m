 y=zeros(24*sizefragArrayHor(1)+24*sizefragArrayVert(1),1);
 matr=zeros(24*sizefragArrayHor(1)+24*sizefragArrayVert(1),17);

% y=zeros(24*sizefragArrayVert(1),1);
% matr=zeros(24*sizefragArrayVert(1),17);
 
k=1;
for t=1:sizefragArrayHor(1)fragmentArrayHor
    fragmentBlur=reshape(fragBlurArrayHor(:,:,t),frag_column_size,frag_row_size);
    fragment=reshape(fragArrayHor(:,:,t),frag_column_size,frag_row_size); 
    for i=1:frag_column_size-2
        for j=1:frag_row_size-2
            maskBlur=fragmentBlur(i:i+2,frag_row_size-j-1:frag_row_size-j+1);    
            mask=fragment(i:i+2,frag_row_size-j-1:frag_row_size-j+1);     
            rowBlur=[maskBlur(1,:) maskBlur(2,:) maskBlur(3,:)];
            row=[mask(1,:) mask(2,:) mask(3,2) mask(3,3)];  
            rowAll=[rowBlur row];
            matr(k,:)=rowAll;
            y(k)=mask(3,1);
            k=k+1;
        end;
    end;
end;
 
for t=1:sizefragArrayVert(1)
    fragmentBlur=reshape(fragBlurArrayVert(:,:,t),frag_column_size2,frag_row_size2);
    fragment=reshape(fragArrayVert(:,:,t),frag_column_size2,frag_row_size2); 
    for i=1:frag_column_size2-2
        for j=1:frag_row_size2-2
            maskBlur=fragmentBlur(i:i+2,frag_row_size2-j-1:frag_row_size2-j+1);    
            mask=fragment(i:i+2,frag_row_size2-j-1:frag_row_size2-j+1);     
            rowBlur=[maskBlur(1,:) maskBlur(2,:) maskBlur(3,:)];
            row=[mask(1,:) mask(2,:) mask(3,2) mask(3,3)];  
            rowAll=[rowBlur row];
            matr(k,:)=rowAll;
            y(k)=mask(3,1);
            k=k+1;
        end;
    end;
end;

 
 y=zeros(24*sizefragArrayHor(1)+24*sizefragArrayVert(1),1);
 matr=zeros(24*sizefragArrayHor(1)+24*sizefragArrayVert(1),17);
 
 
k=1;
for t=1:sizefragArrayHor(1)
    fragmentBlur=reshape(fragBlurArrayHor(:,:,t),frag_column_size,frag_row_size);
    fragment=reshape(fragArrayHor(:,:,t),frag_column_size,frag_row_size); 
    for i=1:frag_column_size-2
        for j=1:frag_row_size-2
            maskBlur=fragmentBlur(frag_column_size-i-1:frag_column_size-i+1,frag_row_size-j-1:frag_row_size-j+1);    
            mask=fragment(frag_column_size-i-1:frag_column_size-i+1,frag_row_size-j-1:frag_row_size-j+1);     
            rowBlur=[maskBlur(1,:) maskBlur(2,:) maskBlur(3,:)];
            row=[mask(1,2) mask(1,3) mask(2,:) mask(3,:)];  
            rowAll=[rowBlur row];
            matr(k,:)=rowAll;
            y(k)=mask(1,1);
            k=k+1;
        end;
    end;
end;
 
for t=1:sizefragArrayVert(1)
    fragmentBlur=reshape(fragBlurArrayVert(:,:,t),frag_column_size2,frag_row_size2);
    fragment=reshape(fragArrayVert(:,:,t),frag_column_size2,frag_row_size2); 
    for i=1:frag_column_size2-2
        for j=1:frag_row_size2-2
        maskBlur=fragmentBlur(frag_column_size2-i-1:frag_column_size2-i+1,frag_row_size2-j-1:frag_row_size2-j+1);
        mask=fragment(frag_column_size2-i-1:frag_column_size2-i+1,frag_row_size2-j-1:frag_row_size2-j+1);     
        rowBlur=[maskBlur(1,:) maskBlur(2,:) maskBlur(3,:)];
        row=[mask(1,2) mask(1,3) mask(2,:) mask(3,:)];  
        rowAll=[rowBlur row];
        matr(k,:)=rowAll;
        y(k)=mask(1,1);
        k=k+1;
        end;
    end;
end;
 
 tol=1e-1; maxit=100;
 c=bicgstab(matr'*matr,matr'*y,tol,maxit)

  
y=zeros(24*sizefragArrayHor(1)+24*sizefragArrayVert(1),1);
matr=zeros(24*sizefragArrayHor(1)+24*sizefragArrayVert(1),17);
% 
% y=zeros(24*sizefragArrayVert(1),1);
% matr=zeros(24*sizefragArrayVert(1),17);
k=1;
for t=1:sizefragArrayHor(1)
    fragmentBlur=reshape(fragBlurArrayHor(:,:,t),frag_column_size,frag_row_size);
    fragment=reshape(fragArrayHor(:,:,t),frag_column_size,frag_row_size); 
    for i=1:frag_column_size-2
        for j=1:frag_row_size-2
        maskBlur=fragmentBlur(frag_column_size-i-1:frag_column_size-i+1,j:j+2);    
        mask=fragment(frag_column_size-i-1:frag_column_size-i+1,j:j+2);     
        rowBlur=[maskBlur(1,:) maskBlur(2,:) maskBlur(3,:)];
        row=[mask(1,1) mask(1,2) mask(2,:) mask(3,:)];  
        rowAll=[rowBlur row];
        matr(k,:)=rowAll;
        y(k)=mask(1,3);
        k=k+1;
        end;
    end;
end;
 
for t=1:sizefragArrayVert(1)
    fragmentBlur=reshape(fragBlurArrayVert(:,:,t),frag_column_size2,frag_row_size2);
    fragment=reshape(fragArrayVert(:,:,t),frag_column_size2,frag_row_size2); 
    for i=1:frag_column_size2-2
        for j=1:frag_row_size2-2

        maskBlur=fragmentBlur(frag_column_size2-i-1:frag_column_size2-i+1,j:j+2);
        mask=fragment(frag_column_size2-i-1:frag_column_size2-i+1,j:j+2);     
        rowBlur=[maskBlur(1,:) maskBlur(2,:) maskBlur(3,:)];
        row=[mask(1,1) mask(1,2) mask(2,:) mask(3,:)];  
        rowAll=[rowBlur row];
        matr(k,:)=rowAll;
        y(k)=mask(1,3);
        k=k+1;
        end;
    end;
end;
 
 tol=1e-1; maxit=100;
 c=bicgstab(matr'*matr,matr'*y,tol,maxit)


for t=1:sizefragArrayHor(1)fragmentArrayHor
    fragmentBlur=reshape(fragBlurArrayHor(:,:,t),frag_column_size,frag_row_size);
    fragment=reshape(fragArrayHor(:,:,t),frag_column_size,frag_row_size); 
    for i=1:frag_column_size-2
        for j=1:frag_row_size-2
        maskBlur=fragmentBlur(i:i+2,frag_row_size-j-1:frag_row_size-j+1);    
        mask=fragment(i:i+2,frag_row_size-j-1:frag_row_size-j+1);     
        rowBlur=[maskBlur(1,:) maskBlur(2,:) maskBlur(3,:)];
        row=[mask(1,:) mask(2,:) mask(3,2) mask(3,3)];  
        rowAll=[rowBlur row];
        matr(k,:)=rowAll;
        y(k)=mask(3,1);
        k=k+1;
        end;
    end;
end;