prompt = 'Enter solution letter 1';
result1 = input(prompt);
cool_data1 = dlmread(result1, '.txt');

prompt = 'Enter solution letter 2';
result2 = input(prompt);
cool_data2 = dlmread(result2, '.txt');

[p_sol v_sol] = thing(cool_data1);
[p_sol1 v_sol1] = thing(cool_data2);

t=cool_data(:,1);

figure(1)
plot3(p_sol(:,1),p_sol(:,2),p_sol(:,3),'.r');
hold on
plot3(p_sol1(:,1),p_sol1(:,2),p_sol1(:,3),'.b');

