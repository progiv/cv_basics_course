% imread, imfilter, imshow, fspecial
% 1. ��������� ����������� ���������� ������������� ����������� � �������
% ������� 3x3, 5x5, 7x7. 
% 2. �������� ������, � ����������� �� ����
% ���������� �������� ������ ����� ��� ����������.
% 3. ���������
% ������������� �������� �� ����������� � ������� ����������� ���������
% ������� (�����: [0 1 0; 1 -4 1; 0 1 0], [1 1 1; 1 -8 1; 1 1 1]). 
% 4. �������� ������, ��� ���������� �����������. ������� �� ������� �����
% ���� ����� � ��������� ��������� (doc, pdf � �.�.) � �����, �������������
% � ��������. �������, ������� ����� ���� ������� (MATLAB): imread,
% imfilter, imshow, fspecial. *
I = imread('lib.jpg');
figure
imshow(I)
title('Original')
%% 1 Box filter
for sz = [3 5 7]
    figure
    imshow(imfilter(I, fspecial('average', sz)))
    title(sprintf('box%dx%d', sz, sz))
end
%% 2 mask size
% ������ ����� ����� �������� ������ �� ����������� �������� ���������,
% ������� ���������� �������������.
%% 3 �������� �������
% ������ �������� ������� ����������� �� ���� ������������, � �������� ��
% ��������� � �����������, ������� ����� ������������ ������������ �������.
L1 = [0 1 0; 1 -4 1; 0 1 0];
L2 = [1 1 1; 1 -8 1; 1 1 1];
figure
imshow(imfilter(I, L1))
title('Laplace operator 1')

figure
imshow(imfilter(I, L2))
title('Laplace operator 2')