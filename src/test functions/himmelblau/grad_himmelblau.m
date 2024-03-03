function dx = grad_himmelblau(x)
  dx(1,1) = 2*(x(1)^2 + x(2) - 11)*2*x(1) + 2*(x(1) + x(2)^2 - 7);
  dx(2,1) = 2*(x(1)^2 + x(2) - 11) + 2*(x(1) + x(2)^2 - 7)*2*x(2);
endfunction
