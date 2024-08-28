% cetvrti primer je samo radi demonstracije da se iterativna metoda ne
% ponasa dobro kada imamo Kosijev problem gde nema analitickog resenja

function cetvrti_primer()

% imamo zadat Kosijev problem: x' = sin(t) + x^2
% x(0) = 1
% za ovaj problem nema analitickog resenja!

% sve cemo plot-ovati na intervalu [0 5] sa korakom 0.01

% prvo izracunavamo egzaktno resenje 
t_osa = 0:0.01:5;
f = @(t,x) sin(t) + x.^2;
%f_exact = @(t) (t.^3)/3 - 2.*(t.^2) + 3.*t - 6.*exp(t) + 14;
%exact = f_exact(t_osa);


% za iterativnu metodu cemo koristiti trideset iteracija
iterativna_aproksimacija = iterativna(f,0,1,30);
[R_unapred, unapred] = Ojler_unapred(f,0,1,5);
[R_unazad, unazad] = Ojler_unazad(f,0,1,5);
[R_modifikovan, modifikovan] = Ojler_modifikovan(f,0,1,5);
[R_runge_kutta, runge_kutta] = Runge_Kutta(f,0,1,5);


% prvo plotujemo aproksimacije funkcije bez ikakvih ocena gresaka
figure('Name','Aproksimacije')
hold on
plot(t_osa,iterativna_aproksimacija(t_osa),'color','m','LineWidth',2);
plot(t_osa,exact,'color','r','LineWidth',2);
plot(t_osa,unapred,'color','b','LineWidth',2);
plot(t_osa,unazad,'color','g','LineWidth',2);
plot(t_osa,modifikovan,'color','y','LineWidth',2);
plot(t_osa,runge_kutta,'color','k','LineWidth',2);
hold off
legend('Iterativna','Analiticko resenje','Ojler unapred','Ojler unazad','Modifikovani Ojler','Metoda Runge-Kutta');


% ispisivanje najbolje predstave efikasnosti metode
iterativna_res = sum(iterativna_abs)/length(t_osa);
unapred_res = sum(unapred_abs)/length(t_osa);
unazad_res = sum(unapred_abs)/length(t_osa);
modifikovan_res = sum(modifikovan_abs)/length(t_osa);
runge_kutta_res = sum(runge_kutta_abs)/length(t_osa);
fprintf("iterativna metoda: %f\n", iterativna_res);
fprintf("Ojler unapred: %f\n", unapred_res);
fprintf("Ojler unazad: %f\n", unazad_res);
fprintf("Modifikovan Ojler: %f\n", modifikovan_res);
fprintf("Metoda Runge-Kutta: %f\n", runge_kutta_res);

% sada plotujemo Rungeove ocene gresaka
figure('Name','Rungeova ocena greske')
hold on
plot(t_osa(1:2:end),R_unapred,'color','b','LineWidth',2);
plot(t_osa(1:2:end),R_unazad,'color','g','LineWidth',2);
plot(t_osa(1:2:end),R_modifikovan,'color','y','LineWidth',2);
plot(t_osa(1:2:end),R_runge_kutta,'color','k','LineWidth',2);
hold off
legend('Ojler unapred', 'Ojler unazad', 'Modifikovani Ojler', 'Metoda Runge-Kutta')