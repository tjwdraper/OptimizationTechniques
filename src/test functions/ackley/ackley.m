function f = ackley(x)
    f = -20*exp(-0.2*sqrt( (x(1)^2 + x(2)^2)/2 )) - exp( (cos(2*pi*x(1)) + cos(2*pi*x(2)))/2 ) + 20 + exp(1);
endfunction