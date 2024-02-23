function x = bfgs(f, df, x0, niter, convergence)
    x = x0;

    H = eye(2,2);
    gradf = df(x0);

    for iter = 1 : niter
        fprintf("Iteration %d\n", iter);
        % get step direction
        p = -H * gradf;
        fprintf("Step direction p: (%d %d)\n", p(1), p(2));

        % get the step size
        alpha = line_search(f, df, x, p);
        fprintf("Step size alpha: %.3f\n", alpha);

        % check if convergence criterion is reached
        if ( sqrt(p(:).^2) < convergence)
            fprintf("Convergence reached on iteration %d\n", iter);
            break;
        endif

        % Get the increment s and update estimate x
        s = alpha * p;
        fprintf("Increment s: (%.3f %.3f)\n", s(1), s(2));

        x = x + s;
        fprintf("New estimate x: (%.3f %.3f)\n", x(1), x(2));

        % Get the new gradient
        gradf_prev = gradf;
        gradf = df(x);

        y = gradf - gradf_prev;
        fprintf("Difference in gradients: (%.3f %.3f)\n", y(1), y(2));

        % update inverse hessian estimate
        H = H ...
          + (s' * y + y' * H * y) * (s * s') / (s' * y)^2 ...
          - (H * y * s' + s * y' * H) / (s'* y);
        fprintf("New inverse Hessian estimate:\n");
        disp(H);

        % display progress to command window
        if mod(iter, 100) == 0
            fprintf("iter: %d - x: [%.3f %.3f]\n", iter, x(1), x(2));
        endif

    endfor
endfunction
