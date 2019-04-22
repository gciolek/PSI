function fx = Rast3D(x)
    if x == 0
        fx = 0;
    else
        A = 10;
        n=100;
        x1 = x;
        dx = (5.12-x)/n;

        for i = 1:n
            x = x1 + (i * dx);
            fx = (A*n) + ((x.^2) - (A * cos(2 * pi * x)));
        end
  %      disp(fx)
    end
end