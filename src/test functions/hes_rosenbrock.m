function dxx = hes_rosenbrock(x)
  dxx(1) = 2 -400*x(2) + 1200 * x(1)^2;
  dxx(2) = 200;
  dxx(3) = -400*x(1);
endfunction
