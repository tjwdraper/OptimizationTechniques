function x = lbfgs(f, df, x0, niter, convergence, m)
    g = zeros(2, niter);
    y = zeros(2, niter);
    s = zeros(2, niter);
    x = zeros(2, niter);

    x(:, 1) = x0;

    alpha = zeros(1, niter);
    beta  = zeros(1, niter);
    gamma = zeros(1, niter);
    rho   = zeros(1, niter);

    for iter = 1 : niter
##      fprintf("Iteration: %d\n", iter);
      % Get new values of x and g
      g(:, iter) = df(x(:, iter));

      % Get the steepest descent direction
      q = g(:, iter);

      % Get values of rho, s and y
      for i = iter-1:-1:iter-m
        if (i < 1)
          continue;
        endif

        s(:, i) = x(:, i+1) - x(:, i);
        y(:, i) = g(:, i+1) - g(:, i);

        yTs = y(:, i)' * s(:, i);
        if (yTs ~= 0)
          rho(i) = 1 / yTs;
        else
          rho(i) = 0;
        endif

##        fprintf("rho(%d): %.5f\n", i, rho(i));
      endfor



      % Get values of alpha and update q
      for i = iter-1:-1:iter-m
        if (i < 1)
          continue;
        endif

        alpha(i) = rho(i) * s(:, i)' * q;
        q = q - alpha(i) * y(:, i);

##        fprintf("alpha(%d): %.5f\n", i, alpha(i));
##        fprintf("q(%d): (%.5f %.5f)\n", i, q(1), q(2));
      endfor

      % Get the value of gamma
      if (iter == 1)
        gamma(iter) = 1;
      elseif (y(:, iter-1)' * y(:,iter-1) == 0)
        gamma(iter) = 1;
      else
        gamma(iter) = s(:, iter-1)' * y(:, iter-1) / (y(:, iter-1)' * y(:,iter-1));
      endif
##      fprintf("gamma(%d): %.5f\n", iter, gamma(iter));

      % Get initial value of search direction
      p = gamma(iter) * q;

##      fprintf("p(%d): (%.5f %.5f)\n", iter, p(1), p(2));
      % Get values of beta and update p
      for i = iter-m:iter-1
        if i < 1
          continue;
        endif

        beta(i) = rho(i) * y(:,i)' * p;
        p = p + s(:, i) * (alpha(i) - beta(i));

##        fprintf("beta(%d): %.5f\n", i, beta(i));
##        fprintf("p(%d): (%.5f %.5f)\n", i, p(1), p(2));

      endfor

      % Get correct direction
      p = -p;

      % Do a line search
      step = line_search(f, df, x(:,iter), p);

      % check if convergence criterion is reached
      if ( sqrt(p(:).^2) < convergence)
        fprintf("Convergence reached on iteration %d\n", iter);
        x = x(:,iter);
        break;
      endif

      % Update estimate
      x(:, iter+1) = x(:, iter) + step * p;

      % display progress to command window
      if mod(iter, 1) == 0
          fprintf("iter: %d - x: [%.3f %.3f]\n", iter, x(1, iter), x(2, iter));
      endif
    endfor
    x = x(:,end);
endfunction
