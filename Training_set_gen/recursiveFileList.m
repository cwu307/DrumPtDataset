function allData=recursiveFileList(directoryList, extName, maxFileNumInEachDir)
% RecursiveFileList: List files with a given extension recursively
%	Usage: allData=recursiveFileList(directoryList, extName, maxFileNumInEachDir)

%	Roger Jang, 20030316

if nargin<1, error('Need at least one input argument!'); end
if nargin<3, maxFileNumInEachDir=inf; end
if isstr(directoryList); directoryList={directoryList}; end

allData=[];
for k=1:length(directoryList)
	directory=directoryList{k};

	% === Get files in the given directory
	if (directory(end)=='/') | (directory(end)=='\'); directory(end)=[]; end

	data=dir([directory, '/*.', extName]);
	data=data(1:min(length(data), maxFileNumInEachDir));

	for i=1:length(data)
		data(i).path=[directory, '/', data(i).name];
		[parentPath, junk, junk]=fileparts(data(i).path);
		[junk, data(i).parentDir, junk]=fileparts(parentPath);
	end
	
	% === Get files in sub-directories
	subdirs=dir(directory);
	subdirs=subdirs([subdirs.isdir]);	% Get directories only
	for i=1:length(subdirs),
		if strcmp(subdirs(i).name, '.'), continue; end
		if strcmp(subdirs(i).name, '..'), continue; end
		thisPath=[directory, '/', subdirs(i).name];
		data2=feval(mfilename, thisPath, extName, maxFileNumInEachDir);
		if length(data2)==0; data2=[]; end
		if length(data)==0; data=[]; end
		data=[data; data2];
	end
	allData=[allData; data];
end
