function x = sr1(f, df, x0, niter, convergence, verbose)
    fprintf("----------------------------------------------------------------------------------------------------\n");
    fprintf("| Symmetric rank-one (SR1) algorithm\n");
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
    B = eye(2,2);
    H = eye(2,2);
    
    %
    r = 1e-8;

    for iter = 1 : niter
        % Check that the Hessian is positive definite
        if ~posdef(H)
            disp("H is not positive definite");
            
            B = eye(2,2);
            H = eye(2,2);
        endif
        
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

        % update Hessian and inverse Hessian estimate
        B = B ...
            + (y - B * s) * (y - B * s)' / ((y - B * s)' * s);
            
        % Check if the denominator of the update in the inverse Hessian estimate 
        % is not too small
        if ( abs(s' * (y - B * s)) < r * norm(s) * norm(y - B * s) )
            fprintf("Update in Hessian estiamte cannot be done. Vanishing denominator")
            H = H;
        else
            H = H ...
                + (s - H * y) * (s - H * y)' / ((s - H * y)' * y);
        endif            
            
        % display progress to command window
        if verbose
            fprintf("iter: %d - x: (%.3f %.3f)\n", iter, x(1), x(2));
        endif
    endfor
    
    fprintf("Maximum number of iterations reached. Final estimate: x = (%.3f %.3f)\n", x(1), x(2));
endfunction
