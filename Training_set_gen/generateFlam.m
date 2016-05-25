function generateFlam(strikePath, flamFolder)
fprintf('========== generating flam samples ==========\n');
strikeList = recursiveFileList(strikePath, 'wav');
mkdir(flamFolder);

alpha = 0.1:0.1:0.7;
deltaTime = 30:10:60; % in millisecond
fileCount = 0;

for i = 1:length(strikeList)
    % read input strike sounds
    randInd = randperm(length(strikeList));
    [x_m, fs] = audioread(strikeList(i).path);
    [x_g, ~] = audioread(strikeList(randInd(1)).path);
    
    % normalize input
    x_m = x_m./max(abs(x_m));
    x_g = x_g./max(abs(x_g));
    L_m = length(x_m);
    L_g = length(x_g);
    
    for j = 1:length(alpha)
        for k = 1:length(deltaTime)
            fileCount = fileCount + 1;
            fprintf('Creating file # %g ......', fileCount');
            
            currentAlpha = alpha(j);
            currentDt = round(deltaTime(k)/1000 * fs); % in samples
            x_synth = zeros(L_m + L_g + currentDt, 1); 
            
            % synthesize flam
            x_synth(1:L_g, 1) = currentAlpha * x_g;
            x_synth(currentDt + 1: currentDt + L_m, 1) = x_m;
            
            % normalize the final waveform
            x_synth = x_synth./max(abs(x_synth));
            
            % savefile
            flamFilePath = strcat(flamFolder, 'flam_', ...
                'a', num2str(alpha(j)*10), '_dt', num2str(deltaTime(k)), '_No', num2str(fileCount), '.wav');
            audiowrite(flamFilePath, x_synth, fs);
            fprintf('Done! \n');
        end        
    end
end
