function t = hypothesis(t, r, Theta)
    t = t*Theta(1) + t.*r*Theta(2) + r*Theta(3) + Theta(4);
end