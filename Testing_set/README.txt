// Testing_set
// ENST playing technique annotation V1.00
// Latest update: March 2016 

Introduction
============
ENST playing technique annotation dataset is an extension to the original ENST drum dataset (for more information: http://perso.telecom-paristech.fr/~grichard/ENST-drums/); this dataset contains the annotations of various playing techniques (specifically: buzz roll, flam, and drag) in the ENST dataset. This dataset provides the real-world data for drum playing technique detection studies. you can redistribute it or modify it for educational purposes. For commercial purpose, please contact the authors.

Notations
=========
The dataset is structured as the original ENST dataset. There are three folders (namely, drummer_1, drummer_2 and drummer_3), each folder contains the annotations for tracks that have accompaniments (songs with prefix of MIN or MID). The annotations consist of four columns of information, which is ordered as follows:

starting time (sec)// technique index// duration (sec)// technique name

The technique names and their corresponding indices are:
drag: 1
roll: 2
flam: 3

In total, there are 30 annotated tracks, which contains 182 individual events {109 rolls, 26 flams, and 47 drags}. Each event is roughly 250~450 ms in duration. Currently, the dataset only contains annotation on the snare drum channel. In the future, annotations of more techniques and drums could be added. 

Contact
=======
Chih-Wei Wu
cwu307@gatech.edu

Georgia Tech Center for Music Technology
840 McMillan Street
Atlanta, GA 30332