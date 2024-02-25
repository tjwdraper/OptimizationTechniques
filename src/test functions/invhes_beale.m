function dxx = invhes_beale(x)
    dxx(2, 2) = 2*(x(2)-1)^2 + 2*(x(2)^2-1)^2 + 2*(x(2)^3-1)^2;
##    dxx(1, 1) = 2*x(1)^2 + 8*x(1)^2*x(2)^2 + 18*x(1)^2*x(2)^4;
    
    dxx(1, 1) = 9*x(1) - 2*x(1)^2 + 12*x(1)^2*x(2)^2 + 30*x(1)^2*x(2)^4-12*x(1)^2*x(2) + 31.5*x(1)*x(2);
    
    dxx(1, 2) = dxx(2, 1) = -1*(3-4*x(1)+9*x(2)+15.75*x(2)^2-4*x(1)*x(2)-12*x(1)*x(2)^2+8*x(1)*x(2)^3+12*x(1)*x(2)^5);
    
    dxx *= det(dxx);
    
endfunction