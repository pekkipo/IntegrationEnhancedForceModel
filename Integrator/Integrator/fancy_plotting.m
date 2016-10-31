clc
clear all
close all


%% Input solution letter
prompt = 'Enter solution letter 1  ';
sol_letter_1 = input(prompt,'s');
data1 = load(['Solution' sol_letter_1 '.txt']);

prompt = 'Enter solution letter 2  ';
sol_letter_2  = input(prompt,'s');
data2 = load(['Solution' sol_letter_2 '.txt']);

t=data1(:,1);
%% Two cases with air drag and solar pressure comparison
if (sol_letter_1 == 'N' &&  sol_letter_2 == 'D') || (sol_letter_1 == 'O' &&  sol_letter_2 == 'E')
[p_sol_1, v_sol_1, force1] = get_data_forces(data1);
[p_sol_2, v_sol_2, force2] = get_data_forces(data2);
dif_forces_matrix = force2 - force1;
figure(3)
plot(t,dif_forces_matrix(:,1),'r', t,dif_forces_matrix(:,2),'b', t,dif_forces_matrix(:,3),'g');
figure(3)
title(['Surface forces comparison  ', num2str(sol_letter_1),' and ',num2str(sol_letter_2),' solution']);
legend('x','y','z','Location','northwest');
xlabel('t(s)');
ylabel('Forces difference(m/s2)');
grid on

maximum_xf = max(dif_forces_matrix(:,1)); 
maximum_yf = max(dif_forces_matrix(:,2)); 
maximum_zf = max(dif_forces_matrix(:,3)); 
minimum_xf = min(dif_forces_matrix(:,1)); 
minimum_yf = min(dif_forces_matrix(:,2)); 
minimum_zf = min(dif_forces_matrix(:,3)); 
rms_xf = rms(dif_forces_matrix(:,1)); 
rms_yf = rms(dif_forces_matrix(:,2)); 
rms_zf = rms(dif_forces_matrix(:,3)); 

super_table_forces = [maximum_xf, minimum_xf, rms_xf, maximum_yf, minimum_yf, rms_yf, maximum_zf, minimum_zf, rms_zf];

end

%% Getting required matrices
[p_sol_1, v_sol_1] = get_data(data1);
[p_sol_2, v_sol_2] = get_data(data2);

difference_matrix_position = p_sol_2 - p_sol_1;
difference_matrix_velocity = v_sol_2 - v_sol_1;

%% Plot the orbits
figure(2)
subplot(2,2,[1 3])
plot3(p_sol_1(:,1),p_sol_1(:,2),p_sol_1(:,3),'.r');
hold on
plot3(p_sol_2(:,1),p_sol_2(:,2),p_sol_2(:,3),'.b');

%% Plot the differences
figure(2)
subplot(2,2,2)
plot(t,difference_matrix_position(:,1),'r', t,difference_matrix_position(:,2),'b', t,difference_matrix_position(:,3),'g');
hold on
subplot(2,2,4)
plot(t,difference_matrix_velocity(:,1),'r', t,difference_matrix_velocity(:,2),'b', t,difference_matrix_velocity(:,3),'g');
%% Plots information
figure(2)
subplot(2,2,[1 3])
title(['Orbits comparison of  ', num2str(sol_letter_1),' and ',num2str(sol_letter_2),' solution']);
legend(num2str(sol_letter_1), num2str(sol_letter_2), 'Location','northwest');
xlabel('x');
ylabel('y');
zlabel('z');
grid on
subplot(2,2,2)
title(['Position difference  ', num2str(sol_letter_1),' and ',num2str(sol_letter_2),' solution']);
legend('x-position','y-position','z-position','Location','northwest');
xlabel('t(s)');
ylabel('Position difference(m)');
grid on
subplot(2,2,4)
title(['Velocity difference ', num2str(sol_letter_1),' and ',num2str(sol_letter_2),' solution']);
legend('x-velocity','y-velocity','z-velocity','Location','northwest');
xlabel('t(s)');
ylabel('Velocity difference(m/s)');
grid on

%% Table of values

maximum_x = max(difference_matrix_position(:,1)); 
maximum_y = max(difference_matrix_position(:,2)); 
maximum_z = max(difference_matrix_position(:,3)); 
maximum_xv = max(difference_matrix_velocity(:,1)); 
maximum_yv = max(difference_matrix_velocity(:,2)); 
maximum_zv = max(difference_matrix_velocity(:,3)); 

minimum_x = min(difference_matrix_position(:,1)); 
minimum_y = min(difference_matrix_position(:,2)); 
minimum_z = min(difference_matrix_position(:,3)); 
minimum_xv = min(difference_matrix_velocity(:,1)); 
minimum_yv = min(difference_matrix_velocity(:,2)); 
minimum_zv = min(difference_matrix_velocity(:,3)); 

rms_x = rms(difference_matrix_position(:,1)); 
rms_y = rms(difference_matrix_position(:,2)); 
rms_z = rms(difference_matrix_position(:,3)); 
rms_xv = rms(difference_matrix_velocity(:,1)); 
rms_yv = rms(difference_matrix_velocity(:,2)); 
rms_zv = rms(difference_matrix_velocity(:,3)); 

super_table = [maximum_x, minimum_x, rms_x, maximum_y, minimum_y, rms_y, maximum_z, minimum_z, rms_z, maximum_xv, minimum_xv, rms_xv, maximum_yv, minimum_yv, rms_yv, maximum_zv, minimum_zv, rms_zv]
