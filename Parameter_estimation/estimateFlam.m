%% sort flam onsets
clear all; clc; close all;

[time, dump, dump] = textread('Flam- Rudiment Breakdown by Dr. John Wooton.txt', '%f %s %s');
L = length(time);
assert(mod(L, 2) == 0);
time_sorted = zeros(L/2, 2);
time_sorted(:, 1) = time(1:2:L);
time_sorted(:, 2) = time(2:2:L);

deltaTime = diff(time_sorted, 1, 2);
fprintf('The average delta time (ms) = %g\n', mean(deltaTime)*1000);
fprintf('The std of delta time (ms) = %g\n', std(deltaTime)*1000);
fprintf('The minimum delta time (ms) = %g\n', min(deltaTime)*1000);
fprintf('The maximum delta time (ms) = %g\n', max(deltaTime)*1000);
fprintf('=============================\n');
%% 
[x, fs] = audioread('Flam- Rudiment Breakdown by Dr. John Wooton.mp3');
x = mean(x, 2);

amplitude_sorted = zeros(size(time_sorted));
time_sorted_inSamples = round(time_sorted.*fs) - 512*3; %fix the diff between SonicVisualizer and matlab

windowLength = 16;
for i = 1:length(time_sorted)
    curWindow1 = x(time_sorted_inSamples(i, 1):time_sorted_inSamples(i, 1) + windowLength);
    curWindow2 = x(time_sorted_inSamples(i, 2):time_sorted_inSamples(i, 2) + windowLength);
    amplitude_sorted(i, 1) = max(abs(curWindow1));
    amplitude_sorted(i, 2) = max(abs(curWindow2)); 
end
tmp = 1./amplitude_sorted(:, 2);
amplitude_sorted_normalized = amplitude_sorted .* [tmp, tmp];
ratio = amplitude_sorted_normalized(:, 1);
ratio = ratio(ratio < 1);

fprintf('The average alpha = %g\n', mean(ratio));
fprintf('The std of alpha = %g\n', std(ratio));
fprintf('The minimum alpha = %g\n', min(ratio));
fprintf('The maximum alpha = %g\n', max(ratio));




 
