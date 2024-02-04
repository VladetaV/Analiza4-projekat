% iterativna (Pikarova) metoda za resavanje diferencijalne jednacine
% kao ulaz imamo funkciju f(t,x), broj iteracija i interval na kojem
% hocemo da plotujemo funkciju
% rezultat je funkcija koja je resenje datog Kosijevog problema
function y = iterativna(f, t0, x0, iterations, xrange)

% prevodimo obicnu matlab funkciju u simbolicku funkciju kako bismo
% dobili simbolicku funkciju koju mozemo da integralimo
% ne zaboravimo da je ovo funkcija od x i t !!!
f = sym(f);

% deklarisemo simbolicke promenljive t i x
syms s x t
% menjamo t sa s kako bi u granicama integrala moglo da nam stoji t
f = subs(f,t,s);

% y_sub je aproksimacija funkcije u i-toj iteraciji
% pocetna iteracija je upravo x0
y_sub = sym(x0);
for i = 1:iterations
    y = x0 + int(subs(f, x, y_sub), t0, s);
    y_sub = y;
end

% vracamo smenu s=t
y = subs(y,s,t);
% plotovanje rezultujuce funkcije
% da bismo plotovali datu funkciju prvo je moramo pretvoriti iz simblolicke
% nazad u matlab f-ju
y_m = matlabFunction(y);
hold on;
fplot(y_m, xrange, 'k');
hold off;
xlabel('x');
ylabel('y');
