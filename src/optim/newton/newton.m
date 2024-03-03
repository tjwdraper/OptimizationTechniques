function x = newton(f, df, Hinvf, x0, niter, convergence, verbose)
    fprintf("----------------------------------------------------------------------------------------------------\n");
    fprintf("| Newton's algorithm\n");
    fprintf("| Author: T.J.W. Draper\n");
    fprintf("| Year: 2024\n|\n");
    fprintf("| \n");
    fprintf("| x0 = (%.3f %.3f)\n", x0(1), x0(2));
    fprintf("| niter: %d\n", niter);
    fprintf("| convergence criterion: ||p|| < %.3f\n", convergence);
    fprintf("----------------------------------------------------------------------------------------------------\n");
    
    x = x0;

    for iter = 1 : niter
        % Get the inverse Hessian at current estimate
        Hinv = Hinvf(x);
        
        % Check that the Hessian is positive definite
        if ~posdef(Hinv)
            Hinv = eye(2);
        endif
        
        % get step direction
        p = -Hinv * df(x);

        % get the step size
        alpha = line_search(f, df, x, p);
        
        % check if convergence criterion is reached
        if ( sqrt(p(:).^2) < convergence)
            fprintf("Convergence reached on iteration %d. Final estimate: x = (%.3f %.3f)\n", iter, x(1), x(2));
            return;
        endif

        % increment estimate
        x = x + alpha * p;

        % display progress to command window
        if verbose
            fprintf("iter: %d - x: (%.3f %.3f)\n", iter, x(1), x(2));
        endif
    endfor
    
    fprintf("Maximum number of iterations reached. Final estimate: x = (%.3f %.3f)\n", x(1), x(2));
endfunction
