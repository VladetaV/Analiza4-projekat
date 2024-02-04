% Ojlerova metoda unapred za resavanje datog Kosijevog problema
% x(t+h) = x(t) + h*f(t,x(t))
% funkcija kao argumente prima f-ju f od t i x, pocetni trenutak t0,
% pocetnu vrednost x0, pocetak intervala i kraj intervala
function Ojler_unazad(f, t0, x0, t_max)

% zadajemo korak h (konfigurabilno)
h = 0.01;
t = t0;
y = x0;
y_osa_unazad = x0;
y_osa_unapred = x0;
t_osa = t0:h:t_max;
T = length(t_osa);

while(length(y_osa_unapred) < T)
    y = y + h*f(t,y);
    yp = y + h*f(t+h,y);
    y_osa_unapred = [y_osa_unapred y];
    y_osa_unazad = [y_osa_unazad, yp];
    t = t + h;
end
hold on
plot(t_osa,y_osa_unapred, 'r');
plot(t_osa,y_osa_unazad,'g');
plot(t_osa,exp(t_osa+1)-t_osa-1,'b');
Ojler_modifikovan(f,0,exp(1)-1,5)
%z = iterativna(f,0,exp(1)-1,100,[0 5]);
%plot(t_osa,abs(exp(t_osa+1)-t_osa-1 - y_osa),'g');
hold off