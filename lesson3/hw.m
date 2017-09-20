a = imread('alexa_grayscale.png');
figure, imshow(a), title('original')
%% Erode
disk = strel('disk', 5, 0);
eroded = imerode(a, disk);
figure, imshow(eroded), title('erode')
% расширяет тёмные области, сужает яркие
%% Dilate
dilated = imdilate(a, disk);
figure, imshow(dilated), title('dilate')
% всё наоборот. Светлая рука набухла, тёмный костюм стал уже.
%% Morphological gradient
gradient = imsubtract(dilated, eroded);
figure, imshow(gradient), title('Morphological gradient')
% выделяет границы. Примитив надо выбирать так, чтобы он был больше
% характерного размера убираемых особенностией, но меньше интересующих
% исследователя структурных элементов.
%% Morphological open
figure, imshow(imopen(a, disk)), title('Morphological open')
% сглаживаются границы более светлых областей
%% Morphological close
figure, imshow(imclose(a, disk)), title('Morphological close')
% сглаживаются границы более тёмных областей
%% Top-hat
figure, imshow(imtophat(a, disk)), title('Top-hat')
% Выделяет светлые мелкие детали, важную информацию.
%% Bottomhat
figure, imshow(imbothat(a, disk)), title('Bottom-hat')
% Выделяет тёмные мелкие детали, важную информацию.