function peti_primer()

% imamo zadat Kosijev problem: x' = t + x
% x(0) = e - 1
% resenje ovog problema je x(t) = exp(t+1)-t-1

% sve cemo plot-ovati na intervalu [0 5] sa korakom 0.01

% prvo izracunavamo egzaktno resenje 
t_osa = 0:0.01:5;
f = @(t,x) t + x;
f_exact = @(t) exp(t+1)-t-1;
exact = f_exact(t_osa);


% za iterativnu metodu cemo koristiti trideset iteracija
iterativna_aproksimacija = iterativna(f,0,exp(1) - 1 ,30);
[R_unapred, unapred] = Ojler_unapred(f,0,exp(1) - 1,5);
[R_unazad, unazad] = Ojler_unazad(f,0,exp(1) - 1,5);
[R_modifikovan, modifikovan] = Ojler_modifikovan(f,0,exp(1) - 1,5);
[R_runge_kutta, runge_kutta] = Runge_Kutta(f,0,exp(1) - 1,5);

% racunamo razlike izmedju egzaktnog resenja i razlicitih metoda
iterativna_abs = abs(iterativna_aproksimacija(t_osa)-exact);
unapred_abs = abs(unapred - exact);
unazad_abs = abs(unazad - exact);
modifikovan_abs = abs(modifikovan - exact);
runge_kutta_abs = abs(runge_kutta - exact);

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

% sada plotujemo apsolutne razlike izmedju aproksimacija i egzaktnog resenja
figure('Name','Apsolutne greske')
hold on
plot(t_osa,iterativna_abs,'color','m','LineWidth',2)
plot(t_osa,unapred_abs,'color','b','LineWidth',2);
plot(t_osa,unazad_abs,'color','g','LineWidth',2);
plot(t_osa,modifikovan_abs,'color','y','LineWidth',2);
plot(t_osa,runge_kutta_abs,'color','k','LineWidth',2);
hold off
legend('Iterativna','Ojler unapred', 'Ojler unazad', 'Modifikovani Ojler', 'Metoda Runge-Kutta')

% plotujemo relativne greske
figure('Name', 'Relativne greske')
hold on
plot(t_osa,iterativna_abs./abs(exact),'color','m','LineWidth',2)
plot(t_osa,unapred_abs./abs(exact),'color','b','LineWidth',2);
plot(t_osa,unazad_abs./abs(exact),'color','g','LineWidth',2);
plot(t_osa,modifikovan_abs./abs(exact),'color','y','LineWidth',2);
plot(t_osa,runge_kutta_abs./abs(exact),'color','k','LineWidth',2);
hold off
legend('Iterativna','Ojler unapred', 'Ojler unazad', 'Modifikovani Ojler', 'Metoda Runge-Kutta')


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