function f = beale(x)
  f = (1.500 - x(1) + x(1)*x(2))^2 ...
    + (2.250 - x(1) + x(1)*x(2)^2)^2 ...
    + (2.625 - x(1) + x(1)*x(2)^3)^2;
endfunction
