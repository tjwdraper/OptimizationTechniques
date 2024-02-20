function x = conjugate_gradient_descent(f, df, x0, niter, convergence)
    x = x0;

    p_prev = [1; 1]/2;
    s = [0; 0];
    
    for iter = 1 : niter
        % get steepest step direction
        p = -df(x);
        
        % get beta from Fletcher-Reeves
        beta = p' * p / (p_prev' * p_prev);
        
        % update conjugate step direction
        s = p + beta * s;

        % get the step size
        alpha = line_search(f, df, x, s);

        % check if convergence criterion is reached
        if ( sqrt(p(:).^2) < convergence)
            fprintf("Convergence reached on iteration %d\n", iter);
            break;
        endif

        % increment estimate
        x = x + alpha * s;

        % display progress to command window
        if mod(iter, 100) == 0
            fprintf("iter: %d - x: [%.3f %.3f]\n", iter, x(1), x(2));
        endif
        
        % update p_prev
        p_prev = p;

    endfor
endfunction
