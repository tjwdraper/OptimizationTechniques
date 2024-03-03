function dx = grad_booth(x)
  dx(1,1) = 10*x(1) + 8*x(2) - 34;
  dx(2,1) = 8*x(1) + 10*x(2) - 38;
endfunction
