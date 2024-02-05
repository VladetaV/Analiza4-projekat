% Ojlerova metoda unazad za resavanje datog Kosijevog problema
% x(t+h) = x(t) + h*f(t,x(t))
% funkcija kao argumente prima f-ju f od t i x, pocetni trenutak t0,
% pocetnu vrednost x0 i tacku do koje hocemo da plotujemo
function Ojler_unazad(f, t0, x0, t_max)

% zadajemo korak h (konfigurabilno)
h = 0.01;
t = t0;
y = x0;
aproks_unazad = x0;
aproks_unapred = x0;
t_osa = t0:h:t_max;
T = length(t_osa);

while(length(aproks_unazad) < T)
    y = y + h*f(t,y);
    yp = y + h*f(t+h,y);
    aproksunapred = [aproks_unapred y];
    aproks_unazad = [aproks_unazad, yp];
    t = t + h;
end
hold on
plot(t_osa,aproks_unazad,'g');
hold off