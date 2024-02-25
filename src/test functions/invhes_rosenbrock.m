function dxx = invhes_rosenbrock(x)
  dxx = zeros(2,2);
  
  dxx(1,1) = 200;
  dxx(2,2) = 1200*x(1)^2 - 400*x(2) + 2;
  dxx(1,2) = dxx(2,1) = 400*x(1);
  
  dxx /= det(dxx);
endfunction
