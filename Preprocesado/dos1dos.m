% --- Parámetros de la simulación ---
fs = 10000; % Frecuencia de muestreo
T = 0.1; % Duración de la señal (100 ms)
t = 0:1/fs:T;
f0 = 50; % Frecuencia fundamental de la onda cuadrada (Hz)

% --- Síntesis de la Onda Cuadrada aproximada Mediante Serie de Fourier ---
% La fórmula teórica de la onda cuadrada es la suma de:
% sin(2*pi*f0*t)/1 + sin(2*pi*3f0*t)/3 + sin(2*pi*5f0*t)/5 + ...


% 1. Componente Fundamental 
x1 = (1/1) * sin(2*pi*1*f0*t);
% 2. Armónico 3 (3 veces más rápido, 3 veces menos amplitud)
x3 = (1/3) * sin(2*pi*3*f0*t);
% 3. Armónico 5
x5 = (1/5) * sin(2*pi*5*f0*t);
% 4. Armónico 7
x7 = (1/7) * sin(2*pi*7*f0*t);

% Señal resultante sumada (Aproximación con 4 componentes impares)
x_sum = x1 + x3 + x5 + x7;

% Cálculo de la FFT de la señal sumada ---
N = length(x_sum);
X_fft = fft(x_sum);
f_axis = (0:N/2-1)*(fs/N); % Eje de frecuencias positivas
Amplitud = (2.0/N) * abs(X_fft(1:N/2)); % Magnitud normalizada real

%  Creación de la figura 
figure('Name', 'Síntesis de Fourier', 'Color', 'w', 'Position', [100, 100, 1000, 800]);

% Gráfica A: Componentes individuales
subplot(3,1,1);
plot(t * 1000, x1, 'b', 'LineWidth', 1.2, 'DisplayName', 'Fundamental (f_0)');
hold on;
plot(t * 1000, x3, 'r--', 'LineWidth', 1.2, 'DisplayName', '3f_0');
plot(t * 1000, x5, 'g:', 'LineWidth', 1.2, 'DisplayName', '5f_0');
% plot(t * 1000, x7, 'm-.', 'LineWidth', 1, 'DisplayName', '7f_0'); % Demasiadas líneas
title('A. Componentes Individuales (Senoides Puras)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Tiempo (ms)', 'FontSize', 11);
ylabel('Amplitud', 'FontSize', 11);
grid on;
legend('Location', 'northeast', 'FontSize', 10);
xlim([0 60]); % Zoom para ver un par de ciclos completos

% Gráfica B: Señal resultante (La suma)
subplot(3,1,2);
plot(t * 1000, x_sum, 'Color', [0.5 0 0.5], 'LineWidth', 2); % Púrpura
title('B. Señal Resultante (Suma de los 4 componentes impares)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Tiempo (ms)', 'FontSize', 11);
ylabel('Amplitud', 'FontSize', 11);
grid on;
xlim([0 60]);

% Gráfica C: Espectro
subplot(3,1,3);
stem(f_axis, Amplitud, 'k-', 'filled', 'LineWidth', 1.5, 'MarkerSize', 5);
title('C. Espectro de Frecuencias (Visto por la FFT)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Frecuencia (Hz)', 'FontSize', 11);
ylabel('Magnitud Normalizada', 'FontSize', 11);
grid on;
set(gca, 'GridLineStyle', ':', 'FontSize', 10);
xlim([0 500]); % Zoom para ver los armónicos clave (50, 150, 250, 350)
ylim([0 1.1]);

% Etiquetas manuales en el espectro para las frecuencias clave
text(f0, Amplitud(floor(f0/(fs/N))+1) + 0.05, 'f0 (50Hz)', 'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold');
text(3*f0, Amplitud(floor(3*f0/(fs/N))+1) + 0.05, '3f0 (150Hz)', 'HorizontalAlignment', 'center', 'FontSize', 10);
text(5*f0, Amplitud(floor(5*f0/(fs/N))+1) + 0.05, '5f0 (250Hz)', 'HorizontalAlignment', 'center', 'FontSize', 10);
text(7*f0, Amplitud(floor(7*f0/(fs/N))+1) + 0.05, '7f0 (350Hz)', 'HorizontalAlignment', 'center', 'FontSize', 10);

exportgraphics(gcf, 'sintesis_fourier_onda.png', 'Resolution', 300);