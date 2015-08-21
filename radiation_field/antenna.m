#! /usr/bin/octave -qf

clear all;
close all;
format long;

outfile = 'antenna_data.dat';

data=load('antenna_data.csv');
ang = data(:,2);
Udc = data(:,2);
disp(max(Udc));
Udc_norm = Udc./max(Udc);

plot(ang,Udc_norm,'r*-')

outdata = [ang, Udc_norm];
fh=fopen(outfile,'wt');
fprintf(fh,'%14.6f %14.6f\n',outdata'(:)');
fclose(fh);
disp('done!')
pause;
