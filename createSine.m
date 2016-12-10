% createSine.m

function [y,z] = createSine(f0, length)
if f0 <= 0
    error('[OOPS] InvalidArgumentException thrown from createSine: Can''t create sine wave with negative frequency');
end
y=zeros(1,length);
z=zeros(1,length);

for n=1:length,
    y(n)=cos(2*pi*f0*n/44100)*1.0;
    z(n)=(n-1)/length;
end

end
