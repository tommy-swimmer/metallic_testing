% Tensile Testing
% Tommy Swimmer
% February 9, 2020

clear
clc

%% Calculating Stress and Strain

clear
clc

% ------------------------------------------------------------------------
% -------------- CALCULATING STRESS AND STRAIN ---------------------------
% ------------------------------------------------------------------------

% Stress and Strain for A1 specimen
stressA1 = stress('A1',0.058065,1,11500);
strainA1 = strain('A1',1,11500);

% Stress and Strain for A2 specimen
stressA2 = stress('A2',0.060803,13,11300);
strainA2 = strain('A2',13,11300);

% Stress and Strain for A3 specimen
stressA3 = stress('A3',0.061352,16,11100);
strainA3 = strain('A3',16,11100);

% Stress and Strain for Q1 specimen
stressQ1 = stress('Q1',0.062267,14,1603);
strainQ1 = strain('Q1',14,1603);

% Stress and Strain for Q2 specimen
stressQ2 = stress('Q2',0.062612,16,1611);
strainQ2 = strain('Q2',16,1611);

% Stress and Strain for Q3 specimen
stressQ3 = stress('Q3',0.061273,14,1573);
strainQ3 = strain('Q3',14,1573);

% Stress and Strain for T1 specimen
stressT1 = stress('T1',0.04965,17,3323);
strainT1 = strain('T1',17,3323);

% Stress and Strain for T2 specimen
stressT2 = stress('T2',0.06049,17,3489);
strainT2 = strain('T2',17,3489);

% Stress and Strain for T3 specimen
stressT3 = stress('T3',0.05772,14,3341);
strainT3 = strain('T3',14,3341);

% ------------------------------------------------------------------------
% ------------------ PLOTTING DATA ---------------------------------------
% ------------------------------------------------------------------------

hold on
axis auto

plot(strainA1, stressA1,'--r','LineWidth',1.5)
plot(strainA2,  stressA2,'--m','LineWidth',1.5)
plot(strainA3, stressA3,'--b','LineWidth',1.5)
plot(strainQ1, stressQ1,':','LineWidth',1.5)
plot(strainQ2, stressQ2,':','LineWidth',1.5)
plot(strainQ3, stressQ3,':','LineWidth',1.5)
plot(strainT1, stressT1,'LineWidth',1.5)
plot(strainT2, stressT2,'m','LineWidth',1.5)
plot(strainT3, stressT3,'LineWidth',1.5)

title('Stress v. Strain','FontSize',14,'Interpreter', ...
    'latex')
xlabel('$\epsilon$ ($\%$)','FontSize',16,'Interpreter','latex')
ylabel('$\sigma$ (MPa)','Fontsize',16,'Interpreter','latex')
legend('A1','A2','A3','Q1','Q2','Q3','T1','T2','T3','Location','northeast')
grid on
box on

% ------------------------------------------------------------------------
% ----------------- CALCULATING MODULUS ----------------------------------
% ------------------------------------------------------------------------

[E_A1,polyA] = modulus(stressA1,strainA1);

[E_A2,polyA2] = modulus(stressA2,strainA2);

[E_A3,polyA3] = modulus(stressA3,strainA3);

[E_Q1,polyQ1] = modulus(stressQ1,strainQ1);

[E_Q2,polyQ2] = modulus(stressQ2,strainQ2);

[E_Q3,polyQ3] = modulus(stressQ3,strainQ3);

[E_T1,polyT1] = modulus(stressT1,strainT1);

[E_T2,polyT2] = modulus(stressT2,strainT2);

[E_T3,polyT3] = modulus(stressT3,strainT3);

% ------------------------------------------------------------------------
% ------------------ UTILIZING 0.2% OFFSET -------------------------------
% ------------------------------------------------------------------------

yieldA1 = yield(E_A1,polyA,stressA1,strainA1);

yieldA2 = yield(E_A1,polyA2,stressA2,strainA2);

yieldA3 = yield(E_A3,polyA3,stressA3,strainA3);

yieldQ1 = yield(E_Q1,polyQ1,stressQ1,strainQ1);

