% \title Lesson 11.
I = checkerboard();
I2 = imread('var10.png');
%% Checkerboard
% Детектор Харриса нормально находит углы на изображении, однако как я ни
% пробовал подобрать параметры для детектора FAST, он углы никак найти не
% может. Это из-за того что на изображении нет углов L-типа.
cornersHarris = detectHarrisFeatures(I);
cornersFAST = detectFASTFeatures(I);
h = figure();
subplot(1, 2, 1)
imshow(I), hold on
plot(cornersHarris), title('Harris')
subplot(1,2,2)
imshow(I), hold on
plot(cornersFAST), title('FAST')
set(h, 'Position', [100 100 500 500]); % to make it bigger
%% Sidney
% Оба метода находят много особых точек. При этом не получается выделить
% метод, работающий лучше. Детектор Харриса не нашёл окно, кран и углы
% зданий. Детектор FAST находит слишком много особых точек и расположены
% они слишком плотно.
cornersHarris = detectHarrisFeatures(I2);
cornersFAST = detectFASTFeatures(I2);
h = figure();
subplot(2, 1, 1)
imshow(I2), hold on
plot(cornersHarris), title('Harris')
subplot(2, 1, 2)
imshow(I2), hold on
plot(cornersFAST), title('FAST')
set(h, 'Position', [1 1 1000 800]); % to make it bigger