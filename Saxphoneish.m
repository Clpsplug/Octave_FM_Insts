function y = Saxphoneish(freq, length_of_s)

length_of_s=round(length_of_s);
s0=zeros(1,length_of_s);
s3=zeros(1,length_of_s);

s1 = pmApply(length_of_s, freq, createSine(4,length_of_s), 0.5); % vibrato
s1 = pmApply(length_of_s, freq, s1, 1);
s1 = pmApply(length_of_s, freq*4, s1, 1);
s1 = pmApply(length_of_s, freq, s1, 1);
env = ADSR(44100*0.08, length_of_s, 0.7, 44100*0.05, round(length_of_s*0.8), length_of_s);
s1=s1.*env;
fc= 2000/length_of_s;
Q=1/sqrt(2);
[b,a]=IIR_LPF(fc,Q);
I=2;
J=2;
for n=1:length_of_s,
    for m=1:J+1,
        if n-m+1>0
            s0(n)=s0(n)+b(m)*s1(n-m+1);
        end
    end
    for m=2:I+1,
        if n-m+1>0
            s0(n)=s0(n)-a(m)*s0(n-m+1);
        end
    end
end

s2 = pmApply(length_of_s, freq, createSine(4,length_of_s), 0.1);
env = ADSR(floor(44100*0.045), 44100*0.05, 0.5, 44100*0.05, round(length_of_s*0.9), length_of_s);
s2 = pmApply(length_of_s, freq, s2, 1);
s2 = pmApply(length_of_s, freq*4, s2, 3);
s2 = pmApply(length_of_s, freq, s2, 1);
s2=s2.*env;
fc= 18000/length_of_s;
Q=1/sqrt(2);
[b,a]=IIR_LPF(fc,Q);
I=2;
J=2;
for n=1:length_of_s,
    for m=1:J+1,
        if n-m+1>0
            s3(n)=s3(n)+b(m)*s2(n-m+1);
        end
    end
    for m=2:I+1,
        if n-m+1>0
            s3(n)=s3(n)-a(m)*s3(n-m+1);
        end
    end
end


s0 = s0*0.2+s2*0.8;

y = s0;

end

