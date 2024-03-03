% Approximate the gradient of function f at position x with a finite difference 
% approximation
function dxx = approx_hes(f, x)
    dxx = zeros(2,1);
    
    % Get the step size
    eps = 1e-5;
    
    % Take central finite difference approximation in both directions
    for d = 1 : 2
        x_for = x;
        x_back = x;
        
        x_for(d,1) += eps;
        x_back(d,1) -= eps;
        
        dxx(d,d) = (f(x_for) - 2*f(x) + f(x_back))/(eps^2);
    endfor
    
    x_ff = x_fb = x_bf = x_bb = x;
    x_ff += eps;
    x_bb -= eps;
    x_fb(1) += eps; x_fb(2) -= eps;
    x_bf(1) -= eps; x_bf(2) += eps;
    
    dxx(1,2) = dxx(2,1) = (f(x_ff) - f(x_fb) - f(x_bf) + f(x_bb)) / (4*eps^2);
    
endfunction
