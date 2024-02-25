function x = gradient_descent(f, df, x0, niter, convergence, verbose, learningrate)
    fprintf("----------------------------------------------------------------------------------------------------\n");
    fprintf("| Gradient Descent (GD)\n");
    fprintf("| Author: T.J.W. Draper\n");
    fprintf("| Year: 2024\n|\n");
    fprintf("| \n");
    fprintf("| x0 = (%.3f %.3f)\n", x0(1), x0(2));
    fprintf("| niter: %d\n", niter);
    fprintf("| convergence criterion: ||p|| < %.3f\n", convergence);
    fprintf("----------------------------------------------------------------------------------------------------\n");
    
    % Current estimate of solution
    x = x0;

    for iter = 1 : niter
        % get step direction
        p = -df(x);

        % get the step size
        if nargin == 7
            alpha = learningrate; % constant step size
        else
            alpha = line_search(f, df, x, p); % adaptive step size. Satisfy Armijo condition.
        endif

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
