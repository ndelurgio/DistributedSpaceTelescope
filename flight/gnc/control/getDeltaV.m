function [DeltaV,t] = getDeltaV(ROE,location,OE,mu)
if norm(ROE) == 0
    DeltaV = [0,0,0];
    t = 0;
else
    e = OE(2);
    M0 = nu2M(OE(6), e);
    Mf = nu2M(location,e);
    n = meanMotion(mu,OE(1));
    t = (Mf-M0)/n;
    if ROE(1) ~= 0
        da = ROE(1);
        eta = sqrt(1-e)^2;
        dvt = n*OE(1)/(eta*2*(1+e*cos(location)));
        DeltaV = [0,dvt,0];
    elseif norm(ROE(5:6)) > 0
        di = norm(ROE(5:6));
        dvn = di*n*OE(1)*(1+e*cos(location))/eta^3;
        DeltaV = [0,0,dvn];
    end
end

end

