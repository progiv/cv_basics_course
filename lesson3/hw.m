a = imread('alexa_grayscale.png');
figure, imshow(a), title('original')
%% Erode
disk = strel('disk', 5, 0);
eroded = imerode(a, disk);
figure, imshow(eroded), title('erode')
% ��������� ����� �������, ������ �����
%% Dilate
dilated = imdilate(a, disk);
figure, imshow(dilated), title('dilate')
% �� ��������. ������� ���� �������, ����� ������ ���� ���.
%% Morphological gradient
gradient = imsubtract(dilated, eroded);
figure, imshow(gradient), title('Morphological gradient')
% �������� �������. �������� ���� �������� ���, ����� �� ��� ������
% ������������ ������� ��������� �������������, �� ������ ������������
% ������������� ����������� ���������.
%% Morphological open
figure, imshow(imopen(a, disk)), title('Morphological open')
% ������������ ������� ����� ������� ��������
%% Morphological close
figure, imshow(imclose(a, disk)), title('Morphological close')
% ������������ ������� ����� ����� ��������
%% Top-hat
figure, imshow(imtophat(a, disk)), title('Top-hat')
% �������� ������� ������ ������, ������ ����������.
%% Bottomhat
figure, imshow(imbothat(a, disk)), title('Bottom-hat')
% �������� ����� ������ ������, ������ ����������.