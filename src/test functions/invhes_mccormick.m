function dxx = invhes_mccormick(x)
    dxx = zeros(2, 2);
    
    dxx(1,1) = dxx(2,2) = 2 - sin(x(1) + x(2));
    dxx(1,2) = dxx(2,1) = 2 + sin(x(1) + x(2));
    
    dxx /= det(dxx);
endfunction