%% main
clear; close; clc;

strikePath = './Strike_MN';
flamFolder = './Flam/';
dragFolder = './Drag/';

generateFlam(strikePath, flamFolder);
generateDrag(strikePath, dragFolder);