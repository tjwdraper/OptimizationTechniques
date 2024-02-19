function isposdef = posdef(A)
    % For 2x2 matrix we have following two identities: 
    % lambda_1 + lambda_2 = tr(A)
    % lambda_1 * lambda_2 = det(A)
    % So A = posdef iff tr(A) > 0 && det(A) > 0
    isposdef = (trace(A) > 0) && (det(A) > 0);
endfunction