% Fourier Series Approximation of f(x)
clc;
clear;

% Define the number of terms in the Fourier series
N = 10; % You can increase this for better accuracy

% Define the range of x values
x = linspace(-8*pi, 8*pi, 1000); % For plotting in [-8π, 8π]

% Initialize the Fourier series approximation
f_approx = zeros(size(x));

% Compute the Fourier series terms
for n = 1:2:N % Only odd n
    b_n = 4 / (n * pi); % Coefficients for sine terms
    f_approx = f_approx + b_n * sin(n * x);
end

% Original function f(x) in one period [-π, π]
f_original = @(x) -1 .* (x > -pi & x < 0) + 1 .* (x >= 0 & x < pi);

% Plot the results
figure;
hold on;

% Plot the Fourier approximation
plot(x, f_approx, 'r', 'LineWidth', 1.5, 'DisplayName', 'Fourier Approximation');

% Plot the original function for one period [-π, π]
x_original = linspace(-pi, pi, 1000);
plot(x_original, f_original(x_original), 'k--', 'LineWidth', 1.5, 'DisplayName', 'Original Function');

% Add labels and legend
xlabel('x');
ylabel('f(x)');
title(['Fourier Series Approximation with N = ', num2str(N)]);
legend('show');
grid on;

% Set limits for plotting
xlim([-8*pi, 8*pi]);
ylim([-1.5, 1.5]);

hold off;
