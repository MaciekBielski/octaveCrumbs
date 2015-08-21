
function plotTimes(filename)
    data=load(filename);
    x=data(:,1);
    lCap=data(:,2);
    rCap=data(:,5);
    disp=data(:,end);
    #figure(1);
    #plot(x(1:30),lStop(1:30),'x',x(1:30),rStop(1:30),'+');
    #axis([0,30,0,6],'manual');
    #xlabel('frameNb');
    #ylabel('time[s]');
    #title("times of processing finish");
    #legend('left', 'right', 'location','southeast');
    #legend('boxon');
    #figure(2);
    #plot(x,lStop-lStart,'.',x,rStop-rStart,'.');
    figure(3);
    dDisp=diff(disp(101:300));
    plot(x(102:300),dDisp,'.-');
    xlabel('numer ramki');
    ylabel('czas wyswietlenia [s]');
    #stem(x(100:500),dDisp,'.-');
    #xlabel('numer ramki');
    #ylabel('czas wyswietlenia [s]');
    #figure(4);
    #plot(x(100:120),lCap(100:120),'o-g',x(100:120),rCap(100:120),'o-r');
    #xlabel('numer ramki');
    #ylabel('czas przechwycenia [s]');
    #legend('lewa kamera','prawa kamera','location','southeast');
    #figure(5);
    #dlCap = diff(lCap);
    #drCap = diff(rCap);
    #plot(x(100:120),dlCap(100:120),'o-g',x(100:120),drCap(100:120),'o-r');
    #xlabel('numer ramki');
    #ylabel('czasu przechwycenia ramek ze strumienia [s]');
    #legend('lewa kamera','prawa kamera','location','southeast');

endfunction

plotTimes('times30fps.txt');
#print(1,'timeOfFrame.png','-S800,600');

