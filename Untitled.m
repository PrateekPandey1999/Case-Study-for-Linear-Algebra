N = 5;
L = 0.5;
h = L/N;
x = 0:h:L;
k = 1000;
A = 10*10^-3;
T_a = 100;
T_b = 500;
T = zeros(N, 1);
T(1) = T_a;
T(N) = T_b;

C = zeros(N, N);
D = zeros(N, 1);

for i = 1:N
    if i > 1 && i < N
        C(i, i) = 2*k*A/h;
        C(i, i-1) = -k*A/h;
        C(i, i+1) = -k*A/h;
        D(i) = 0;
    elseif i == 1
        C(i, i) = 3*k*A/h;
        C(i, i+1) = -k*A/h;
        D(i) = 2*k*(A/h)*T_a;
    else
        C(i, i) = 3*k*A/h;
        C(i, i-1) = -k*A/h;
        D(i) = 2*k*(A/h)*T_b;
    end
end

T_result = C \ D;

x_g = h/2:h:L-h/2;
figure(1); hold on
plot(x_g, T_result, 'ro', 'LineWidth', 1)
plot([0, L], [T_a, T_b], 'ko', 'LineWidth', 1)
xlabel('x (m)', 'interpreter', 'latex')
ylabel('T (K)', 'interpreter', 'latex')

% Set YTick and TickLabelInterpreter
yticks([100:100:500])
yticklabels({'100', '200', '300', '400', '500'})
set(gca, 'TickLabelInterpreter', 'latex')
