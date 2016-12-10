% BASS.m
% REQUIRES ADSR.m, createSine.m, pmApply.m
% createSine関数で指定周波数・長さのサイン波を取得します
% pmApply関数で位相変調します
function y=Bass(freq, length)
    length = round(length);

    [s1, ~] = createSine(freq / 8, length);

    s1 = pmApply(length, freq, s1.*ADSR(0, length, 0.5, 0, length, length), 12);

    s0 = s1.*ADSR(441,30870,0.2,round(length*0.05),round(length*0.98),round(length));

    [s2, ~] = createSine(freq / 8, length);
    s2 = s2.*ADSR(882,30870,0.2,round(length*0.05),round(length*0.98),round(length));
 
    [s3, ~] = createSine(freq, length);
      
    y = s0*0.6+ s2*0.4 + s3*0.0;

    %figure(1);
    %plot(s0);
    %axis([0 size(s0,2) -1 1]);
    %s0 = s0.';
    %sound(s0, 44100, 16);

end

