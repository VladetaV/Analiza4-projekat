function  prvi_primer()

% imamo zadat Kosijev problem: x' = -2*x + 3*exp(t)
% x(0) = 3
% resenje ovog problema je x(t) = 3*exp(-2t) + exp(t)

% sve cemo plot-ovati na intervalu [0 1] sa korakom 0.01

% prvo izracunavamo egzaktno resenje 
t_osa = 0:0.01:1;
f = @(t,x) (-2).*x + 3.*exp(t);
f_exact = @(t) 2.*exp(-2*t) + exp(t);
exact = f_exact(t_osa);

[R_unapred, unapred] = Ojler_unapred(f,0,3,1);
[R_unazad, unazad] = Ojler_unazad(f,0,3,1);
[R_modifikovan, modifikovan] = Ojler_modifikovan(f,0,3,1);
[R_runge_kutta, runge_kutta] = Runge_Kutta(f,0,3,1);

% racunamo razlike izmedju egzaktnog resenja i razlicitih metoda 
unapred_abs = abs(unapred - exact);
unazad_abs = abs(unazad - exact);
modifikovan_abs = abs(modifikovan - exact);
runge_kutta_abs = abs(runge_kutta - exact);

% prvo plotujemo aproksimacije funkcije bez ikakvih ocena gresaka
figure(1)
hold on
plot(t_osa,exact,'color','r','LineWidth',2);
plot(t_osa,unapred,'color','b','LineWidth',2);
plot(t_osa,unazad,'color','g','LineWidth',2);
plot(t_osa,modifikovan,'color','y','LineWidth',2);
plot(t_osa,runge_kutta,'color','k','LineWidth',2);
hold off
legend('Analiticko resenje','Ojler unapred','Ojler unazad','Modifikovani Ojler','Metoda Runge-Kutta');

% sada plotujemo apsolutne razlike izmedju aproksimacija i egzaktnog
% resenja
figure(2)
hold on
plot(t_osa,unapred_abs,'color','b','LineWidth',2);
plot(t_osa,unazad_abs,'color','g','LineWidth',2);
plot(t_osa,modifikovan_abs,'color','y','LineWidth',2);
plot(t_osa,runge_kutta_abs,'color','k','LineWidth',2);
hold off
legend('Ojler unapred', 'Ojler unazad', 'Modifikovani Ojler', 'Metoda Runge-Kutta')

% sada plotujemo Rungeove ocene gresaka
figure(3)
hold on
plot(t_osa(1:2:end),R_unapred,'color','b','LineWidth',2);
plot(t_osa(1:2:end),R_unazad,'color','g','LineWidth',2);
plot(t_osa(1:2:end),R_modifikovan,'color','y','LineWidth',2);
plot(t_osa(1:2:end),R_runge_kutta,'color','k','LineWidth',2);
hold off
legend('Ojler unapred', 'Ojler unazad', 'Modifikovani Ojler', 'Metoda Runge-Kutta')