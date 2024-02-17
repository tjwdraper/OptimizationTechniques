function p = lbfgs_iteration(iter)
    # Allocate auxiliary variables
    persistent x, y, s, g;
    if isempty(x)
        x = zeros(2, m);
        y = zeros(2, m);
        s = zeros(2, m);
        g = zeros(2, m);
    endif
    
    % Initialize the vectors alpha, beta and rho
    alpha = zeros(m, 1);
    beta = zeros(m, 1);
    rho = zeros(m, 1);
    
    % If iter <= m, warm-up, do gradient descent and get values of x and grad f(x)
    if iter <= m
        
    else
        
    endif
    
endfunction

persistent x, y, s, g;
    
    if isempty(x)
    endif
    
    
    
    % Shift values of s and g
    for i = 2 : m
        s(:,i) = s(:,i-1);
        y(:,i) = y(:,i-1);
    endfor
    s(:,1) = []
    
    % Get values of s, y, and rho
    for i = 1 : m
        alpha(i) = 
    endfor