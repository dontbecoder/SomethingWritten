function y=quantize(x,b,type)
error(nargchk(2,3,nargin));
if ndims(x)~=2 |~isreal(x) |~isnumeric(x)|~isa(x,'uint8')
    error('The input must be a UINT8 numeric matrix');
end
lo=uint8(2^(8-b)-1);
hi=uint8(2^8-double(lo)-1);
if nargin<3 |~strcmpi(type,'igs')
    y=bitand(x,hi);
else
    [m,n]=size(x);
    s=zeros(m,1);
    hitest=double(bitand(x,hi)~=hi);
    x=double(x);
    for j=1:n
        s=x(:,j)+hitest(:,j).*double(bitand(uint8(s),lo));
        y(:,j)=bitand(uint8(s),hi);
    end
end
imshow(y)