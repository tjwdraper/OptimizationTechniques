function x = nesterov_accelerated_gradient_descent(f, df, x0, niter, convergence)
    x = x0;
    y = x0;
    v = zeros(size(x0));
    
    gamma = 0.90;
    alpha = 1e-4;
    
    for iter = 1 : niter
        y = x - gamma * v;
        
        p = df(y);
        
        v = gamma * v + alpha * p;
        
        x = x - v;

        % check if convergence criterion is reached
        if ( sqrt(p(:).^2) < convergence)
            fprintf("Convergence reached on iteration %d\n", iter);
            break;
        endif
        

        % display progress to command window
        if mod(iter, 100) == 0
            fprintf("iter: %d - x: [%.3f %.3f]\n", iter, x(1), x(2));
        endif

    endfor
endfunction
