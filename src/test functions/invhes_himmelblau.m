function dxx = invhes_himmelblau(x)
##    det = (-42 + 12*x(1)^2 + 4*x(2)) * (-26 + 4*x(1) + 12*x(2)^2) - (4*x(1) + 4*x(2))^2;
    dxx = zeros(2, 2);
    
    dxx(1,1) = -26 + 4*x(1) + 12*x(2)^2;
    dxx(2,2) = -42 + 12*x(1)^2 + 4*x(2);
    dxx(1,2) = dxx(2,1) = -4*x(1) - 4*x(2);
    
    dxx /= det(dxx);
endfunction