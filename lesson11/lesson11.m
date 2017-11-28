% \title Lesson 11.
I = checkerboard();
I2 = imread('var10.png');
%% Checkerboard
% �������� ������� ��������� ������� ���� �� �����������, ������ ��� � ��
% �������� ��������� ��������� ��� ��������� FAST, �� ���� ����� ����� ��
% �����. ��� ��-�� ���� ��� �� ����������� ��� ����� L-����.
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
% ��� ������ ������� ����� ������ �����. ��� ���� �� ���������� ��������
% �����, ���������� �����. �������� ������� �� ����� ����, ���� � ����
% ������. �������� FAST ������� ������� ����� ������ ����� � �����������
% ��� ������� ������.
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