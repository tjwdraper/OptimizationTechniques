function alpha = line_search(f, df, x, p)
  alpha = 1.0;

  rho = 0.80;
  c = 1e-4;

  while (f(x+alpha*p) > f(x) + c * alpha * df(x)' * p)
    alpha = rho * alpha;
  endwhile

endfunction
