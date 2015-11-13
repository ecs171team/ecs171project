% Generate five coefficients
function W = coefficients(x,y)
  n = length(y);
  W = {};
  W{1} = olsSolver(x(1:n),y(1:n),0);
  W{2} = olsSolver(x(1:n),y(1:n),1);
  W{3} = olsSolver(x(1:n),y(1:n),2);
  W{4} = olsSolver(x(1:n),y(1:n),3);
  W{5} = olsSolver(x(1:n),y(1:n),4);
end