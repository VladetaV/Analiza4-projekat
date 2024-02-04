
% Modifikovana Ojlerova metoda
% x(t+h)=x(t)+h*f(t+h/2,x*), x*=x(t)+h/2*f(t,x(t))
function Ojler_modifikovan(f, t0, x0, t_max)

h = 0.01;
t = t0;
y = x0;
y_osa = x0;
t_osa = t0:h:t_max;
T = length(t_osa);

while(length(y_osa) < T)
    yp = y + h/2 * f(t,y);
    y = y + h*f(t+h/2,yp);
    y_osa = [y_osa y];
    t = t + h;
end
hold on
plot(t_osa,y_osa, 'y');
hold off

