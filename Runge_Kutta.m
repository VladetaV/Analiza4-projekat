% Metoda Runge-Kutta
%    k1=h*f(t,x(t))
%    k2=h*f(t+h/2,x(t)+k1/2)
%    k3=h*f(t+h/2,x(t)+k2/2)
%    k4=h*f(t+h,x(t)+k3)
%    x(t+h)=x(t)+(k1+2*k2+2*k3+k4)/6
function [R, aproks] = Runge_Kutta(f, t0, x0, t_max)
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

% izracunavamo Rungeovu ocenu greske
% x(t+2h) - aproks(t+2h) ~ (aproks(t+2h) - aproks_runge(t+2h))/(2^p - 1)
h = h*2;
t = t0;
y = x0;
aproks_runge = x0;
t_osa = t0:h:t_max;
T = length(t_osa);
while(length(aproks_runge)<T)
   k1 = h * f(t,y);
   k2 = h * f(t + h/2, y + k1/2);
   k3 = h * f(t + h/2, y + k2/2);
   k4 = h * f(t + h, y + k3);
    
   y = y + (k1 + 2*k2 + 2*k3 + k4)/6;
   aproks_runge = [aproks_runge y];
   t = t+h;
end

% red metode je 4 pa je p = 4
p = 4;
R = (aproks(1:2:end) - aproks_runge)./(2^p - 1);
