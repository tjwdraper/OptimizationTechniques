function dx = grad_rosenbrock_fd(x)
    %% Approximate the gradient with a finite difference approximation
    dx = zeros(size(x));
    
    % Get the step size
    eps = 1e-5;
    
    % Take central finite difference approximation in both directions
    for d = 1 : size(x, 2)
        x_for = x;
        x_back = x;
        
        x_for(d) += eps;
        x_back(d) -= eps;
        
        dx(d) = (rosenbrock(x_for) - rosenbrock(x_back))/(2*eps);
    endfor
endfunction
