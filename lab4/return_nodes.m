function y = return_nodes ( start,stop,n )
    if (n==1)
        %gdy jeden punkt to wybierz srodek przedzialu interpolacji
        y=[(start+stop)/2]; 
    end 
    if (n==2) 
        %gdy dwa punkty to krance przedzialu - wezly interpolacji
        y=[start stop];
    end
    if (n>2) 
        % gdy 3 i wiecej - dzilimy przedzial w ktorym interpolujmy funkcje na rowne podprzedzialy
        step=(stop-start)/(n-1);
        tmp=start;
        for i=1:(n-1)
            tmp=[tmp (start+i*step)]; 
        end    
        y=tmp;
    end
end
