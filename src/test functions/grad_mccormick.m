function dx = grad_mccormick(x)
  dx(1) = cos(x(1) + x(2)) + 2*(x(1) - x(2)) - 1.5;
  dx(2) = cos(x(1) + x(2)) - 2*(x(1) - x(2)) + 2.5;
endfunction
