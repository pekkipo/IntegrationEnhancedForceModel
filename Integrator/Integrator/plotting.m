clc
clear all
close all

%% DATA READ
dataA = dlmread('SolutionA.txt');
dataB = dlmread('SolutionB.txt');
dataC = dlmread('SolutionC.txt');
dataD = dlmread('SolutionD.txt');
dataE = dlmread('SolutionE.txt');
dataF = dlmread('SolutionF.txt');
dataG = dlmread('SolutionG.txt');
dataH = dlmread('SolutionH.txt');
dataI = dlmread('SolutionI.txt');
dataJ = dlmread('SolutionJ.txt');
dataK = dlmread('SolutionK.txt');
dataL = dlmread('SolutionL.txt');
dataM = dlmread('SolutionM.txt');
dataN = dlmread('SolutionN.txt');
dataO = dlmread('SolutionO.txt');
dataP = dlmread('SolutionP.txt');
dataQ = dlmread('SolutionQ.txt');
dataR = dlmread('SolutionR.txt');
dataS = dlmread('SolutionS.txt');
dataT = dlmread('SolutionT.txt');
dataU = dlmread('SolutionU.txt');
dataV = dlmread('SolutionV.txt');

%% Prompt
prompt = 'Enter solution letter 1';
result1 = input(prompt);
letter = result1;

prompt = 'Enter solution letter 2';
result2 = input(prompt);

%% real stuff
t=dataA(:,1);
%% A
t_a=dataA(:,1)
p_a=dataA(:,2:4)
v_a=dataA(:,5:7)
%% B
t_b=dataB(:,1)
p_b=dataB(:,2:4)
v_b=dataB(:,5:7)
%% C
t_c=dataC(:,1)
p_c=dataC(:,2:4)
v_c=dataC(:,5:7)
%% D
t_d=dataD(:,1)
p_d=dataD(:,2:4)
v_d=dataD(:,5:7)
%% E
t_e=dataE(:,1)
p_e=dataE(:,2:4)
v_e=dataE(:,5:7)
%% F
t_f=dataF(:,1)
p_f=dataF(:,2:4)
v_f=dataF(:,5:7)
%% G
t_g=dataG(:,1)
p_g=dataG(:,2:4)
v_g=dataG(:,5:7)

figure(1)
plot3(p_a(:,1),p_a(:,2),p_a(:,3),'.r');
hold on
plot3(p_b(:,1),p_b(:,2),p_b(:,3),'.b');

dif_ab = p_b - p_a;
figure(3)
plot(t,dif_ab(:,1),'r', t,dif_ab(:,2),'b', t,dif_ab(:,3),'g');
% hold on
% plot(t,dif_ab(:,2),'.b');
% hold on
% plot(t,dif_ab(:,3),'.g');