function f = rosenbrock(x)
    f = (1.0-x(1)).^2 + 100.0*(x(2)-x(1).^2).^2;
endfunction
