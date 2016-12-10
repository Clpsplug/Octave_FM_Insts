% pmApply.m


function s = pmApply(length, carrier_freq, mod_wave, sensitivity)

if ~isvector(mod_wave)
   error('[OOPS] InvalidArgumentException thrown from fmApply: Parameter must be a vector'); 
end

theta = zeros(1, length);
ttime = zeros(1, length);
for t = 1 : length,
    % caution: é¿éûä‘Ç∆ÇÃà·Ç¢Ç…íçà”
    rate = (t-1) / 44100;
    theta(t) = 2 * pi * carrier_freq * rate + sensitivity * mod_wave(t);
    ttime(t) = (t-1)/44100;
end

%figure(100);
%plot(ttime, theta);
%axis([0 size(ttime,2)/size(carrier,2) 0  2 * pi * freq_origin]);

s = zeros(1, length);
for t = 1 : length,
    s(t) = cos(theta(t));
end

end