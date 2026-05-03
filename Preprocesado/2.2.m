% --- 1. Parámetros de la señal para el acorde complejo ---
fs = 44100; % Frecuencia de muestreo (CD)
duration = 0.05; % Segundos 
t = 0:1/fs:duration;

% --- 2. Generación de las tres notas (La Mayor: La, Do#, Mi) ---
f1 = 440.00; % Nota La4
f2 = 554.37; % Nota Do#5
f3 = 659.25; % Nota Mi5

% Señal compuesta: suma de tres sinusoides con distintas amplitudes
x = 1.0 * sin(2*pi*f1*t) + 0.8 * sin(2*pi*f2*t) + 0.6 * sin(2*pi*f3*t);

% --- 3. Cálculo de la FFT (Solo magnitud positiva normalizada) ---
N = length(x);
X_fft = fft(x);
f_axis = (0:N/2-1)*(fs/N); % Eje de frecuencias positivas
Amplitud = (2.0/N) * abs(X_fft(1:N/2)); % Magnitud normalizada real

% --- 4. Creación de la figura ---
figure('Name', 'Tiempo vs Frecuencia', 'Color', 'w', 'Position', [100, 100, 800, 500]);

% --- Dominio del Tiempo (Oscilograma) ---
subplot(2,1,1);
plot(t * 1000, x, 'Color', [0 0.4470 0.7410], 'LineWidth', 1.2);
title('Dominio del Tiempo: Forma de Onda (Acorde Complejo)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Tiempo (ms)', 'FontSize', 11);
ylabel('Amplitud', 'FontSize', 11);
grid on;
set(gca, 'GridLineStyle', ':', 'FontSize', 10);
xlim([0 duration * 1000]);

% --- Dominio de la Frecuencia ---
subplot(2,1,2);

plot(f_axis, Amplitud, 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1.5);
title('Dominio de la Frecuencia: Espectro (Notas y Frecuencias)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Frecuencia (Hz)', 'FontSize', 11);
ylabel('Magnitud', 'FontSize', 11);
grid on;
set(gca, 'GridLineStyle', ':', 'FontSize', 10);

% Hacemos Zoom en la zona que nos interesa (de 350 a 750 Hz)
xlim([350 750]);
ylim([0 1.2]); % Espacio extra arriba para las etiquetas

% --- AÑADIMOS ETIQUETAS A LOS PICOS ---
% Nota La4 (440 Hz)
text(f1, 1.05, 'La (440 Hz)', 'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold', 'BackgroundColor', 'w');
% Nota Do#5 (554 Hz)
text(f2, 0.85, 'Do# (554 Hz)', 'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold', 'BackgroundColor', 'w');
% Nota Mi5 (659 Hz)
text(f3, 0.65, 'Mi (659 Hz)', 'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold', 'BackgroundColor', 'w');


exportgraphics(gcf, 'tiempo_frecuencia_notas_espanol.png', 'Resolution', 300);