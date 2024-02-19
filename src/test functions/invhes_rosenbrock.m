function dxx = invhes_rosenbrock(x)
  denom = 1 - 200 * (x(2) - x(1)^2);
  if denom == 0
      return;
  else
      dxx = zeros(2, 2);
      
      dxx(1,1) = 0.5;
      dxx(2,2) = 0.005 - x(2) + 3*x(1)^2;
      dxx(1,2) = dxx(2,1) = x(1);
      
      dxx /= denom;
  endif
endfunction
