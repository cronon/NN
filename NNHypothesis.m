function p = NNHypothesis(inner_t, outer_t, r, Theta)
    th1 = reshape(Theta(1:12), 3, 4);
    a2 = th1*[1 inner_t outer_t r]';
    a2 = [1; a2];
    th2 = reshape(Theta(13:24), 3, 4);
    a3 = th2*a2;
    a3 = [1; a3];
    th3 = Theta(24:27);
    p = th3*a3;
end
