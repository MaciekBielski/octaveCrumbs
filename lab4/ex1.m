#! /usr/bin/octave -qf

clear all;
close all;
format long; 
setenv("GNUTERM",'wxt');

colors= ['b','r','k','g','y','c','m'];
functions=cellstr(['x*exp(x)    '; 'sqrt(1-x^2) ' ; '|exp(-|x|)| ' ; '1/(1+25*x^2)']); %nazwy funkcji
accurate_results=[2/exp(1) pi/2 (2-2/exp(1)) 0.4*atan(5)];  % wyniki obliczone analitycznie

for j=2 %dla kazdej z funkcji
    % hold off;
    figure(j);   
    X=-1:0.00001:1;
    f_name=strcat('f',num2str(j));
    h(7)=plot(X,feval(f_name,X),colors(1));
    hold on;

    disp(strcat('*********wartosci_calek:_', functions(j) ,' w przedziale [-1 , 1] : ****'));
    for i=1:6
        X=return_nodes(-1,1,i+1);
        Y=feval(f_name,X);
        A=direct_interp(X,Y);  
        A_integrated=polyint(A);
            S=polyval(A_integrated,1)-polyval(A_integrated,-1);
            str=sprintf('Wartosc calki obliczona przy uzyciu wielomianu interpolujacego stopnia %d',i);
            disp(str);
            disp(S);
            str=sprintf('Wartosc dokladna\n');
            disp(str);
            disp(accurate_results(j));
            disp('Blad wzgledny [%]');
            disp(abs((S-accurate_results(j))/accurate_results(j)*100));
            disp('____________________________________________________________________________');
            X=-1:0.00001:1;
            Y_int=polyval(A,X);
        h(i)=plot(X,Y_int,colors(i+1));
    hold on;
    end
legend([h(1) h(2) h(3) h(4) h(5) h(6) h(7)],{'Int. wiel. st. 1','Int. wiel. st. 2','Int. wiel. st. 3','Int. wiel. st. 4','Int. wiel. st. 5','Int. wiel. st. 6','Przebied dokladny'});
end

pause;
