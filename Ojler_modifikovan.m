% Modifikovana Ojlerova metoda
% x(t+h)=x(t)+h*f(t+h/2,x*), x*=x(t)+h/2*f(t,x(t))
function [R, aproks] = Ojler_modifikovan(f, t0, x0, t_max)

% zadajemo korak h (konfigurabilno)
h = 0.01;
t = t0;
y = x0;
aproks = x0;
t_osa = t0:h:t_max;
T = length(t_osa);

while(length(aproks) < T)
    yp = y + (h/2) * f(t,y);
    y = y + h*f(t+h/2,yp);
    aproks = [aproks y];
    t = t + h;
end

% izracunavamo Rungeovu ocenu greske
% x(t+2h) - aproks(t+2h) ~ (aproks(t+2h) - aproks_runge(t+2h))/(2^p - 1)
h = h*2;
t = t0;
y = x0;
aproks_runge = x0;
t_osa = t0:h:t_max;
T = length(t_osa);
while(length(aproks_runge)<T)
    yp = y + h/2 * f(t,y);
    y = y + h*f(t+h/2,yp);
    aproks_runge = [aproks_runge y];
    t = t + h;
end

% red metode je 2 pa je p = 2
p = 2;
R = (aproks(1:2:end) - aproks_runge)./(2^p - 1);


