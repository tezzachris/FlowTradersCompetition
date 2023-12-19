function ll = wevol(w,r)
    %w vettore riga lunghezza 13
    f = 5e-5;
    Rt = zeros(size(r,1),1); 
    for i = 1:size(r,1)
        if i == 1
             %we assume here f = 0;
             Rt(i) =  w(i,1:end-1)*r(i,:)';
        elseif i > 1
        cost = f*sum( abs( ( w(i-1,1:end-1) .* (1+r(i,:)) )/(1+w(i,1:end-1)*r(i,:)') - w(i,1:end-1)) ) ;
        Rt(i) =  w(i,1:end-1)*r(i,:)' - cost ;
        end
    end
    ll = - mean(Rt)/std(Rt); %*sqrt(365*24)
end