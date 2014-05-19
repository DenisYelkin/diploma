%x = [mvnrnd(20, 5, 1000); mvnrnd(30, 5, 1000)];
%options = statset('Display','final');
%obj = gmdistribution.fit(x,2, 'Options', options);
obj = gmdistribution([20; 30], cat (3, 5, 5), [0.5; 0.5]);
obj2 = obj.random(1000);