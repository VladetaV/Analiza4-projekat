% Ojlerova metoda unazad za resavanje datog Kosijevog problema
% x(t+h) = x(t) + h*f(t+h,x(t+h))
% funkcija kao argumente prima f-ju f od t i x, pocetni trenutak t0,
% pocetnu vrednost x0 i tacku do koje hocemo da plotujemo
function [R, aproks_unazad] = Ojler_unazad(f, t0, x0, t_max)

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
    aproks_unazad = [aproks_unazad, yp];
    t = t + h;
end

% izracunavamo Rungeovu ocenu greske
% x(t+2h) - aproks(t+2h) ~ (aproks(t+2h) - aproks_runge(t+2h))/(2^p - 1)
h = h*2;
t = t0;
y = x0;
aproks_unazad_runge = x0;
t_osa = t0:h:t_max;
T = length(t_osa);
while(length(aproks_unazad_runge)<T)
    y = y + h*f(t,y);
    yp = y + h*f(t+h,y);
    aproks_unazad_runge = [aproks_unazad_runge, yp];
    t = t + h;
end

% red metode je 1 pa je p = 1
p = 1;
length(aproks_unazad(1:2:end))
length(aproks_unazad_runge)
R = (aproks_unazad(1:2:end) - aproks_unazad_runge)./(2^p - 1);
