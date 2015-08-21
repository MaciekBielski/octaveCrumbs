#! /usr/bin/octave -qf
% BUILT-IN methods: roots, fzero

clear all;
close all;
format long;
clc;

outfile='method_comparision.dat';

b = 3;
a = 1.5;
acc = 1.47e-8;

fx = inline("polyval([1 -1 -2],x)");
[x_bisec, i_bisec]=bisec(fx,a,b,acc,100);
[x_newt, i_newt]=newt_tang(fx,a,b,acc,100);
[x_secant, i_secant]=secant(fx,a,b,acc,100);

ml = max([i_bisec, i_newt, i_secant]);
data = horzcat(x_bisec,zeros(1,ml-length(x_bisec)))' ;
data = [data, horzcat(x_newt,zeros(1,ml-length(x_newt)))' ];
data = [data, horzcat(x_secant,zeros(1,ml-length(x_secant)))' ];
% bisection, newton, secant

fh=fopen(outfile,'wt');
labels = {'# bisection','# newton','# secant'};
outdata=[];

for j =1:3 
    nb = [i_bisec i_newt i_secant](j);
    values = data(:,j);
    fprintf(fh,'%s\n# -----------------\n',labels{j});
    for i=2:nb
        err = abs( (values(i)-values(i-1))/values(i) )*100;
        fprintf(fh, '%d\t%14.12f\n', i, err );
    end;
    fprintf(fh,'\n\n');
end;
fclose(fh);

% printing results from file

% i = 1;
% % t - array counter
% t = 1;
% pts=[];
% pts1=[];
% pts2=[];
% pts3=[];
% 
% fh = fopen(outfile, 'r');
%     while !feof(fh)
%         l = fgetl(fh);
%         if isempty(l)
%             switch(t)
%                 case{1}
%                     pts1 = pts;
%                 case{2}
%                     pts2 = pts;
%                 case{3}
%                     pts3 = pts;
%             end;
%             pts=[];
%             i = 1;
%             t++;
%         end;
%         dtrow = str2num(l);
%         if !isempty(dtrow)
%             pts(i++,:) = dtrow;
%         end;
%     end;
% fclose(fh);
% 
% figure(1);
% plot( pts1(:,1),pts1(:,2) );
% set(gca
%     ,'title','METODA BISEKCJI'
%     ,'xlabel','ilosc iteracji'
%     ,'ylabel','err [%]'
% );
% figure(2);
% plot( pts2(:,1),pts2(:,2) );
% set(gca
%     ,'title','METODA NEWTONA'
%     ,'xlabel','ilosc iteracji'
%     ,'ylabel','err [%]'
% );
% figure(3);
% plot( pts3(:,1),pts3(:,2) );
% set(gca
%     ,'title','METODA SIECZNYCH'
%     ,'xlabel','ilosc iteracji'
%     ,'ylabel','err [%]'
% );

% ITERATION TOWARDS FIXED POINT
% BONUS 
% expression must be changed to meet the method condition
% f(x) = x^2 - 2 = (x-1)^2 +2x -3; 
% x = g(x) = -0.5( (x-1)^2 - 3 );
% g(x) = -0.5x^2 + x -2;
% x0 = 1.5 and |g'(1.5)| = 0.5
%
% gx = inline("polyval([-0.5 1 1], x)");
% x0 = 1.5;
% [xf, iterf]=fixpt(gx,x0,1.0e-5,19);
% xf', iterf

pause;
