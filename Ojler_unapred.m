% Ojlerova metoda unapred za resavanje datog Kosijevog problema
% x(t+h) = x(t) + h*f(t,x(t))
% funkcija kao argumente prima f-ju f od t i x, pocetni trenutak t0,
% pocetnu vrednost x0, pocetak intervala i kraj intervala
function Ojler_unapred(f, t0, x0, t_max)

% zadajemo korak h (konfigurabilno)
h = 0.01;
t = t0;
y = x0;
y_osa = x0;
t_osa = t0:h:t_max;
T = length(t_osa);

while(length(y_osa) < T)
    y = y + h*f(t,y);
    y_osa = [y_osa y];
    t = t + h;
end
hold on
plot(t_osa,y_osa, 'r');
plot(t_osa,exp(t_osa+1)-t_osa-1,'b');
plot(t_osa,abs(exp(t_osa+1)-t_osa-1 - y_osa),'g');
hold off