function alpha = line_search(f, df, x, p)
  alpha = 1.0;

  rho = 0.9;
  c = 1e-2;

  while (f(x+alpha*p) > f(x) + c * alpha * df(x)' * p)
    alpha = rho * alpha;
  endwhile

endfunction
