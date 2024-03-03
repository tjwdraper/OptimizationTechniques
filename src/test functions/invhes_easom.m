function dxx = invhes_easom(x)
    dxx = zeros(2, 2);
       
    dxx(1, 1) = -4*(x(2)-pi)*cos(x(1))*sin(x(2)) + ( 3-4*(x(2)-pi)^2 )*cos(x(1))*cos(x(2));
    dxx(2, 2) = -4*(x(1)-pi)*sin(x(1))*cos(x(2)) + ( 3-4*(x(1)-pi)^2 )*cos(x(1))*cos(x(2));
    
    dxx(1,2) = dxx(2,1) = 4*(x(1)-pi)*(x(2)-pi)*cos(x(1))*cos(x(2)) ...
        + 2*(x(1)-pi)*cos(x(1))*sin(x(2)) ...
        + 2*(x(2)-pi)*sin(x(1))*cos(x(2)) ...
        + 2*sin(x(1))*sin(x(2));
    
    dxx *= exp(-( (x(1)-pi)^2 + (x(2)-pi)^2 ));
    
    dxx /= det(dxx);
endfunction