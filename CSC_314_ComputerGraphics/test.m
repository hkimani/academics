%% triangle
v = [0 0; 1 0; 1 1; 0 1];
f = [1 1 2 3];
patch('Faces',f,'Vertices',v,'FaceColor','red')

%% flower
t=0:0.001:2*pi;
x=cos(t);
y=sin(t);
t=x.*y;
plot(x,y,'g','linewidth',8);
hold on;

%% 
plot(x,t,'r','linewidth',8);
hold on;

%%
plot(t,x,'b','linewidth',8);
hold on;

%%
axis square
hold on;
t=x.*0.5.*y;
plot(t,x,'c','linewidth',8);
hold on;
plot(x,t,'m','linewidth',8);
hold on;
plot(t,x,'c','linewidth',8);

%% bodies
n = 60; 
theta = linspace(0,2*pi,n);
theta = fliplr(theta);
head_radius = 1.0;

girl_head_X = -7 + (head_radius - 0.2)* cos(theta);
girl_head_Y = 10 + (head_radius - 0.2)* sin(theta);

plot(girl_head_X, girl_head_Y)

