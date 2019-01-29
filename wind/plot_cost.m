function plot_cost(re, rheo, pitch, cost)
    
    % Filter by pitch
    allpoints = [re,rheo,cost];
    
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
    subplot(2,2,[1,3]);
    scatter3(points_neg1(:,1),points_neg1(:,2),points_neg1(:,3),'r')
    hold on
    scatter3(points_3(:,1),points_3(:,2),points_3(:,3),'b')
    scatter3(points_5(:,1),points_5(:,2),points_5(:,3),'g')
    % hold on
    scatter3(points_7(:,1),points_7(:,2),points_7(:,3),'m')
    scatter3(points_9(:,1),points_9(:,2),points_9(:,3),'k')
    xlabel('Reynolds Number')
    ylabel('Rheostat Value')
    zlabel('Cost')
    legend('Pitch -1','Pitch 3','Pitch 5','Pitch 7','Pitch 9')
    title('Cost vs Reynolds Number and Rheostat Value')
    
    % 2D plot: rheo on x-axis
    subplot(2,2,2);
    scatter(points_neg1(:,2),points_neg1(:,3),'r')
    hold on
    scatter(points_3(:,2),points_3(:,3),'b')
    scatter(points_5(:,2),points_5(:,3),'g')
    scatter(points_7(:,2),points_7(:,3),'m')
    scatter(points_9(:,2),points_9(:,3),'k')
    xlabel('Rheostat Value')
    ylabel('Cost')
    legend('Pitch -1','Pitch 3','Pitch 5','Pitch 7','Pitch 9','location','southwest')
    title('Cost vs Rheostat Value, colored by Blade Pitch')
    
    % 2D plot: re on x-axis
    subplot(2,2,4);
    scatter(points_neg1(:,1),points_neg1(:,3),'r')
    hold on
    scatter(points_3(:,1),points_3(:,3),'b')
    scatter(points_5(:,1),points_5(:,3),'g')
    scatter(points_7(:,1),points_7(:,3),'m')
    scatter(points_9(:,1),points_9(:,3),'k')
    xlabel('Reynolds Number')
    ylabel('Cost')
    legend('Pitch -1','Pitch 3','Pitch 5','Pitch 7','Pitch 9','location','southeast')
    title('Cost vs Reynolds Number, colored by Blade Pitch')
    
    % 3D surf plot of points
    figure
    surf(points_5(:,1),points_5(:,2),points_5(:,3))
    

end