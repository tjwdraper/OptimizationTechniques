function x = dfp(f, df, x0, niter, convergence, verbose)
    fprintf("----------------------------------------------------------------------------------------------------\n");
    fprintf("| Davidon-Fletcher-Powell (DFP) algorithm\n");
    fprintf("| Author: T.J.W. Draper\n");
    fprintf("| Year: 2024\n|\n");
    fprintf("| \n");
    fprintf("| x0 = (%.3f %.3f)\n", x0(1), x0(2));
    fprintf("| niter: %d\n", niter);
    fprintf("| convergence criterion: ||p|| < %.3f\n", convergence);
    fprintf("----------------------------------------------------------------------------------------------------\n");
    
    % Current estimate of solution and its gradient
    x = x0;
    gradf = df(x0);

    % Specify initial estimate of the inverse Hessian. For lack of information, 
    % we estimate it with the identity matrix.
    H = eye(2,2);

    for iter = 1 : niter
        % get step direction
        p = -H * gradf;

        % get the step size
        alpha = line_search(f, df, x, p);

        % check if convergence criterion is reached
        if ( sqrt(p(:).^2) < convergence)
            fprintf("Convergence reached on iteration %d. Final estimate: x = (%.3f %.3f)\n", iter, x(1), x(2));
            return;
        endif

        % Get the increment s and update estimate x
        s = alpha * p;

        x = x + s;

        % Get the new gradient and update gradient difference y
        gradf_prev = gradf;
        gradf = df(x);

        y = gradf - gradf_prev;

        % update inverse Hessian estimate
        % Check if s' and y satisfy the curvature condition
        if (s' * y > 0)
            % DFP update
            H = H ...
                - H * y * y' * H / (y' * H * y) ...
                + s * s' / (y' * s);
        else
            % Reset to gradient descent
            H = eye(2, 2);
        endif

        % display progress to command window
        if verbose
            fprintf("iter: %d - x: (%.3f %.3f)\n", iter, x(1), x(2));
        endif
    endfor
    
    fprintf("Maximum number of iterations reached. Final estimate: x = (%.3f %.3f)\n", x(1), x(2));
endfunction