yieldQ2 = yield(E_Q2,polyQ2,stressQ2,strainQ2);

yieldQ3 = yield(E_Q3,polyQ3,stressQ3,strainQ3);

yieldT1 = yield(E_T1,polyT1,stressT1,strainT1);

yieldT2 = yield(E_T2,polyT2,stressT2,strainT2);

yieldT3 = yield(E_T3,polyT3,stressT3,strainT3);

% ------------------------------------------------------------------------
% ------------------ ULTIMATE STRENGTH -----------------------------------
% ------------------------------------------------------------------------

ultA1 = max(stressA1);

ultA2 = max(stressA2);

ultA3 = max(stressA3);

ultQ1 = max(stressQ1);

ultQ2 = max(stressQ2);

ultQ3 = max(stressQ3);

ultT1 = max(stressT1);

ultT2 = max(stressT2);

ultT3 = max(stressT3);

% ------------------------------------------------------------------------
% -------------------- AVERAGE MODULUS -----------------------------------
% ------------------------------------------------------------------------

modA = (E_A1 + E_A2 + E_A3) / 3;

modQ = (E_Q1 + E_Q2 + E_Q3) / 3;

modT = (E_T1 + E_T2 + E_T3) / 3;

% ------------------------------------------------------------------------
% -------------------- AVERAGE YIELD -------------------------------------
% ------------------------------------------------------------------------

yieldA = (yieldA1 + yieldA2 + yieldA3) / 3;

yieldQ = (yieldQ1 + yieldQ2 + yieldQ3) / 3;

yieldT = (yieldT1 + yieldT2 + yieldT3) / 3;

% ------------------------------------------------------------------------
% ------------------- AVERAGE ULTIMATE STRENGTH --------------------------
% ------------------------------------------------------------------------

ultA = (ultA1 + ultA2 + ultA3) / 3;

ultQ = (ultQ1 + ultQ2 + ultQ3) / 3;

ultT = (ultT1 + ultT2 + ultT3) / 3;

% ------------------------------------------------------------------------
% ------------------- HARDNESS PLOTTING ----------------------------------
% ------------------------------------------------------------------------
% Going in order from A, T, Q

hardA = [267.8 261.6 269.0];
hardT = [429.5 405.9 441.7];
hardQ = [405.0 393.1 433.6];

yield_A = [yieldA1 yieldA2 yieldA3];
yield_T = [yieldT1 yieldT2 yieldT3];
yield_Q = [ yieldQ1 yieldQ2 yieldQ3];

ult_A = [ultA1 ultA2 ultA3];
ult_T = [ultT1 ultT2 ultT3];
ult_Q = [ultQ1 ultQ2 ultQ3];

figure(2)
hold on
grid on
scatter(hardA, yield_A,'filled');
scatter(hardA, ult_A,'filled');

scatter(hardT, yield_T,'filled');
scatter(hardT, ult_T,'filled');

scatter(hardQ, yield_Q,'filled');
scatter(hardQ, ult_Q,'filled');

title('Stress v. Hardness','FontSize',14,'Interpreter', ...
    'latex')
xlabel('$HV$','FontSize',16,'Interpreter','latex')
ylabel('$\sigma$ (MPa)','Fontsize',16,'Interpreter','latex')
legend('A_{y}','A_{ult}','T_{y}','T_{ult}','Q_{y}','Q_{ult}','Location','northwest')
grid on
box on

% ------------------------------------------------------------------------
% ------------------------- LINEAR REGRESSION ----------------------------
% ------------------------------------------------------------------------

% For yield strength.

polyA = polyfit(hardA/100,yield_A,1);
linA = polyA(1)

polyT = polyfit(hardT/100,yield_T,1);
linT = polyT(1)

polyQ = polyfit(hardQ/100,yield_Q,1);
linQ = polyQ(1)

% For ultimate strength

polyA_ult = polyfit(hardA/100, ult_A,1);
linA_ult = polyA_ult(1)

polyT_ult = polyfit(hardA/100, ult_T,1);
linT_ult = polyT_ult(1)

polyQ_ult = polyfit(hardA/100, ult_Q, 1);
linQ_ult = polyQ_ult(1)











