% --- 1. Parámetros de la señal ---
fs = 44100; % Frecuencia de muestreo
t1 = 0:1/fs:0.5-1/fs; % Primer medio segundo
t2 = 0:1/fs:0.5-1/fs; % Segundo medio segundo
t3 = 0:1/fs:1.0-1/fs; % Último segundo entero

% --- 2. creamos una melodia sintetica ---
nota1 = sin(2*pi*440*t1); % La4 (440 Hz) de 0 a 0.5s
nota2 = sin(2*pi*659*t2); % Mi5 (659 Hz) de 0.5 a 1.0s
acorde = sin(2*pi*440*t3) + sin(2*pi*659*t3); % Acorde de 1.0 a 2.0s
x = [nota1, nota2, acorde];
t_total = 0:1/fs:(length(x)-1)/fs;

% --- 3. CÁLCULO MANUAL DEL ESPECTROGRAMA ---
N = 2048;           % Tamaño de la ventana 
overlap = 1024;     % Solapamiento
hop = N - overlap;  % Salto entre ventanas 
num_frames = floor((length(x) - N) / hop); % Número total de fotogramas

% Eje de frecuencias (hasta 1500 Hz para hacer zoom)
f_axis = (0:N/2) * (fs / N);
idx_max = find(f_axis <= 1500, 1, 'last');
f_axis_plot = f_axis(1:idx_max);

% Matriz para guardar el espectrograma
espectrograma = zeros(idx_max, num_frames);

% --- CREAMOS LA VENTANA DE HAMMING ---
n_win = 0:(N-1);
ventana = 0.54 - 0.46 * cos(2*pi*n_win / (N-1));
t_frames = (0:num_frames-1) * hop / fs; 

for i = 1:num_frames
    inicio = (i-1)*hop + 1;
    fin = inicio + N - 1;
    fragmento = x(inicio:fin) .* ventana; 
    X = fft(fragmento); 
    mag = abs(X(1:idx_max)) * 2 / N; 
    espectrograma(:, i) = 20*log10(mag + 1e-6); 
end

% --- 4. Creación de la figura ---
% Definimos variables para poder cambiar todo el tamaño de golpe si hace falta
tam_fuente = 14; 
tam_titulo = 16; 

figure('Name', 'Análisis STFT Manual', 'Color', 'w', 'Position', [100, 100, 800, 600]);

% Gráfica Superior: Dominio del Tiempo
subplot(2,1,1);
plot(t_total, x, 'b', 'LineWidth', 1.5); % Línea un poco más gruesa
title('\textbf{Dominio del Tiempo: Secuencia Musical}', 'Interpreter', 'latex', 'FontSize', tam_titulo);
xlabel('Tiempo (s)', 'Interpreter', 'latex', 'FontSize', tam_fuente);
ylabel('Amplitud', 'Interpreter', 'latex', 'FontSize', tam_fuente);
xlim([0 2]);
grid on;
% hacemos grandes los números de los ejes X e Y
set(gca, 'FontSize', tam_fuente, 'TickLabelInterpreter', 'latex'); 

% Gráfica Inferior: Espectrograma (STFT)
subplot(2,1,2);
imagesc(t_frames, f_axis_plot, espectrograma);
axis xy; % Poner el origen Y=0 abajo
title('\textbf{Dominio Tiempo-Frecuencia: Espectrograma (STFT)}', 'Interpreter', 'latex', 'FontSize', tam_titulo);
xlabel('Tiempo (s)', 'Interpreter', 'latex', 'FontSize', tam_fuente);
ylabel('Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', tam_fuente);
colormap('jet');

% Ajustamos los números del eje del espectrograma
set(gca, 'FontSize', tam_fuente, 'TickLabelInterpreter', 'latex'); 

% Ajustar también la barra de colores lateral 
c = colorbar;
c.Label.String = 'Magnitud (dB)';
c.Label.Interpreter = 'latex';
c.Label.FontSize = tam_fuente;
c.TickLabelInterpreter = 'latex';
c.FontSize = tam_fuente; 


exportgraphics(gcf, 'espectrograma_stft.pdf', 'ContentType', 'vector');