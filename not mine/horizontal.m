%HORISONTAL
i=1;
selectedHor=zeros(500,3);
while i<= column_size-frag_column_size 
    j=1;
    while j<=row_size-frag_row_size 
        x1=brightnessJump(blur_I,i,j,frag_column_size,frag_row_size);
        x2=brightnessJump(blur_I,i,j+frag_row_size/2,frag_column_size,frag_row_size);
        array(t)=abs(x1-x2);
        selectedHor(t,1)=abs(x1-x2);
        selectedHor(t,2)=i;
        selectedHor(t,3)=j;
        t=t+1;
        j=j+frag_row_size/2;
    end
    i=i+frag_column_size/2;
end
 
 
k=1;
fragmentIndex=1;
fragmentArrayHor=zeros(200,2);
index=1;
while k<=length(selectedHor)
        if (selectedHor(k,1)>0.05)
            fragmentArrayHor(fragmentIndex,1)=selectedHor(k,2);
            fragmentArrayHor(fragmentIndex,2)=selectedHor(k,3);
            col=selectedHor(k,2);
            row=selectedHor(k,3);
            if (row==0) 
                row=row_size-frag_row_size;
            end;
            fragmentIndex=fragmentIndex+1;
        end
    k=k+1;
end
figure
imshow(finalI)
sizefragArrayHor=size(find(fragmentArrayHor(:,1)));
 
fragBlurArrayHor=zeros(frag_column_size,frag_row_size,sizefragArrayHor(1));
fragArrayHor=zeros(frag_column_size,frag_row_size,sizefragArrayHor(1));
 
for i=1:sizefragArrayHor(1)
    col=fragmentArrayHor(i,1);
    row=fragmentArrayHor(i,2);
    fragBlurArrayHor(:,:,i)=finalI(col:col+frag_column_size-1, row:row+frag_row_size-1);
end;
 
 
for t=1:sizefragArrayHor(1)
    a1=0;
    a2=0;
    fragment=fragBlurArrayHor(:,:,t);
    for i=1:frag_column_size
        a1=a1+fragment(i,1,1);
        a2=a2+fragment(i,frag_row_size,1);
    end;
    a1=a1/frag_column_size;
    a2=a2/frag_column_size;
    for i=1:frag_column_size
        for j=1:frag_row_size/2
            fragment(i,j,1)=a1;
        end;
        for k=frag_row_size/2+1:frag_row_size
            fragment(i,k,1)=a2;
        end;
    end;
    fragArrayHor(:,:,t)=fragment;
end;
 
%10,20
 
