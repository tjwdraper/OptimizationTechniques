function dxx = invhes_levi(x)
    dxx(1, 1) = 18*pi^2*(x(1)-1)^2*cos(6*pi*x(2)) ...
        + 2*(1+sin(2*pi*x(2))^2) ...
        + 8*pi*(x(2)-1)*sin(4*pi*x(2)) ...
        + 8*pi^2*(x(2)-1)^2*cos(4*pi*x(2));
    
    
    dyy(2, 2) = 18*pi^2*cos(6*pi*x(1)) ...
        + 2*(1+sin(3*pi*x(2))^2);
    
    
    dxx(1, 2) = dxx(2, 1) = -6*pi*(x(1)-1)*sin(6*pi*x(2));
    
    dxx *= det(dxx);
endfunction