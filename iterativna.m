% iterativna (Pikarova) metoda za resavanje diferencijalne jednacine
% kao ulazi imamo funkciju f(t,x), broj iteracija i interval na kojem
% hocemo da plotujemo funkciju
% rezultat je funkcija koja je resenje datog Kosijevog problema
function y = iterativna(f, t0, x0, iterations, xrange)

% prevodimo obicnu matlab funkciju u simbolicku funkciju kako bismo
% dobili simbolicku funkciju koju mozemo da integralimo
% ne zaboravimo da je ovo funkcija od x i t !!!
f = sym(f);

% deklarisemo simbolicke promenljive x i t
syms t x

% y_sub je aproksimacija funkcije u i-toj iteraciji
% pocetna iteracija je upravo x0
y_sub = sym(x0);
for i = 1:iterations
    y = x0 + int(subs(f, x, y_sub), t0, t);
    y_sub = y
end

% plotovanje rezultujuce funkcije
% da bismo plotovali datu funkciju prvo je moramo pretvoriti iz simblolicke
% nazad u matlab f-ju
y_m = matlabFunction(y);
hold on;
fplot(y_m, xrange, 'k');
n = @(t) 3*exp(2.*t) + 4*sin(t); % analiticko resenje
plot(0:0.5:100,n(0:0.5:100),'r');
hold off;
xlabel('x');
ylabel('y');
