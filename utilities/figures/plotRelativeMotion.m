function [] = plotRelativeMotion(time, telem, plot_type)
    if plot_type == "solo"
        apogee_idx = 1;
        [~,perigee_idx] = min(abs(time-3.532572227135039e+04));
        figure
        
        subplot(2, 1, 1)
        title("Relative Motion in T-R Plane")
        plot(telem.("relativeState")(1:end,2),telem.("relativeState")(1:end,1))
        axis equal;
        xlabel("\delta r_t [m]")
        ylabel("\delta r_r [m]")
        hold on;
        % Perigee
        scatter([telem.("relativeState")(perigee_idx,2), telem.("relativeState")(perigee_idx*3,2)],[telem.("relativeState")(perigee_idx,1), telem.("relativeState")(perigee_idx*3,1)],"MarkerFaceColor","g")
        % Apogee
        scatter([telem.("relativeState")(apogee_idx,2), telem.("relativeState")(perigee_idx*2,2)],[telem.("relativeState")(apogee_idx,1), telem.("relativeState")(perigee_idx*2,1)],"MarkerFaceColor","r")
        legend("Deputy Trajectory", "Perigee", "Apogee")
        grid on;
        
        subplot(2, 1, 2)
        title("Relative Motion in N-R Plane")
        plot(telem.("relativeState")(1:end,3),telem.("relativeState")(1:end,1))
        xlabel("\delta r_n [m]")
        ylabel("\delta r_r [m]")
        hold on;
        % Perigee
        scatter([telem.("relativeState")(perigee_idx,3), telem.("relativeState")(perigee_idx*3,3)],[telem.("relativeState")(perigee_idx,1), telem.("relativeState")(perigee_idx*3,1)],"MarkerFaceColor","g")
        % Apogee
        scatter([telem.("relativeState")(apogee_idx,3), telem.("relativeState")(perigee_idx*2,3)],[telem.("relativeState")(apogee_idx,1), telem.("relativeState")(perigee_idx*2,1)],"MarkerFaceColor","r")
        legend("Deputy Trajectory", "Perigee", "Apogee")
        grid on;
    else
    figure
    set(gcf,'position',[300,300,800,800])
    subplot(6,1,1)
    hold on;
    title("Relative X Position vs Time")
    plot(time/3600,telem.("relativeState")(1:end,1),"LineWidth",1)
    plot(time/3600,telem.("Relative Cartesian State RTN")(1:end,1),"LineWidth",1)
    legend("Direct","Difference")
    xlabel("t [hr]")
    ylabel("\delta r_r [m]")
    grid on;
    
    subplot(6,1,2)
    hold on;
    title("Relative Y Position vs Time")
    plot(time/3600,telem.("relativeState")(1:end,2),"LineWidth",1)
    plot(time/3600,telem.("Relative Cartesian State RTN")(1:end,2),"LineWidth",1)
    legend("Direct","Difference")
    xlabel("t [hr]")
    ylabel("\delta r_t [m]")
    grid on;
    
    subplot(6,1,3)
    hold on;
    title("Relative Z Position vs Time")
    plot(time/3600,telem.("relativeState")(1:end,3),"LineWidth",1)
    plot(time/3600,telem.("Relative Cartesian State RTN")(1:end,3),"LineWidth",1)
    legend("Direct","Difference")
    xlabel("t [hr]")
    ylabel("\delta r_n [m]")
    grid on;
    
    subplot(6,1,4)
    hold on;
    title("Relative X Velocity vs Time")
    plot(time/3600,telem.("relativeState")(1:end,4),"LineWidth",1)
    plot(time/3600,telem.("Relative Cartesian State RTN")(1:end,4),"LineWidth",1)
    legend("Direct","Difference")
    xlabel("t [hr]")
    ylabel("\delta v_r [m/s]")
    grid on;
    
    subplot(6,1,5)
    hold on;
    title("Relative Y Velocity vs Time")
    plot(time/3600,telem.("relativeState")(1:end,5),"LineWidth",1)
    plot(time/3600,telem.("Relative Cartesian State RTN")(1:end,5),"LineWidth",1)
    legend("Direct","Difference")
    xlabel("t [hr]")
    ylabel("\delta v_t [m/s]")
    grid on;
    
    subplot(6,1,6)
    hold on;
    title("Relative Z Velocity vs Time")
    plot(time/3600,telem.("relativeState")(1:end,6),"LineWidth",1)
    plot(time/3600,telem.("Relative Cartesian State RTN")(1:end,6),"LineWidth",1)
    legend("Direct","Difference")
    xlabel("t [hr]")
    ylabel("\delta v_n [m/s]")
    grid on;
    end
end