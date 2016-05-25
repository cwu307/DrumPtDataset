function generateDrag(strikePath, dragFolder)
fprintf('========== generating drag samples ==========\n');
strikeList = recursiveFileList(strikePath, 'wav');
mkdir(dragFolder);

alpha = 0.15:0.1:0.55;
deltaTime1 = 50:10:70; % in millisecond
deltaTime2 = 45:10:75; 
fileCount = 0;

for i = 1:length(strikeList)
    % read input strike sounds
    randInd = randperm(length(strikeList));
    [x_m, fs] = audioread(strikeList(i).path);
    [x_g1, ~] = audioread(strikeList(randInd(1)).path);
    [x_g2, ~] = audioread(strikeList(randInd(2)).path);
    
    % normalize input
    x_m = x_m./max(abs(x_m));
    x_g1 = x_g1./max(abs(x_g1));
    x_g2 = x_g2./max(abs(x_g2));
    L_m = length(x_m);
    L_g1 = length(x_g1);
    L_g2 = length(x_g2);
    
    for j = 1:length(alpha)
        for k = 1:length(deltaTime1)
            for kk = 1:length(deltaTime2)
                fileCount = fileCount + 1;
                fprintf('Creating file # %g ......', fileCount');

                currentAlpha = alpha(j);
                currentDt1 = round(deltaTime1(k)/1000 * fs); % in samples
                currentDt2 = round(deltaTime2(kk)/1000 * fs);
                x_synth = zeros(L_m + L_g1 + L_g2 + currentDt1 + currentDt2, 1); 

                % synthesize flam
                x_synth(1:L_g1, 1) = currentAlpha * x_g1;
                x_synth(currentDt1 + 1: currentDt1 + L_g2, 1) = currentAlpha * x_g2;
                x_synth(currentDt1 + currentDt2 + 1: currentDt1 + currentDt2 + L_m, 1) = x_m;
                % normalize the final waveform
                x_synth = x_synth./max(abs(x_synth));

                % savefile
                dragFilePath = strcat(dragFolder, 'drag_', ...
                    'a', num2str(alpha(j)*100), '_dt1_', num2str(deltaTime1(k)), ...
                    '_dt2_', num2str(deltaTime2(kk)), '_No', num2str(fileCount), '.wav');
                audiowrite(dragFilePath, x_synth, fs);
                fprintf('Done! \n');
            end
        end        
    end
end
