function x = newton(f, df, Hinvf, x0, niter, convergence)
    x = x0;

    for iter = 1 : niter
        % Get the inverse Hessian at current estimate
        Hinv = Hinvf(x);
        
        % Check that the Hessian is positive definite
        if ~posdef(Hinv)
            Hinv = eye(2);
            fprintf("iter: %d - Hessian is not positive definite, use gradient descent instead\n", iter);
        endif
        
        % get step direction
        p = -Hinv * df(x);

        % get the step size
        alpha = line_search(f, df, x, p);
        
        % check if convergence criterion is reached
        if ( sqrt(p(:).^2) < convergence)
            fprintf("Convergence reached on iteration %d\n", iter);
            break;
        endif

        % increment estimate
        x = x + alpha * p;

        % display progress to command window
        if mod(iter, 100) == 0
            fprintf("iter: %d - x: [%.3f %.3f]\n", iter, x(1), x(2));
        endif

    endfor
endfunction
