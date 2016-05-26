// Training_set_gen
// Latest update: May 2016 

Introduction
============
This dataset is built for training a playing technique classifier of 4 classes (namely Strike, Roll, Flam, and Drag). Since this dataset is derived from the MDLib2.2 dataset, the re-distribution of the original audio files is restricted. Therefore, only the MATLAB scripts for generating the training dataset are included in this folder. For more information about MDLib2.2 dataset, please refer to the following publication:

Matthew Prockup, Erik M. Schmidt, Jeffrey J. Scott, and Youngmoo E. Kim. "Toward Understanding Expressive Percussion Through Content Based Analysis." In ISMIR, pp. 143-148. 2013.

Usage
=====
To generate the Flam and Drag audio samples, please follow the steps below:

1. Obtain the MDLib2.2 and copy the following 144 files into a folder:
	/MDLib2.2/Sorted/Snare/Strike/MN_Snare_Strike_{1111.1.wav ~ 1334.4.wav}

2. In the main.m, specify the path of the folder in step 1

3. Run main.m

4. The Flam and Drag audio samples will be generated in the same folder as main.m


Contact
=======
Chih-Wei Wu
cwu307@gatech.edu

Georgia Tech Center for Music Technology
840 McMillan Street
Atlanta, GA 30332