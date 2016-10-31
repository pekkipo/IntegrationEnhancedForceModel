function [p_sol ,v_sol, force] = get_data_forces(data)

p_sol=data(:,2:4)
v_sol=data(:,5:7);

force =data(:,8:10);

end


