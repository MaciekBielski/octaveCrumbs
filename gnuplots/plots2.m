#! /usr/bin/octave -qf

clear all;
close all;
format long;

infile = '2dplot.dat';
outfile = 'd2dplot.dat';

data=load(infile);
z=data(:,1);
dz = diff(z);
points = [ z(1:numel(z)-1)+dz(1)/2, diff(data(:,2))./dz ];

fd = fopen(outfile, 'wt');
fprintf(fd,'%14.6f %14.6f\n', reshape(points',1,numel(points)));
fclose(fd);
disp('ok!');
pause;
