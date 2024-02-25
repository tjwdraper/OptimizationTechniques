function x = lbfgs(f, df, x0, niter, convergence, m, verbose)
    fprintf("----------------------------------------------------------------------------------------------------\n");
    fprintf("| Limited-memory Broyden-Fletcher-Goldfarb-Shanno (L-BFGS) algorithm\n");
    fprintf("| Author: T.J.W. Draper\n");
    fprintf("| Year: 2024\n|\n");
    fprintf("| \n");
    fprintf("| x0 = (%.3f %.3f)\n", x0(1), x0(2));
    fprintf("| niter: %d\n", niter);
    fprintf("| convergence criterion: ||p|| < %.3f\n", convergence);
    fprintf("| m: %d\n", m);
    fprintf("----------------------------------------------------------------------------------------------------\n");
    
    % Initialize arrays to store estimate of x, the gradient and the 
    % differences.
    g = zeros(2, niter);
    y = zeros(2, niter);
    s = zeros(2, niter);
    x = zeros(2, niter);

    x(:, 1) = x0; % Initial guess

    % Initialize arrays for L-BFGS variables
    alpha = zeros(1, niter);
    beta  = zeros(1, niter);
    gamma = zeros(1, niter);
    rho   = zeros(1, niter);

    for iter = 1 : niter
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
      endfor

      % Get values of alpha and update q
      for i = iter-1:-1:iter-m
        if (i < 1)
          continue;
        endif

        alpha(i) = rho(i) * s(:, i)' * q;
        q = q - alpha(i) * y(:, i);
      endfor

      % Get the value of gamma
      if (iter == 1)
        gamma(iter) = 1;
      elseif (y(:, iter-1)' * y(:,iter-1) == 0)
        gamma(iter) = 1;
      else
        gamma(iter) = s(:, iter-1)' * y(:, iter-1) / (y(:, iter-1)' * y(:,iter-1));
      endif

      % Get initial value of search direction
      p = gamma(iter) * q;
      
      % Get values of beta and update p
      for i = iter-m:iter-1
        if i < 1
          continue;
        endif

        beta(i) = rho(i) * y(:,i)' * p;
        p = p + s(:, i) * (alpha(i) - beta(i));

      endfor

      % Get correct direction
      p = -p;

      % Do a line search
      step = line_search(f, df, x(:,iter), p);

      % check if convergence criterion is reached
      if ( sqrt(p(:).^2) < convergence)
          fprintf("Convergence reached on iteration %d. Final estimate: x = (%.3f %.3f)\n", iter, x(1,iter), x(2,iter));
          return;
      endif

      % Update estimate
      x(:, iter+1) = x(:, iter) + step * p;

      % display progress to command window
      if verbose
          fprintf("iter: %d - x: (%.3f %.3f)\n", iter, x(1,iter), x(2,iter));
      endif
    endfor
    
    x = x(:,end);
    fprintf("Maximum number of iterations reached. Final estimate: x = (%.3f %.3f)\n", x(1), x(2));
endfunction
