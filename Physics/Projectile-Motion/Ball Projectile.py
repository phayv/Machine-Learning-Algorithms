from visual import *
from math import *

init_height = 5
init_velocity = 20
angle = 65

# Set up system
system = display(title = "Phay Projectile",x = 0, y = 0, \
                 width = 500, height = 500, \
                 range = 10, background = color.white, center = (10,init_height,0))


# Objects
table = box(pos = (-1, init_height-1, 0), size = (5,1,5))

ball = sphere(pos = (0,init_height,0),radius = 1, \
             color = color.blue, make_trail = True)

floor = box(pos = (0,0,0), size = (100,.10,10))

#--- added after running for 1 ball
ball2 = sphere(pos = (0,init_height,0),radius = 1, \
             color = color.red, make_trail = True)
init_velocity2 = 25

#-------------------------------------------------------------------------Run
t = 0
dt = .01
g = -32 #(ft/s^2) 

f_g = vector(0,g*dt,0)

#velocity vector for ball:
ball_v = vector(init_velocity*cos(angle*pi/180), init_velocity*sin(angle*pi/180), 0)

ball2_v = vector(init_velocity2*cos(angle*pi/180), init_velocity2*sin(angle*pi/180), 0)


# You can thread to run simultaneously
while True:
    rate(30)
    ball_v = ball_v + f_g
    ball.pos += ball_v*dt
    
    if ball.y < 0:
        print "ball.pos: ", ball.pos, "\n"
        print "time: ", t, "\n"      
        break
    t += dt

while True:
    rate(30)
    ball2_v = ball2_v + f_g
    ball2.pos += ball2_v*dt
    
    if ball2.y < 0:
        print "ball.pos: ", ball2.pos, "\n"
        print "time: ", t, "\n"
        break
    t += dt
