 N = 5;
L = 0.5;
h = L/(N);
x = 0:0.001:L;
k = 1000;
A = 10*10^-3;
T_a = 100;
T_b = 500;
T(N) = 500;
T(1) = 100;

C(N,N) = 0;
D(N) = 0;
for i = 1:N
    if i >1 && i < N
        C(i,i) = 2*k*A/h;
        C(i,i-1) = -k*A/h;
        C(i,i+1) = -k*A/h;
        D(i) = 0;
    elseif i ==1
       C(i,i) = 3*k*A/h;
       C(i,i+1) = -k*A/h;
       D(i) = 2*k*(A/h)*T_a;
    else
       C(i,i)= 3*k*A/h;
       C(i,i-1) = -k*A/h;
       D(i) = 2*k*(A/h)*T_b;
    end
end


T = C\D;

x_g = h/2:h:(N)*h;
figure(1); hold on
plot(x_g, T, 'ro', 'LineWidth',1)
plot([0, L], [T_a, T_b], 'ko', 'LineWidth', 1)
xlabel('x (m)', 'interpret','latex')
ylabel('T (K)','interpret','latex')
set(gca, 'TickLableInterpreter','')
yticks{[100:100:500]}
