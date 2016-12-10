function e=ADSR(A,D,S,R,gate,duration)
e=zeros(1,duration);
if A~=0
    for n=1:A,
        e(n)=1-exp(-5*(n-1)/A);
    end
end
if D~=0
    for n=A+1:gate,
        e(n)=S+(1-S)*exp(-5*(n-1-A)/D);
    end
else
    for n=A+1:gate,
        e(n)=S;
    end  
end
if R~=0
    for n=gate+1:duration,
        e(n)=e(gate)*exp(-5*(n-gate+2)/R);
    end
end
