% noteMatrix.m
% A3‚ğ440‚Æ‚µ‚Äü”g”‚ğ•Ô‚·
% note = 0‚ÍC
% octave‚Í‚»‚Ì‚Ü‚Ü
% noteMatrix(9, 3)‚ÅA3‚ğ•Ô‚·

function y = noteMatrix(note, octave)
    if note < 0 || note > 11
        error('[OOPS] InvalidArgumentException thrown from noteMatrix: note must be between 0 and 11');
    end

    note = round(note);
    octave = round(octave);

    sampleMatrix = zeros(12, 1);

    for i=1:12,
       sampleMatrix(i) = 440 * power(2, (i-10)/12); 
    end
    
    y = sampleMatrix(note+1) * power(2, octave - 3);
    
end