#! /usr/bin/octave -qf

clear all;
close all;

outfile = '2dplot.dat';
global a = 1;
z_vec = linspace(1,5,100);

function r=f(x)
    global z;
    r = 2*sin(x).*sqrt((z+sin(x)));
end

function r=F()
    global a;
    r = quad('f', -pi/2, a);
end

points=[];
global z;

# main loop
for z=z_vec
    points = [points z sin(z)*F()/(z+sin(a))**(3/2)];
end

#saving the data to a file
fh = fopen(outfile,'wt');
fprintf(fh,'%14.6f %14.6f\n',points);
fclose(fh);
disp('ok!');

pause;

