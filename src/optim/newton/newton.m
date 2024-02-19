function x = newton(f, df, Hinvf, x0, niter, convergence)
    x = x0;

    for iter = 1 : niter
        % get step direction
        p = -Hinvf(x) * df(x);

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