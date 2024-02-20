function x = bfgs(f, df, x0, niter, convergence)
    x = x0;

    H = eye(2,2);
    gradf = df(x0);

    for iter = 1 : niter
        % get step direction
        p = -H * gradf;

        % get the step size
        alpha = line_search(f, df, x, p);

        % check if convergence criterion is reached
        if ( sqrt(p(:).^2) < convergence)
            fprintf("Convergence reached on iteration %d\n", iter);
            break;
        endif

        % Get the increment s and update estimate x
        s = alpha * p;

        x = x + s;

        % Get the new gradient
        gradf_prev = gradf;
        gradf = df(x);

        y = gradf - gradf_prev;

        % update inverse hessian estimate
        H = H ...
          + (s' * y + y' * H * y) * (s * s') / (s' * y)^2 ...
          - (H * y * s' + s * y' * H) / (s'* y);

        % display progress to command window
        if mod(iter, 100) == 0
            fprintf("iter: %d - x: [%.3f %.3f]\n", iter, x(1), x(2));
        endif

    endfor
endfunction
