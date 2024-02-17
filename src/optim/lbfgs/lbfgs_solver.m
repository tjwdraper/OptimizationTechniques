function x = lbfgs_solver(x0, m, f, df)
    x = x0;
    
    for iter = 1 : 100
        % Get gradient at current position
        dx = df(x);
        
        % Get search direction as Hess^-1 grad E = p
        p = lbfgs_iteration(x, dx);
        
        % Get the step length alpha from the Wolfe conditions
        alpha = line_search();
        
        % Increment
        x = x + alpha * p;
    endfor
    
    
    
endfunction
