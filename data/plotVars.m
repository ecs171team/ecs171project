% Generate five coefficients from order 0 to order 4 then calculate the mse
function plotVars(x1,y1,x2,y2,var)
    W = coefficients(x1,y1);
    for n = 1:5
        mse(x1,y1,x2,y2,W{n});
    end
    singleVarReg(x2,y2,W,var);
end