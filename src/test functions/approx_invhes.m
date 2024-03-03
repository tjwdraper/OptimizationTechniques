% Approximate the inverse of the Hesse matrix of function f at position x
function dxx = approx_invhes(f, x)
    dxx = inv(approx_hes(f,x));
endfunction
