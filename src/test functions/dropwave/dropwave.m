function f = dropwave(x)
    f = -( 1 + cos(12*sqrt(x(1)^2 + x(2)^2)) ) / (0.5*(x(1)^2 + x(2)^2) + 2);
endfunction