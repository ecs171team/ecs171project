function singleVarReg(x,y,W,name)
    figure;
    z = transpose(min(x):0.01:max(x));
    y1 = yhat(z,cell2mat(W(1)));
    y2 = yhat(z,cell2mat(W(2)));
    y3 = yhat(z,cell2mat(W(3)));
    y4 = yhat(z,cell2mat(W(4)));
    y5 = yhat(z,cell2mat(W(5)));
    plot(x,y,'ro');
    xlabel(name);
    ylabel('salary');
    hold all;
    plot(z,y1);
    plot(z,y2);
    plot(z,y3);
    plot(z,y4);
    plot(z,y5);
    % print(name,'-dpng');
end