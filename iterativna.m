% iterativna (Pikarova) metoda za resavanje diferencijalne jednacine
% kao ulaz imamo funkciju f(t,x), pocetni trenutak, pocetnu vrednost
% i broj iteracija
% rezultat je funkcija koja je resenje datog Kosijevog problema
function y = iterativna(f, t0, x0, iterations)

% prevodimo obicnu matlab funkciju u simbolicku funkciju kako bismo
% dobili simbolicku funkciju koju mozemo da integralimo
% ne zaboravimo da je ovo funkcija od x i t !!!
f = sym(f);

% deklarisemo simbolicke promenljive t, x i s --> s nam treba kako bismo
% zamenili t u integralu
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
% y vracamo iz simbolicke funkcije nazad u matlab f-ju
y = matlabFunction(y);

