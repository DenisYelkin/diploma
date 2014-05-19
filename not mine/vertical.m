%VERTICAL
selectedVert=zeros(500,3);
frag_column_size2=frag_row_size; %8
frag_row_size2=frag_column_size; %6   
i=1;
while i<= column_size-frag_column_size2 
    j=1;
    while j<=row_size-frag_row_size2 
        x1=brightnessJumpVert(blur_I,i,j,frag_column_size2,frag_row_size2);
        x2=brightnessJumpVert(blur_I,i+frag_column_size2/2,j,frag_column_size2,frag_row_size2);
        array(t)=abs(x1-x2);    
        selectedVert(t,1)=abs(x1-x2);
        selectedVert(t,2)=i;
        selectedVert(t,3)=j;
        t=t+1;
        j=j+frag_row_size/2;
    end
    i=i+frag_column_size/2;
end
 
k=1;
fragmentIndex=1;
fragmentArrayVert=zeros(200,2);
while k<=length(selectedVert)
    %col=floor(selected(k)/(row_size-frag_row_size))+1;
    %row=mod(selected(k),row_size-frag_row_size);
    if (selectedVert(k,1)>0.05)
        fragmentArrayVert(fragmentIndex,1)=selectedVert(k,2);
        fragmentArrayVert(fragmentIndex,2)=selectedVert(k,3);
        fragmentIndex=fragmentIndex+1;
    end
     k=k+1;
 end
 
sizefragArrayVert=size(find(fragmentArrayVert(:,1)))
 
 
fragBlurArrayVert=zeros(frag_column_size2,frag_row_size2,sizefragArrayVert(1));
fragArrayVert=zeros(frag_column_size2,frag_row_size2,sizefragArrayVert(1));
 
for i=1:sizefragArrayVert(1)
    col=fragmentArrayVert(i,1);
    row=fragmentArrayVert(i,2);
    fragBlurArrayVert(:,:,i)=finalI(col:col+frag_column_size2-1, row:row+frag_row_size2-1);
end;
 
 
for t=1:sizefragArrayVert(1) 
    a1=0;
    a2=0;
    fragment=fragBlurArrayVert(:,:,t);
    for i=1:frag_row_size2
        a1=a1+fragment(1,i,1);
        a2=a2+fragment(frag_column_size2,i,1);
    end; 
    a1=a1/frag_row_size2;
    a2=a2/frag_row_size2;
    for i=1:frag_row_size2
        for j=1:frag_column_size2/2
            fragment(j,i,1)=a1;
        end;
        for k=frag_column_size2/2+1:frag_column_size2
            fragment(k,i,1)=a2;
        end;
    end;
    fragArrayVert(:,:,t)=fragment;
end;
