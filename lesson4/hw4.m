I = imread('..\lesson3\alexa_grayscale.png');
rotI = imrotate(I,33,'crop');
figure, imshow(I), title('original')
%% Выделение контуров методом Марра-Хилдрет
mar_hildret = edge(I, 'log');
figure, imshow(mar_hildret), title('Marr-Hildret')
% Вывод: Контуры выделяются, но рваные, зашумленные.
%% Выделение контуров методом Кэнни
canny = edge(I, 'canny');
figure, imshow(canny), title('Canny')
% Вывод: Отлично выделяет контуры на изображении, рваных контуров гораздо меньше
%% Преобразование Хафа
BW = edge(rotI,'canny');
[H,T,R] = hough(BW);
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
title('Hough transform peaks')
plot(x,y,'s','color','white');
% Find lines and plot them
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');
title('Lines from hough transform')
% Вывод: Красиво находит линии. Со стандартными параметрами находит только прямые
% линии. Но метод можно настроить и на поиск кривых.
%% Пороговая обработка
thresh = im2bw(I, mean(mean(I))/256);
figure, imshow(thresh), title('Global threshold filter')
