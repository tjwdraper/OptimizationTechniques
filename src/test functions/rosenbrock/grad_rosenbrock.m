function dx = grad_rosenbrock(x)
    dx(1,1) = -2 + 2*x(1) - 400*x(1)*x(2) + 400*x(1)^3;
    dx(2,1) = 200*x(2) - 200*x(1)^2;
endfunction
