function dx = grad_treehumpcamel(x)
  dx(1,1) = 4*x(1) - 4.2*x(1)^3 + x(1)^5 + x(2);
  dx(2,1) = x(1) + 2*x(2);
endfunction
