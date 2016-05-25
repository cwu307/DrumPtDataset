clear all; clc; close all;

[time, dump, dump] = textread('Drag (Ruff)- Rudiment Breakdown by Dr. John Wooton.txt', '%f %s %s');
L = length(time);
assert(mod(L, 3) == 0);
time_sorted = zeros(L/3, 2);
time_sorted(:, 1) = time(1:3:L);
time_sorted(:, 2) = time(2:3:L);
time_sorted(:, 3) = time(3:3:L);

deltaTime = diff(time_sorted, 1, 2);

fprintf('The average delta time 1 (ms) = %g\n', mean(deltaTime(:, 1))*1000);
fprintf('The std of delta time 1 (ms) = %g\n', std(deltaTime(:, 1))*1000);
fprintf('The minimum delta time 1 (ms) = %g\n', min(deltaTime(:, 1))*1000);
fprintf('The maximum delta time 1 (ms) = %g\n', max(deltaTime(:, 1))*1000);
fprintf('=============================\n');
fprintf('The average delta time 2 (ms) = %g\n', mean(deltaTime(:, 2))*1000);
fprintf('The std of delta time 2 (ms) = %g\n', std(deltaTime(:, 2))*1000);
fprintf('The minimum delta time 2 (ms) = %g\n', min(deltaTime(:, 2))*1000);
fprintf('The maximum delta time 2 (ms) = %g\n', max(deltaTime(:, 2))*1000);
fprintf('=============================\n');
%% 
[x, fs] = audioread('Drag (Ruff)- Rudiment Breakdown by Dr. John Wooton.mp3');
x = mean(x, 2);

amplitude_sorted = zeros(size(time_sorted));
time_sorted_inSamples = round(time_sorted.*fs) - 512*3; %fix the diff between SonicVisualizer and matlab

windowLength = 16;
for i = 1:length(time_sorted)
    curWindow1 = x(time_sorted_inSamples(i, 1):time_sorted_inSamples(i, 1) + windowLength);
    curWindow2 = x(time_sorted_inSamples(i, 2):time_sorted_inSamples(i, 2) + windowLength);
    curWindow3 = x(time_sorted_inSamples(i, 3):time_sorted_inSamples(i, 3) + windowLength);
    amplitude_sorted(i, 1) = max(abs(curWindow1));
    amplitude_sorted(i, 2) = max(abs(curWindow2)); 
    amplitude_sorted(i, 3) = max(abs(curWindow3)); 
end
tmp = 1./amplitude_sorted(:, 3);
amplitude_sorted_normalized = amplitude_sorted .* [tmp, tmp, tmp];
ratio1 = amplitude_sorted_normalized(:, 1);
ratio1 = ratio1(ratio1 < 1);
ratio2 = amplitude_sorted_normalized(:, 2);
ratio2 = ratio2(ratio2 < 1);


fprintf('The average alpha1 = %g\n', mean(ratio1));
fprintf('The std of alpha1 = %g\n', std(ratio1));
fprintf('The minimum alpha1 = %g\n', min(ratio1));
fprintf('The maximum alpha1 = %g\n', max(ratio1));
fprintf('=============================\n');
fprintf('The average alpha2 = %g\n', mean(ratio2));
fprintf('The std of alpha2 = %g\n', std(ratio2));
fprintf('The minimum alpha2 = %g\n', min(ratio2));
fprintf('The maximum alpha2 = %g\n', max(ratio2));


 
