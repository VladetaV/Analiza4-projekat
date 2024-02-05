% Ojlerova metoda unapred za resavanje datog Kosijevog problema
% x(t+h) = x(t) + h*f(t,x(t))
% funkcija kao argumente prima f-ju f od t i x, pocetni trenutak t0,
% pocetnu vrednost x0 i tacku do koje hocemo da plotujemo
function Ojler_unapred(f, t0, x0, t_max)

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
hold on
plot(t_osa,aproks, 'g');
hold off