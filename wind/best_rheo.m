function opt0 = best_rheo(re, rheo, pitch, eff, fan_speed, cd)

    % Filter by pitch
    allpoints = [re,rheo,pitch,eff,fan_speed,cd];
    
    eff0 = eff;
    eff250 = eff;
    eff500 = eff;
    % points_0 = allpoints(rheo==0,:);
    % opt0 = points_0(eff0==max(points_0(:,4)),:)
    
    % points_250 = allpoints(rheo==250,:);
    % opt0 =points_250(21,:)
    % points_250(:,4)
    % max(points_250(:,4))
    % opt250 = points_250(eff250==max(points_250(:,4)),:)
    
    % points_500 = allpoints(rheo==500,:);
    % opt500 = points_500(eff==max(points_500(:,4)),:)
    % opt0 =points_500(53,:)
    % max(points_500(:,4))
    
    % points_750 = allpoints(rheo==750,:);
    % opt750 = points_750(eff==max(points_750(:,4)),:)
    % opt0 = points_750(20,:)
    % max(points_750(:,4))
    
    points_1000 = allpoints(rheo==1000,:);
    % opt1000 = points_1000(eff==max(points_1000(:,4)),:)
    opt0 =points_1000(50,:)
    max(points_1000(:,4))
    
end