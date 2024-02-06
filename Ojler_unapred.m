% Ojlerova metoda unapred za resavanje datog Kosijevog problema
% x(t+h) = x(t) + h*f(t,x(t))
% funkcija kao argumente prima f-ju f od t i x, pocetni trenutak t0,
% pocetnu vrednost x0 i tacku do koje hocemo da plotujemo
function [R, aproks] = Ojler_unapred(f, t0, x0, t_max)

% zadajemo korak h (konfigurabilno)
h = 0.01;

t = t0;
y = x0;
aproks = x0;
t_osa = t0:h:t_max;
T = length(t_osa);

while(length(aproks) < T)
    y = y + h*f(t,y);
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
    y = y + h*f(t,y);
    aproks_runge = [aproks_runge y];
    t = t + h;
end


% red metode je 1 pa je p = 1
p = 1;
R = (aproks(1:2:end) - aproks_runge)./(2^p - 1);

