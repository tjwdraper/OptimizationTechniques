function dxx = invhes_booth(x)
    dxx = zeros(2, 2);
    
    dxx(1,1) = dxx(2,2) = 10/36;
    dxx(1,2) = dxx(2,1) = -8/36;
endfunction
