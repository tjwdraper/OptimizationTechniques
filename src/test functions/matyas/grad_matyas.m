function dx = grad_matyas(x)
  dx(1,1) = 0.52*x(1) - 0.48 * x(2);
  dx(2,1) = 0.52*x(2) - 0.48 * x(1);
endfunction
