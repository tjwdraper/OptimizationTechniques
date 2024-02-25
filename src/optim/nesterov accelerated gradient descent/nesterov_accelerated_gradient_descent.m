function x = nesterov_accelerated_gradient_descent(f, df, x0, niter, convergence, verbose)
    fprintf("----------------------------------------------------------------------------------------------------\n");
    fprintf("| Nesterov accelerated gradient descent (NAGD) algorithm\n");
    fprintf("| Author: T.J.W. Draper\n");
    fprintf("| Year: 2024\n|\n");
    fprintf("| \n");
    fprintf("| x0 = (%.3f %.3f)\n", x0(1), x0(2));
    fprintf("| niter: %d\n", niter);
    fprintf("| convergence criterion: ||p|| < %.3f\n", convergence);
    fprintf("----------------------------------------------------------------------------------------------------\n");
    
    x = x0;
    y = x0;
    v = zeros(size(x0));
    
    gamma = 0.90; % Nesterov's momentum parameter
    learningrate = 1e-4; % "Standard" GD learning rate
    
    for iter = 1 : niter
        % Take a step in the direction of the previous gradient
        y = x - gamma * v;
        
        % Calculate the gradient at that position
        p = df(y);
        
        % Combine the step direction p with the momentum to get Nesterov's 
        % accelerated gradient (NAG)
        v = gamma * v + learningrate * p;

        % Update the position with NAG.      
        x = x - v;

        % check if convergence criterion is reached
        if ( sqrt(p(:).^2) < convergence)
            fprintf("Convergence reached on iteration %d. Final estimate: x = (%.3f %.3f)\n", iter, x(1), x(2));
            return;
        endif

        % display progress to command window
        if verbose
            fprintf("iter: %d - x: (%.3f %.3f)\n", iter, x(1), x(2));
        endif
    endfor
    
    fprintf("Maximum number of iterations reached. Final estimate: x = (%.3f %.3f)\n", x(1), x(2));
endfunction
