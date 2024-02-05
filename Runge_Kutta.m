% Metoda Runge-Kutta
%    k1=h*f(x0+(i-1)*h,v(i));
%    k2=h*f(x0+(i-1/2)*h,v(i)+k1/2);
%    k3=h*f(x0+(i-1/2)*h,v(i)+k2/2);
%    k4=h*f(x0+i*h,v(i)+k3);

function Runge_Kutta(f, t0, x0, t_max)
h = 0.01;
t = t0;
aproks = x0;
y = x0;
t_osa = t:h:t_max;
T = length(t_osa);

while(length(aproks)<T)
   k1 = h * f(t,y);
   k2 = h * f(t + h/2, y + k1/2);
   k3 = h * f(t + h/2, y + k2/2);
   k4 = h * f(t + h, y + k3);
    
   y = y + (k1 + 2*k2 + 2*k3 + k4)/6;
   aproks = [aproks y];
   t = t+h;
end

hold on
n = @(t) 2*exp(-2.*t) + exp(t) % analiticko resenje
plot(0:0.001:1,n(0:0.001:1),'r')
plot(t_osa, aproks, 'k');
hold off

