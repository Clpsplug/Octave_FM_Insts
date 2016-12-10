% noteMatrix.m
% A3��440�Ƃ��Ď��g����Ԃ�
% note = 0��C
% octave�͂��̂܂�
% noteMatrix(9, 3)��A3��Ԃ�

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