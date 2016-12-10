% bass_melody.m
% REQUIRES noteMatrix.m, Saxphoneish.m, Bass.m, ADSR.m, createSine.m,
% pmApply.m

clear;
tempo = 130*4; % multiplied by 4 to enable 16th-notes
beatLength = 60/tempo*44100; % samples per beat
melody = [
    noteMatrix(5,3) 3; 0 1; noteMatrix(5,3) 3; 0 1; 
    noteMatrix(5,3) 1; noteMatrix(9,3) 1; 0 1; noteMatrix(10,3) 1; 0 1; noteMatrix(11, 3) 1; 0 1; noteMatrix(0,4) 1;
    noteMatrix(5,3) 3; 0 1; noteMatrix(5,3) 2; 0 1; noteMatrix(3,3) 3; noteMatrix(4, 3) 1; 0 1; noteMatrix(5,3) 2; 0 2;
    noteMatrix(5,3) 3; 0 1; noteMatrix(5,3) 3; 0 1; 
    noteMatrix(5,3) 1; noteMatrix(9,3) 1; 0 1; noteMatrix(10,3) 1; 0 1; noteMatrix(11, 3) 1; 0 1; noteMatrix(0,4) 1;
    noteMatrix(5,3) 3; 0 1; noteMatrix(5,3) 2; 0 1; noteMatrix(3,3) 3; noteMatrix(4, 3) 1; 0 1; noteMatrix(5,3) 2; 0 2;
    noteMatrix(5,3) 3; 0 1; noteMatrix(5,3) 3; 0 1; 
    noteMatrix(5,3) 1; noteMatrix(9,3) 1; 0 1; noteMatrix(10,3) 1; 0 1; noteMatrix(11, 3) 1; 0 1; noteMatrix(0,4) 1;
    noteMatrix(5,3) 3; 0 1; noteMatrix(5,3) 2; 0 1; noteMatrix(3,3) 3; noteMatrix(4, 3) 1; 0 1; noteMatrix(5,3) 2; 0 2;
    noteMatrix(5,3) 3; 0 1; noteMatrix(5,3) 3; 0 1; 
    noteMatrix(5,3) 1; noteMatrix(9,3) 1; 0 1; noteMatrix(10,3) 1; 0 1; noteMatrix(11, 3) 1; 0 1; noteMatrix(0,4) 1;
    noteMatrix(5,3) 3; 0 1; noteMatrix(5,4) 1; noteMatrix(5,3) 1; 0 1; noteMatrix(3,4) 3; noteMatrix(4, 4) 1; 0 1; noteMatrix(5,4) 1.5; 0 2.5;
    ];
melody_sx = [
    noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(0,4) 1; noteMatrix(0,4) 1; noteMatrix(2,4) 1;
    noteMatrix(3,4) 1; noteMatrix(2,4) 1; noteMatrix(1,4) 1; noteMatrix(0,4) 10; 0 3
    noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    noteMatrix(11,3) 1; noteMatrix(10,3) 1; noteMatrix(9,3) 1; noteMatrix(3,4) 10; 0 3
    noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(0,4) 1; noteMatrix(0,4) 1; noteMatrix(2,4) 1;
    noteMatrix(3,4) 1; noteMatrix(2,4) 1; noteMatrix(1,4) 1; noteMatrix(0,4) 10; 0 3
    noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    0 1; noteMatrix(10,3) 1; noteMatrix(11,3) 1; noteMatrix(0,4) 1;
    noteMatrix(11,3) 1; noteMatrix(10,3) 1; noteMatrix(9,3) 1; noteMatrix(5,4) 10; 0 3
    ];
%melody = [noteMatrix(9,3) 4];
disp("Created melody.")
fflush(stdout)
fs = 44100;
totalBeats = 0;
for i = 1:size(melody,1),
    totalBeats = totalBeats + melody(i, 2);
end
totalsamples = round(totalBeats * beatLength);
s = zeros(1,totalsamples);

disp("Created sound array.")
fflush(stdout)
currentTime = 0;
for i = 1:size(melody,1),
    disp(i),disp(" out of "), disp(size(melody,1))
    fflush(stdout)
    if (melody(i,1) > 0) 
        sa = Bass(melody(i, 1), melody(i, 2)*beatLength);
        s = additive(s, sa, round(currentTime));
        currentTime = currentTime + melody(i, 2)*beatLength;
    else
        currentTime = currentTime + melody(i, 2)*beatLength;
    end
end
disp("Created bass part.")
fflush(stdout)
currentTime = 0;
for i = 1:size(melody_sx,1),
    disp(i),disp(" out of "), disp(size(melody,1))
    fflush(stdout)
    if (melody_sx(i,1) > 0) 
        sa = Saxphoneish(melody_sx(i, 1), melody_sx(i, 2)*beatLength);
        s = additive(s, sa, round(currentTime));
        currentTime = currentTime + melody_sx(i, 2)*beatLength;
    else
        currentTime = currentTime + melody_sx(i, 2)*beatLength;
    end
end

time = zeros(1, size(s, 2));
for i = 1:size(s,2),
    time(i) = i;
end
disp("Created saxphone part.")
fflush(stdout)
% figure(1);
% plot(time, s);
% axis([0 size(time,2) -1 1]);
s = s.';
sound(s,44100);

% audiowrite('fingertough_playedby_matlab.wav', s, 44100);
