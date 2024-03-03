function dxx = invhes_treehumpcamel(x)
    dxx = zeros(2, 2);
    
    dxx(1,1) = 2;
    dxx(2,2) = 4-12.6*x(1)^2 + 5*x(1)^4;
    dxx(1,2) = dxx(2,1) = -1;
    
    dxx /= det(dxx);
endfunction