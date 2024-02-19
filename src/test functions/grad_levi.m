function dx = grad_levi(x)
  dx(1) = 2*sin(3*pi*x(1))*cos(3*pi*x(1)) ...
    + 2*(x(1)-1)*(1+sin(3*pi*x(2))^2);

  dx(2) = 2*(x(1)-1)^2 * sin(3*pi*x(2)) * cos(3*pi*x(2)) ...
    + 2*(x(2)-1)*(1+sin(2*pi*x(2))^2) ...
    + (x(2)-1)^2 * 2*sin(2*pi*x(2))*cos(2*pi*x(2));
endfunction
