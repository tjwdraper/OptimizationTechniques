function dx = grad_easom(x)
  dx(1,1) = sin(x(1))*cos(x(2))*exp( -( (x(1)-pi)^2 + (x(2)-pi)^2 ) ) ...
    + 2*cos(x(1))*cos(x(2))*exp( -( (x(1)-pi)^2 + (x(2)-pi)^2 ) )*(x(1)-pi);

   dx(2,1) = cos(x(1))*sin(x(2))*exp( -( (x(1)-pi)^2 + (x(2)-pi)^2 ) ) ...
    + 2*cos(x(1))*cos(x(2))*exp( -( (x(1)-pi)^2 + (x(2)-pi)^2 ) )*(x(2)-pi);
endfunction
