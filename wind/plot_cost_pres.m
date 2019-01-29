function plot_cost(re, rheo, pitch, cost)
    
    % Filter by pitch
    allpoints = [re,rheo,cost,pitch];
    
    % print best one
    bestpoint = allpoints(cost<-1.4,:)
    
    points_neg1 = allpoints(pitch==-1,:);
    points_3 = allpoints(pitch==3,:);
    points_5 = allpoints(pitch==5,:);
    points_7 = allpoints(pitch==7,:);
    points_9 = allpoints(pitch==9,:);
    
    % 3D plot
    close all
    figure
    scatter3(points_neg1(:,1),points_neg1(:,2),points_neg1(:,3),'r')
    hold on
    scatter3(points_3(:,1),points_3(:,2),points_3(:,3),'b')
    scatter3(points_5(:,1),points_5(:,2),points_5(:,3),'g')
    % hold on
    scatter3(points_7(:,1),points_7(:,2),points_7(:,3),'m')
    scatter3(points_9(:,1),points_9(:,2),points_9(:,3),'k')
    xlabel('')
    ylabel('Rheostat Value')
    zlabel('Cost')
    legend('Pitch -1','Pitch 3','Pitch 5','Pitch 7','Pitch 9')
    title('Cost vs Reynolds Number and Rheostat Value')
    
    % 2D plot: pitch on x-axis
    figure
    scatter(points_neg1(:,4),points_neg1(:,3),'r','filled')
    hold on
    scatter(points_3(:,4),points_3(:,3),'b','filled')
    scatter(points_5(:,4),points_5(:,3),'g','filled')
    scatter(points_7(:,4),points_7(:,3),'m','filled')
    scatter(points_9(:,4),points_9(:,3),'k','filled')
    xlabel('Pitch [degrees]')
    ylabel('Cost')
    legend('Pitch -1','Pitch 3','Pitch 5','Pitch 7','Pitch 9','location','west')
    title('Cost vs Blade Pitch, colored by Blade Pitch')
    
    % 2D plot: re on x-axis
    figure
%     scatter(points_neg1(:,1),points_neg1(:,3),'r')
%     hold on
%     scatter(points_3(:,1),points_3(:,3),'b')
%     scatter(points_5(:,1),points_5(:,3),'g')
%     scatter(points_7(:,1),points_7(:,3),'m')
    scatter(points_9(:,1),points_9(:,3),'k')
    xlabel('Reynolds Number')
    ylabel('Cost')
    legend('Pitch -1','Pitch 3','Pitch 5','Pitch 7','Pitch 9','location','southeast')
    title('Cost vs Reynolds Number, colored by Blade Pitch')
    
    % Circles plot of points for 3 blade
    
    figure
    x = points_7(:,1); % reynolds
    y = points_7(:,2); % rheo
    sz = 50;
    c = -5*points_7(:,3);
    scatter(x,y,sz,c,'filled')
    xlabel('Reynolds Number')
    ylabel('Rheostat Value')
    title('Cost Heat Scatter Plot for Pitch 7 degrees')
    ylim([-50,1050])
    colorbar
    
    

end